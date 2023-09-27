package pt.deti.cbd;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.*;

import redis.clients.jedis.Jedis;

public class Exercicio5a {
    public static int limit = 30; //mudar para valores exatos
    public static int timeslot = 3600*60;
    public static void main(String[] args) {
     Jedis jedis = new Jedis();

     try{
        FileOutputStream file = new FileOutputStream("CBD-15a-out.txt");
        Scanner scanTerm = new Scanner(System.in);
        try(PrintStream ps = new PrintStream(file, true)){
                while (true) {
                    ps.println("UserName: ");
                    String userName = scanTerm.nextLine();
                    ps.println(userName);
                    ps.print(" Produto: ");
                    jedis.expire(userName, timeslot);
                    String produto = scanTerm.nextLine();
                    ps.println(produto);
                    if (userName.isEmpty() || produto.isEmpty()) {
                        scanTerm.close();
                        break;
                    }
                    Long length = jedis.scard(userName);
                    if (length < limit) {
                        jedis.sadd(userName, produto);
                        
                    }
                    if(length == limit-1 || length > limit) {
                        ps.println("Maximum number of produts reached, wait for them to expire");
                        ps.println("Choose another username or wait for them to expire");
                    }
                    if(length > limit-1){
                        ps.println("Operation cancelled. User has too many products");
                    }
                    
                    Set<String> elementos = jedis.smembers(userName);
                    ps.println("--------------------------------");
                    ps.println("Produtos Pedidos pelo userName "+ userName +":");
                    for (String elemento : elementos) {
                        ps.print("-");
                        ps.println(elemento);
                    }     
                    ps.println("--------------------------------");
                }
     
            jedis.flushDB();
        }
    
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            jedis.close();
        }

}  
}

