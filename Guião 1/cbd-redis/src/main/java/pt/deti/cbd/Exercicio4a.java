package pt.deti.cbd;

import java.io.*;
import java.util.*;
import redis.clients.jedis.Jedis;


public class Exercicio4a {

    public static void main(String[] args) {
        Jedis jedis = new Jedis();

        try {
            
        String path = "Guião 1/cbd-redis/names.txt";
        // Creates a FileOutputStream
        FileOutputStream file = new FileOutputStream("CBD-14a-out.txt");

        File fin = new File(path);
        
        try(PrintStream ps = new PrintStream(file, true)){
            Scanner sc = new Scanner(fin);

            while (sc.hasNextLine()) {
                jedis.zadd("sortedset_1", 0, sc.nextLine());
            }

            // jedis.zrange("sortedset_1", 0, -1);

            Scanner scanTerm = new Scanner(System.in);
            while (true) {
                ps.println("Search for ('Enter' to quit)");
                String userName = scanTerm.nextLine();
                
                if (userName.isEmpty()) {
                    break;
                }
                jedis.zrangeByLex("sortedset_1", "[" + userName, "[" + userName + "xff").stream().forEach(ps::println);
                // xff é caracter terminal -> tirei do redis
            }
            ps.flush();
        }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } finally {
            jedis.close();
        }
    }
}