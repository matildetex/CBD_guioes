package pt.deti.cbd;

import java.util.Random;

import redis.clients.jedis.Jedis;

public class SimplePost {
    public static String USERS_KEY = "users"; // Key set for users' name
    public static void main(String[] args) {

        Jedis jedis = new Jedis();
        // set
        String[] users = { "Ana", "Pedro", "Maria", "Luis" };
        jedis.del(USERS_KEY); // remove if exists to avoid wrong type
        System.out.println("Para um set-> Exemplo");
        for (String user : users)
            jedis.sadd(USERS_KEY, user);
            jedis.smembers(USERS_KEY).forEach(System.out::println);
        
        //lista
        System.out.println("Para uma Lista");
        jedis.del(USERS_KEY); 
        for (String user2 : users){
            jedis.lpush(USERS_KEY, user2);  
            System.out.println(jedis.lrange(USERS_KEY, 1, 1));      
        }
        
        //hashmap
        System.out.println("Para um HashMap");
        jedis.del(USERS_KEY); 
        for (String user : users){
            Random rand=new Random();
            String rand2 = rand.toString();
            jedis.hset(USERS_KEY, user, rand2);        
            System.out.println(jedis.hgetAll(user));
        }
            

        jedis.flushDB();
        jedis.close();
    }
}
