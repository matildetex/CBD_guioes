package pt.deti.cbd;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.resps.Tuple;
import java.io.*;

public class Exercicio4b {
    public static void main(String[] args) {
        Jedis jedis = new Jedis();

        try {
            
            
            FileOutputStream file = new FileOutputStream("CBD-14b-out.txt");
            try(PrintStream ps = new PrintStream(file, true)){
                String path = "Guião 1/cbd-redis/nomes-pt-2021.csv";
                File fin = new File(path);
                Scanner sc = new Scanner(fin);

                while (sc.hasNextLine()) {
                    String linha = sc.nextLine();
                    String newlinha= linha.split(";")[0];
                    Double count=Double.valueOf(linha.split(";")[1]);
                    jedis.zadd("names",0.0, newlinha);
                    jedis.zadd("geral", count, newlinha);
                }
                sc.close();          
            
            List<Tuple> elementosComScores = jedis.zrangeWithScores("geral", 0, -1);
                for (Tuple tuple : elementosComScores) {
                    String membro = tuple.getElement();
                    double score = tuple.getScore();
            }

            Scanner scanTerm = new Scanner(System.in);
            while (true) {
                ps.print("Search for ('Enter' to quit): ");
                String userName = scanTerm.nextLine();
                
                if (userName.isEmpty()) {
                    scanTerm.close();
                    break;
                }
                
                List<String> ok = jedis.zrangeByLex("names", "[" + userName, "[" + userName + "xff");

                HashMap<String, Double> map = new HashMap<String, Double>();

                for (String s : ok) {
                    map.put(s, jedis.zscore("geral", s));
                }

                List<Map.Entry<String, Double>> entryList = new ArrayList<>(map.entrySet());

                // Classifique a lista com um comparador personalizado
                Collections.sort(entryList, new Comparator<Map.Entry<String, Double>>() {
                    @Override
                    public int compare(Map.Entry<String, Double> entry1, Map.Entry<String, Double> entry2) {
                        // Compara valores em ordem decrescente
                        int result = Double.compare(entry2.getValue(), entry1.getValue());

                        // Se os valores forem iguais, compara as chaves em ordem alfabética
                        if (result == 0) {
                            return entry1.getKey().compareTo(entry2.getKey());
                        }

                        return result;
                    }
                });

                LinkedHashMap<String, Double> sortedMap = new LinkedHashMap<>();
                for (Map.Entry<String, Double> entry : entryList) {
                    sortedMap.put(entry.getKey(), entry.getValue());
                }

                for (Map.Entry<String, Double> entry : sortedMap.entrySet()) {
                    ps.println(entry.getKey() + ": " + entry.getValue());
                }

            }
        }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } finally {
            jedis.close();
        }
    }

}
