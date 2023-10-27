package pt.deti.ies;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Accumulators;
import com.mongodb.client.model.Aggregates;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Projections;

import org.bson.Document;
import org.bson.conversions.Bson;

import com.mongodb.MongoException;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.DistinctIterable;
import com.mongodb.client.FindIterable;

import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

public class Ex3d {
    static MongoCollection<Document> collection;
    
    public static void main(String[] args) {

        
        String uri = "mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.0.1";

        MongoClient mongoClient = MongoClients.create(uri);
        MongoDatabase database = mongoClient.getDatabase("cbd");
        collection = database.getCollection("restaurants");

        try{
            FileOutputStream file = new FileOutputStream("CBD_L203_108193.txt");
            try(PrintStream out = new PrintStream(file, true)){

                out.println("Numero de localidades distintas: " + countLocalidades());

                out.println("\n\nNumero de restaurantes por localidade:");
                for (Map.Entry<String, Integer> entry : countRestByLocalidade().entrySet()) {
                    out.println(" -> " + entry.getKey() + " - " + entry.getValue());
                }

                out.println("\n\nNome de restaurantes contendo 'Park' no nome:");
                for (String nome : getRestWithNameCloserTo("Park")) {
                    out.println(" -> " + nome);
                }
                }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        mongoClient.close();
    }
    }


    public static int countLocalidades() {
        int quantidade=0;
        DistinctIterable<String> names = collection.distinct("localidade", String.class);
        for(String element: names){
            quantidade++;
        }
        return quantidade;
    } 

    public static Map<String,Integer> countRestByLocalidade() {
        Map<String,Integer> restLocalidade = new HashMap<String,Integer>();

        Bson group = Aggregates.group("$localidade", Accumulators.sum("count", 1));
        List<Bson> array = Arrays.asList(group);
        AggregateIterable<Document> result = collection.aggregate(array);

        for (Document document : result) {
            String localidade = document.getString("_id");
            int numRes = document.getInteger("count");
            restLocalidade.put(localidade, numRes);
        }
        return restLocalidade;

    }

    public static List<String> getRestWithNameCloserTo(String name) {
    List<String> restaurants = new ArrayList<String>();
    Document filter = new Document("nome", new Document("$regex", name).append("$options", "i"));
    collection.find(filter).projection(Projections.excludeId()).forEach(document -> {
        String nome = document.getString("nome");
        restaurants.add(nome);
    });
        return restaurants;  
    }

}