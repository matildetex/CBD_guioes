package pt.deti.ies;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.TimeZone;

import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import com.mongodb.MongoException;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;
import com.mongodb.client.result.InsertOneResult;

public class Ex3a {

    public static void main( String[] args ) {

        String uri = "mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.0.1";

        try (MongoClient mongoClient = MongoClients.create(uri)) {

            MongoDatabase database = mongoClient.getDatabase("cbd");
            MongoCollection<Document> collection = database.getCollection("restaurants");


            SimpleDateFormat isoDateFormatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
            isoDateFormatter.setTimeZone(TimeZone.getTimeZone("UTC"));

            try {
                //Inserção Registos
                String isoDate1 = isoDateFormatter.format(new Date());
                String isoDate2 = isoDateFormatter.format(new Date());
                String isoDate3 = isoDateFormatter.format(new Date());

                InsertOneResult result = collection.insertOne(new Document()
                    .append("_id", new ObjectId())
                    .append("address", new Document()
                        .append("building", "5678")
                        .append("coord", Arrays.asList(-77.098765, 23.6386026))
                        .append("rua", "Pacman Avenue")
                        .append("zipcode", "98765"))
                    .append("localidade", "City Of Lights")
                    .append("gastronomia", "Struddel")
                    .append("grades", Arrays.asList(
                        new Document()
                            .append("date", isoDate1)
                            .append("grade", "C")
                            .append("score", 5),
                        new Document()
                            .append("date", isoDate2)
                            .append("grade", "B")
                            .append("score", 4),
                        new Document()
                            .append("date", isoDate3)
                            .append("grade", "A")
                            .append("score", 10)
                    ))
                    .append("nome", "Wonderland of Flavors")
                    .append("restaurant_id", "40234560"));

                    System.out.println("REGISTO INSERIDO :" + result.getInsertedId());

                    //Editar Registo
                    Bson filter = Filters.eq("restaurant_id", "40234560");
                    Bson update = Updates.set("nome", "New Restaurant Name");
                    collection.updateOne(filter, update);
                    Document modifiedDocument = collection.find(filter).first();
                    System.out.println("EDIÇÃO:" + modifiedDocument);

                    //Pesquisa
                    Bson filter_for_pesquisa = Filters.eq("localidade", "City Of Lights");
                    MongoCursor<Document> cursor = collection.find(filter_for_pesquisa).iterator();
                    while (cursor.hasNext()) {
                        Document document = cursor.next();
                        System.out.println("PESQUISA:"+ document.toJson());
                    }
                    cursor.close(); 

            } catch (MongoException me) {
                System.err.println("Unable to insert due to an error: " + me);
            }
        mongoClient.close();
        }
    }
}
