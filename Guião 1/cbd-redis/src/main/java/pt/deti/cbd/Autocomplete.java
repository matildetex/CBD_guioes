package pt.deti.cbd;

import java.io.*;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.params.ScanParams;
import redis.clients.jedis.resps.ScanResult;
import redis.clients.jedis.resps.Tuple;

public class Autocomplete {

    public static void main(String[] args) {
        Jedis jedis = new Jedis();

        String path = "CBD_guioes/Guião 1/cbd-redis/names.txt";
        File fin = new File(path);
        
        jedis.expire("sortedset_1", 0);
        
        try {
            Scanner sc = new Scanner(fin);
            /*List<String> lines = Files.readAllLines(Paths.get(path), StandardCharsets.UTF_8);
            for (String linha : lines) {
                jedis.zadd("sortedset", 0, linha);
            }*/

            // Long numberOfElements = jedis.zcard("sortedset");

            // if (numberOfElements > 0) {
            //     System.out.println("O conjunto ordenado contém " + numberOfElements + " elementos.");
            // } else {
            //     System.out.println("O conjunto ordenado está vazio.");
            // }

            while (sc.hasNextLine()) {
                jedis.zadd("sortedset_1", 0, sc.nextLine());
            }

            // jedis.zrange("sortedset_1", 0, -1);

            Scanner scanTerm = new Scanner(System.in);
            while (true) {
                System.out.println("Search for ('Enter' to quit)");
                String userName = scanTerm.nextLine();
                
                if (userName.isEmpty()) {
                    break;
                }
                jedis.zrangeByLex("sortedset_1", "[" + userName, "[" + userName + "xff").stream().forEach(System.out::println);

                // ScanParams params = new ScanParams().match(userName + "*"); // Configurar o padrão de correspondência
                // String cursor = "0";

                // do {
                //     ScanResult<Tuple> scanResult = jedis.zscan("sortedset_1", cursor, params);
                //     cursor = scanResult.getCursor();
                //     // jedis.zadd("littlesortedset",)

                //     for (Tuple tuple : scanResult.getResult()) {
                //         String element = tuple.getElement();
                //         double s=tuple.getScore();
                //         System.out.println("Name: " + element + "; Score: " + s);
                //     }
                // } while (!cursor.equals("0"));
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } finally {
            jedis.close();
        }
    }
}