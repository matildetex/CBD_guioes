package pt.deti.ies;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;
import java.util.concurrent.TimeUnit;
import java.util.Date;
import java.util.List;

import org.bson.Document;

import com.mongodb.MongoException;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Accumulators;
import com.mongodb.client.model.IndexOptions;



public class Ex4b {
    public static int limit = 30; 
    public static int timeslot = 60*60*1000;

    public static void main(String[] args) {

        String uri = "mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.0.1";

        MongoClient mongoClient = null;

        try {
            mongoClient = MongoClients.create(uri);

            MongoDatabase db = mongoClient.getDatabase("cbd");
            MongoCollection<Document> collection = db.getCollection("sistema-atendimento");
            Scanner scanTerm = new Scanner(System.in);
            FileOutputStream file = new FileOutputStream("CBD_L204b-out_108193.txt");
            try (PrintStream out = new PrintStream(file, true)) {
                String path = "Guião 2/Exercicio 4";
                File fin = new File(path);
                out.println("======================== OPENING STORE ===========================");
                collection.createIndex(new Document("products.expirationTime", 1), new IndexOptions().expireAfter((long) 3600, TimeUnit.SECONDS));
                while(true){
                    out.println("ORDER");
                    out.println("Utilizador? Exit(exit) para sair ");
                    String username=scanTerm.nextLine();
                    out.println(username);
                    if (username.equalsIgnoreCase("exit")) {
                        break; 
                    }
                    Document userQuery = new Document("username", username);
                    FindIterable<Document> existing_user = collection.find(userQuery);
                    if(existing_user.first()==null){
                        Document document = new Document("username", username)
                            .append("products", new ArrayList<>());
                        collection.insertOne(document);
                        userQuery = new Document("username", username);
                        out.println("\nPedido? Exit(exit) para sair");
                        String pedido=scanTerm.nextLine();
                        out.println(pedido);
                        if(pedido.equalsIgnoreCase("exit")){
                            break;
                        }
                        out.println("\nQuantidade? Exit(exit) para sair");
                        String quantS=scanTerm.nextLine();
                        out.println(quantS);
                        int quant=Integer.valueOf(quantS);
                        if(quantS.equalsIgnoreCase("exit")){
                                break;
                            }
                        if(quant>=limit){
                            out.println("You have reached the limit of purchases for today.");
                        }
                        else{
                            Date expirationDate = new Date(System.currentTimeMillis() + timeslot);
                            Document productDocument = new Document("productName", pedido)
                                .append("quantity", quant)
                                .append("expirationTime", expirationDate);
                            Document update = new Document("$push", new Document("products", productDocument));
                            collection.updateOne(userQuery, update);
                            out.println("\n======PRODUTOS DO UTILIZADOR " + username + "========");

                            FindIterable<Document> userProducts = collection.find(userQuery);

                            for (Document prod : userProducts) {
                                ArrayList<Document> pr = prod.get("products", ArrayList.class);

                                for (Document product : pr) {
                                    String productName = product.getString("productName");
                                    int quan = product.getInteger("quantity", 0);
                                    out.println("> " + productName + ", quantity:" + quan);
                                }
                            }
                            out.println();
                        }
                    }
                    else{
                        FindIterable<Document> userProd = collection.find(userQuery);
                        int totalQuantity = 0;
                        for (Document doc : userProd) {
                            List<Document> products = doc.getList("products", Document.class);
                            if (products != null) {
                                for (Document product : products) {
                                    String productName = product.getString("productName");
                                    int quantity = product.getInteger("quantity", 0);
                                    totalQuantity += quantity;
                                }
                            }
                        }
                        if(totalQuantity>=limit){
                            out.println("You have reached the limit of purchases for today.");
                        }   
                        else{
                            out.println("\nPedido? Exit(exit) para sair");
                            String pedido=scanTerm.nextLine();
                            out.println(pedido);
                            if(pedido.equalsIgnoreCase("exit")){
                                break;
                            }
                            out.println("\nQuantidade? Exit(exit) para sair");
                            String quantS=scanTerm.nextLine();
                            out.println(quantS);
                            int quant=Integer.valueOf(quantS);
                            if(quantS.equalsIgnoreCase("exit")){
                                break;
                            }
                            if(quant>=limit || quant+totalQuantity>limit){
                                out.println("You have reached the limit of purchases for today.");
                            }
                            else{
                                Date expirationDate = new Date(System.currentTimeMillis() + timeslot);
                                Document productDocument = new Document("productName", pedido)
                                    .append("quantity", quant)
                                    .append("expirationTime", expirationDate);
                                Document update = new Document("$push", new Document("products", productDocument));
                                collection.updateOne(userQuery, update);
                                out.println("\n======PRODUTOS DO UTILIZADOR " + username + "========");

                                FindIterable<Document> userProducts = collection.find(userQuery);

                                for (Document prod : userProducts) {
                                    ArrayList<Document> products = prod.get("products", ArrayList.class);

                                    for (Document product : products) {
                                        String productName = product.getString("productName");
                                        int quan = product.getInteger("quantity", 0);
                                        out.println("> " + productName + ", quantity:" + quan);
                                    }
                                }
                                out.println();

                            }
                        }
                    }
                
        
        } out.println("======================== CLOSING STORE ===========================");
        scanTerm.close();
        } catch (MongoException me) {
            System.err.println("Error: " + me);
        }
    } catch (FileNotFoundException e) {
        e.printStackTrace();
    }finally{
        if (mongoClient != null) {
                mongoClient.close();
            }
    }
}
}