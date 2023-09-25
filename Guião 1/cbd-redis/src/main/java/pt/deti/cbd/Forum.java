package pt.deti.cbd;
import redis.clients.jedis.Jedis;
/**
 * Hello world!
 *
 */
public class Forum {
public static void main(String[] args) {
// Ensure you have redis-server running
Jedis jedis = new Jedis();
String ping= jedis.ping(); //printa pong se server tiver em funcionamento
 // Print the response
 if (ping.equals("PONG")) {
    System.out.println("Connection successful!");
} else {
    System.out.println("Connection failed!");
}
System.out.println(jedis.info());
System.out.println("Operações");
// em key
jedis.set("key", "5");
String value=jedis.get("key");
System.out.println("Key:" + value );
jedis.incr("key");
System.out.println(jedis.get("key"));
Long ttl = jedis.ttl("key");
System.out.println("expiration time"+ ttl);
jedis.del("key");
jedis.close();
}
}
