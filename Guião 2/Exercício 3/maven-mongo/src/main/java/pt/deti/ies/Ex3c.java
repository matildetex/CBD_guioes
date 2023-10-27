package pt.deti.ies;


import java.util.Arrays;
import org.bson.Document;
import org.bson.conversions.Bson;

import com.mongodb.MongoException;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Accumulators;
import com.mongodb.client.model.Aggregates;
import com.mongodb.client.model.Filters;


public class Ex3c {

    public static void main( String[] args ) {

        String uri = "mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.0.1";

        try (MongoClient mongoClient = MongoClients.create(uri)) {

            MongoDatabase database = mongoClient.getDatabase("cbd");
            MongoCollection<Document> collection = database.getCollection("restaurants");


            // Queries
            //3. Apresente os campos restaurant_id, nome, localidade e código postal (zipcode), mas exclua o campo _id de todos os documentos da coleção.
                Document projection_3 = new Document("_id", 0)
                    .append("restaurant_id", 1)
                    .append("nome", 1)
                    .append("localidade", 1)
                    .append("address.zipcode", 1);

                MongoCursor<Document> cursor3 = collection.find().projection(projection_3).iterator();

                System.out.println("\n Query 3 Result:\n");
                while (cursor3.hasNext()) {
                    Document document3 = cursor3.next();
                    System.out.println(document3.toJson());
                }
                cursor3.close(); 

            //8. Indique os restaurantes com latitude inferior a -95,7.
                Bson filter8 = Filters.lt("address.coord.0", -95.7);
                        MongoCursor<Document> cursor8= collection.find(filter8).iterator();
                        System.out.println("\nQuery 8 Result:\n");
                        while (cursor8.hasNext()) {
                            Document document8 = cursor8.next();
                            System.out.println(document8.toJson());
                        }
                        cursor8.close(); 

            //12. Liste o restaurant_id, o nome, a localidade e a gastronomia dos restaurantes localizados em "Staten Island", "Queens", ou "Brooklyn".

                Bson filter_st = Filters.eq("localidade", "Staten Island");
                Bson filter_qu = Filters.eq("localidade", "Queens");
                Bson filter_br = Filters.eq("localidade", "Brooklyn");
                Bson combinedFilter = Filters.or(filter_st, filter_qu, filter_br);
                        MongoCursor<Document> cursor12 = collection.find(combinedFilter).iterator();
                        System.out.println("\nQuery 17 Result:\n");
                        while (cursor12.hasNext()) {
                            Document document12 = cursor12.next();
                            System.out.println(document12.toJson());
                        }
                        cursor12.close(); 
                
            // 17. Liste nome, gastronomia e localidade de todos os restaurantes ordenando por ordem
            // crescente da gastronomia e, em segundo, por ordem decrescente de localidade.
                Document projection_17 = new Document()
                    .append("nome", 1)
                    .append("gastronomia", 1)
                    .append("localidade", 1);

                MongoCursor<Document> cursor17 = collection.find()
                    .projection(projection_17)
                    .sort(new Document("gastronomia", 1).append("localidade", -1))
                    .iterator();
                System.out.println("\nQuery 17 Result:\n");
                while (cursor17.hasNext()) {
                    Document document17 = cursor17.next();
                    System.out.println(document17.toJson());
                }

                cursor17.close();

            //22. Conte o total de restaurante existentes em cada localidade.

                AggregateIterable<Document> result22 = collection.aggregate(Arrays.asList(
                Aggregates.group("$localidade", Accumulators.sum("count", 1))
            ));

                MongoCursor<Document> cursor22 = result22.iterator();
                    System.out.println("\nQuery 17 Result:\n");
                    while (cursor22.hasNext()) {
                        Document document22 = cursor22.next();
                        String localidade = document22.getString("_id");
                        int restaurantCount22 = document22.getInteger("count");
                        System.out.println("Localidade: " + localidade + " - Total de restaurantes: " + restaurantCount22);     
                    }

                    cursor22.close();

            mongoClient.close();
            
        } catch (MongoException me) {
            System.err.println("Unable to insert due to an error: " + me);
        }
    }
}

