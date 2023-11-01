package pt.deti.ies;
import org.bson.Document;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import redis.clients.jedis.Jedis;

public class Ex4c {

    public static void main(String[] args) {
        // Configuração do MongoDB
        String mongoUri = "mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.0.1"; // Substitua pela URL do seu servidor MongoDB
        MongoClient mongoClient = MongoClients.create(mongoUri);
        MongoDatabase mongoDatabase = mongoClient.getDatabase("cbd"); // Substitua pelo nome do seu banco de dados
        MongoCollection mongoCollection = mongoDatabase.getCollection("teste"); // Substitua pelo nome da sua coleção

        // Configuração do Redis
        Jedis jedis = new Jedis(); // Substitua pelo host do seu servidor Redis

        // Medir tempo de leitura no MongoDB
        long startTimeMongoRead = System.currentTimeMillis();
        mongoCollection.find(Filters.eq("chave", "valor")).first(); // Substitua pela sua consulta de leitura
        long endTimeMongoRead = System.currentTimeMillis();
        long timeElapsedMongoRead = endTimeMongoRead - startTimeMongoRead;

        // Medir tempo de leitura no Redis
        long startTimeRedisRead = System.currentTimeMillis();
        jedis.get("chave"); // Substitua pela chave que deseja ler
        long endTimeRedisRead = System.currentTimeMillis();
        long timeElapsedRedisRead = endTimeRedisRead - startTimeRedisRead;

        // Medir tempo de escrita no MongoDB
        long startTimeMongoWrite = System.currentTimeMillis();
        mongoCollection.insertOne(new Document("chave", "valor")); // Substitua pelo seu documento de escrita
        long endTimeMongoWrite = System.currentTimeMillis();
        long timeElapsedMongoWrite = endTimeMongoWrite - startTimeMongoWrite;

        // Medir tempo de escrita no Redis
        long startTimeRedisWrite = System.currentTimeMillis();
        jedis.set("chave", "valor"); // Substitua pela chave e valor que deseja escrever
        long endTimeRedisWrite = System.currentTimeMillis();
        long timeElapsedRedisWrite = endTimeRedisWrite - startTimeRedisWrite;

        // Resultados
        System.out.println("Tempo de leitura no MongoDB: " + timeElapsedMongoRead + " ms");
        System.out.println("Tempo de leitura no Redis: " + timeElapsedRedisRead + " ms");
        System.out.println("Tempo de escrita no MongoDB: " + timeElapsedMongoWrite + " ms");
        System.out.println("Tempo de escrita no Redis: " + timeElapsedRedisWrite + " ms");

        // Feche as conexões
        mongoClient.close();
        jedis.close();
    }
}
