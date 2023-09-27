package pt.deti.cbd;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.resps.Tuple;

import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.List;
import java.util.Scanner;

public class Exercicio5b {

    public static int limit = 30;
    public static int timeslot = 60 * 3600;

    public static void main(String[] args) {
        Jedis jedis = new Jedis();
        try {
            FileOutputStream file = new FileOutputStream("CBD-15b-out.txt");
            Scanner scanTerm = new Scanner(System.in);
            try (PrintStream ps = new PrintStream(file, true)) {
                while (true) {
                    ps.print("To terminate program, press Enter in all entries\n");
                    ps.print("UserName: ");
                    String userName = scanTerm.nextLine();
                    ps.println(userName);
                    ps.print("Produto: ");
                    String produto = scanTerm.nextLine();
                    ps.println(produto);
                    ps.print("Quantidade: ");
                    String quant = scanTerm.nextLine();
                    ps.println(quant);
                    if (userName.isEmpty() && produto.isEmpty() && quant.isEmpty()) {
                        scanTerm.close();
                        ps.println("TERMINATING PROGRAM");
                        break;
                    }
                    int quantidade = Integer.valueOf(quant);
                    jedis.expire(userName, timeslot);

                    Long tamanhoInicial = jedis.zcard(userName);
                    int quantidadegeral = 0;

                    if (tamanhoInicial > 0) {
                        List<Tuple> elementos1 = jedis.zrangeWithScores(userName, 0, -1);
                        for (Tuple elemento : elementos1) {
                            double score = elemento.getScore();
                            quantidadegeral += score;
                        }
                    }

                    if (quantidadegeral + quantidade <= limit) {
                        jedis.zadd(userName, quantidade, produto);
                    } else {
                        ps.println("ALERT: Maximum number of products reached!");
                        ps.println("Wait for them to expire or choose another username.");
                    }

                    Long tamanho = jedis.zcard(userName);
                    ps.println("--------------------------------");
                    

                    List<Tuple> elementos = jedis.zrangeWithScores(userName, 0, -1);

                    ps.println("UserName: " + userName);
                    for (Tuple elemento : elementos) {
                        ps.println("Elemento: " + elemento.toString());
                    }
                    ps.println("Número de valores no Sorted Set : " + tamanho);
                    ps.println("--------------------------------");
                }

                jedis.flushDB();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                jedis.close();
            }
} catch (Exception e) {
                e.printStackTrace();
            } finally {
                jedis.close();
            }
        }
    }
