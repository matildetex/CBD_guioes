package pt.deti.ies;

import org.bson.Document;
import org.bson.conversions.Bson;
import com.mongodb.MongoException;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;



public class Ex3b {

    public static void main(String[] args) {

        String uri = "mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.0.1";

        MongoClient mongoClient = null;

        try {
            mongoClient = MongoClients.create(uri);

            MongoDatabase db = mongoClient.getDatabase("cbd");
            MongoCollection<Document> restaurants = db.getCollection("restaurants");
            System.out.println("======================== WITHOUT INDEXES ===========================");

            Bson filter_local = Filters.eq("localidade", "Brooklynn");

            Bson filter_gas = Filters.eq("gastronomia", "Portuguese");

            Bson filter_nome = Filters.eq("nome", "Great Wall Restaurant");

            // Filtro "localidade"
            Document exp_loc1 = db.getCollection("restaurants").find(filter_local).explain();
            Document executionStats_loc1 = exp_loc1.get("executionStats", Document.class);
            int executionTime_loc1 = executionStats_loc1.get("executionTimeMillis", Integer.class);
            System.out.println("----------------------------------------------------Execution Stats for 'localidade':--------------------------------------------------------------------");
            System.out.println(executionStats_loc1.toJson());

            // Filtro "gastronomia"
            Document exp_gas1=db.getCollection("restaurants").find(filter_gas).explain();
            Document executionStats_gas1 = exp_gas1.get("executionStats", Document.class);
            int executionTime_gas1 = executionStats_gas1.get("executionTimeMillis", Integer.class);
            System.out.println("----------------------------------------------------Execution Stats for 'gastronomia':--------------------------------------------------------------------");
            System.out.println(executionStats_gas1.toJson());

            // Filtro "nome"
            Document exp_nome1=db.getCollection("restaurants").find(filter_nome).explain();
            Document executionStats_nome1 = exp_nome1.get("executionStats", Document.class);
            int executionTime_nome1 = executionStats_nome1.get("executionTimeMillis", Integer.class);
            System.out.println("----------------------------------------------------Execution Stats for 'nome':-------------------------------------------------------------------------");
            System.out.println(executionStats_nome1.toJson());

            // Índices
            System.out.println("======================== WITH INDEXES ===========================");
            System.out.println("CREATING INDEXES =================");
            // localidade
            restaurants.createIndex(new Document("localidade", 1));
            // gastronomia
            restaurants.createIndex(new Document("gastronomia", 1));
            // texto
            restaurants.createIndex(new Document("nome", 1));


            // Testar Funcionamento e Desempenho

            Bson filter_local2 = Filters.eq("localidade", "Brooklynn");

            Bson filter_gas2 = Filters.eq("gastronomia", "Portuguese");

            Bson filter_nome2 = Filters.eq("nome", "Great Wall Restaurant");

           // Filtro "localidade"
            Document exp_loc2 = db.getCollection("restaurants").find(filter_local2).explain();
            Document executionStats_loc2 = exp_loc2.get("executionStats", Document.class);
            int executionTime_loc2 = executionStats_loc2.get("executionTimeMillis",Integer.class);
            System.out.println("----------------------------------------------------Execution Stats for 'localidade':--------------------------------------------------------------------");
            System.out.println(executionStats_loc2.toJson());

            // Filtro "gastronomia"
            Document exp_gas2=db.getCollection("restaurants").find(filter_gas2).explain();
            Document executionStats_gas2 = exp_gas2.get("executionStats", Document.class);
            int executionTime_gas2 = executionStats_gas2.get("executionTimeMillis", Integer.class);
            System.out.println("----------------------------------------------------Execution Stats for 'gastronomia':--------------------------------------------------------------------");
            System.out.println(executionStats_gas2.toJson());

            // Filtro "nome"
            Document exp_nome2=db.getCollection("restaurants").find(filter_nome2).explain();
            Document executionStats_nome2 = exp_nome2.get("executionStats", Document.class);
            int executionTime_nome2 = executionStats_nome2.get("executionTimeMillis", Integer.class);
            System.out.println("----------------------------------------------------Execution Stats for 'nome':--------------------------------------------------------------------");
            System.out.println(executionStats_nome2.toJson());

            System.out.println("======================== DROPING INDEXES ===========================");

            restaurants.dropIndex("localidade_1");
            restaurants.dropIndex("gastronomia_1");
            restaurants.dropIndex("nome_1");

            System.out.println("======================== EXECUTION TIMES ===========================");
            System.out.println("Execution Time for 'localidade' (SEM ÍNDICES): " + executionTime_loc1 + " ms");
            System.out.println("Execution Time for 'gastronomia' (SEM ÍNDICES): " + executionTime_gas1 + " ms");
            System.out.println("Execution Time for 'nome' (SEM ÍNDICES): " + executionTime_nome1 + " ms");
            System.out.println("Execution Time for 'localidade' (COM ÍNDICES): " + executionTime_loc2 + " ms");
            System.out.println("Execution Time for 'gastronomia' (COM ÍNDICES): " + executionTime_gas2 + " ms");
            System.out.println("Execution Time for 'nome' (COM ÍNDICES): " + executionTime_nome2 + " ms");

            System.out.println("======================== TIME DIFFERENCE ===========================");
            System.out.println("Time Difference for 'localidade': " + (executionTime_loc1 - executionTime_loc2) + " ms");
            System.out.println("Time Difference for 'gastronomia': " + (executionTime_gas1 - executionTime_gas2) + " ms");
            System.out.println("Time Difference for 'nome': " + (executionTime_nome1 - executionTime_nome2) + " ms");

        } catch (MongoException me) {
            System.err.println("Unable to insert due to an error: " + me);
        } finally {
            if (mongoClient != null) {
                mongoClient.close();
            }
        }
    }
}
