package pt.ua.cbd.lab3.ex3;

import com.datastax.oss.driver.api.core.CqlIdentifier;
import com.datastax.oss.driver.api.core.CqlSession;
import com.datastax.oss.driver.api.core.CqlSessionBuilder;
import com.datastax.oss.driver.api.core.cql.ColumnDefinitions;
import com.datastax.oss.driver.api.core.cql.ResultSet;
import com.datastax.oss.driver.api.core.cql.Row;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.datastax.oss.driver.api.core.cql.ColumnDefinition;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;




import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CassandraScriptExecutor {

    private static CqlSession session;

    public static void main(String[] args) {
        connectToCassandra();
        executeAndSaveQueries();
        closeConnections();
    }

    private static void connectToCassandra() {
        CqlSessionBuilder sessionBuilder = CqlSession.builder();
        sessionBuilder.withKeyspace(CqlIdentifier.fromCql("sistema_videos"));

        session = sessionBuilder.build();
    }

    private static void executeAndSaveQueries() {
        // List to store results in JSON format
        List<Map<String, Object>> resultList = new ArrayList<>();
        ObjectMapper objectMapper = createObjectMapper();
        // Execute and save each query with its corresponding question
        executeAndSaveQuery("SELECT * FROM Videos WHERE username='bob_smith'", "7- Permitir a pesquisa de todos os vídeos de determinado autor", resultList);
        executeAndSaveQuery("SELECT * FROM Comments WHERE username = 'alice_jones' ORDER BY timestamp DESC", "8- Permitir a pesquisa de comentários por utilizador, ordenado inversamente pela data", resultList);
        executeAndSaveQuery("SELECT * FROM CommentsByVideo WHERE video_name = 'Nature Photography' ORDER BY timestamp DESC;","9. Permitir a pesquisa de comentários por vídeos, ordenado inversamente pela data;", resultList);
        executeAndSaveQuery("SELECT video_name,AVG(rating) AS average_rating,COUNT(*) AS vote_count FROM Ratings GROUP BY video_name;","10. Permitir a pesquisa do rating médio de um vídeo e quantas vezes foi votado;", resultList);
        executeAndSaveQuery("SELECT video_name, comment_text FROM CommentsByVideo WHERE video_name = 'Cooking Masterclass' ORDER BY timestamp DESC LIMIT 3;","1. Os últimos 3 comentários introduzidos para um vídeo;", resultList);
        executeAndSaveQuery("SELECT video_name, tags FROM Videos WHERE video_name='DIY Home Decor';","2. Lista das tags de determinado vídeo;", resultList);
        executeAndSaveQuery("SELECT * FROM Videos WHERE tags CONTAINS 'Aveiro';","3. Todos os vídeos com a tag Aveiro;", resultList);
        executeAndSaveQuery("SELECT video_name, user_username, event_type FROM Events WHERE video_name = 'Tech Reviews' AND user_username = 'isabel_davis' LIMIT 5;","4. Os últimos 5 eventos de determinado vídeo realizados por um utilizador;", resultList);
        executeAndSaveQuery("SELECT * FROM Videos  WHERE username='maria1987'  AND upload_timestamp >= '2017-08-01 00:00:00'  AND upload_timestamp <= '2017-08-31 23:59:59';","5. Vídeos partilhados por determinado utilizador (maria1987, por exemplo) num determinado período de tempo (Agosto de 2017, por exemplo);", resultList);
        printQueryInfo("Cassandra não suporta operação de ordenação inversa diretamente.", "6. Os últimos 10 vídeos, ordenado inversamente pela data da partilhada;", resultList);
        executeAndSaveQuery("SELECT * FROM Followers WHERE video_name = 'Fitness Journey';","7. Todos os seguidores (followers) de determinado vídeo;", resultList);
        printQueryInfo("Cassandra não permite operações de join, o objetivo de cima seria cumprido mas efetuando várias queries.","8. Todos os comentários (dos vídeos) que determinado utilizador está a seguir (following);", resultList);
        printQueryInfo("Não é possível realizar em Cassandra operações de ordenação em colunas que não estejam na base da tabela.", "9. Os 5 vídeos com maior rating;", resultList);
        executeAndSaveQuery("SELECT * FROM Videos;","10. Uma query que retorne todos os vídeos e que mostre claramente a forma pela qual estão ordenados;", resultList);
        printQueryInfo("Cassandra não suporta operações de agregação como COUNT ou GROUP BY diretamente.", "11. Lista com as Tags existentes e o número de vídeos catalogados com cada uma delas;", resultList );
        executeAndSaveQuery("SELECT video_name FROM Ratings WHERE user_username='samuel_tucker';","12. Lista de vídeos que determinado utilizador avaliou;", resultList);
        executeAndSaveQuery("SELECT username, COUNT(video_name) AS total_videos_carregados  FROM Videos  GROUP BY username;","13. Número de vídeos que cada utilizador carregou", resultList);
        // Add more queries and questions as needed

        // Convert the resultList to JSON
        try (FileWriter fileWriter = new FileWriter("all_results.json")) {
            Map<String, List<Map<String, Object>>> groupedResults = new HashMap<>();
        
            for (Map<String, Object> result : resultList) {
                // Obter a query do resultado
                String query = (String) result.get("query");
        
                // Verificar se a query já existe no mapa
                if (groupedResults.containsKey(query)) {
                    // Adicionar o resultado à lista existente
                    groupedResults.get(query).add(result);
                } else {
                    // Criar uma nova lista para a query e adicionar o resultado
                    List<Map<String, Object>> resultsForQuery = new ArrayList<>();
                    resultsForQuery.add(result);
                    groupedResults.put(query, resultsForQuery);
                }
            }
        
            // Iterar sobre as entradas do mapa agrupado
            for (Map.Entry<String, List<Map<String, Object>>> entry : groupedResults.entrySet()) {
                String query = entry.getKey();
                List<Map<String, Object>> resultsForQuery = entry.getValue();
        
                // Imprimir a pergunta e a query apenas uma vez para cada grupo
                if (!resultsForQuery.isEmpty()) {
                    fileWriter.write("Pergunta: " + resultsForQuery.get(0).get("pergunta") + "\n");
                    fileWriter.write("Query: " + query + "\n");
                }
        
                // Iterar sobre os resultados e escrever no arquivo
                for (Map<String, Object> result : resultsForQuery) {
                    String jsonResult = objectMapper.writeValueAsString(result);
                    fileWriter.write("Result: " + jsonResult + "\n\n");
                }
            }
        
            System.out.println("Results saved to all_results.json");
        } catch (IOException e) {
            e.printStackTrace();
        }
        
    }

    private static void executeAndSaveQuery(String query, String pergunta, List<Map<String, Object>> resultList) {
        ResultSet resultSet = session.execute(query);
    
        // Process the result and add to the resultList
        for (Row row : resultSet) {
            Map<String, Object> rowMap = new HashMap<>();
    
            ColumnDefinitions columnDefinitions = row.getColumnDefinitions();
            for (ColumnDefinition columnDefinition : columnDefinitions) {
                // Get the column name and value
                String columnName = columnDefinition.getName().asInternal();
                Object columnValue = row.getObject(columnName);
                rowMap.put(columnName, columnValue);
            }
    
            rowMap.put("pergunta", pergunta);
            rowMap.put("query", query); // Include the query in the rowMap
    
            // Add the rowMap to the resultList
            resultList.add(rowMap);
        }
    }
    

    private static ObjectMapper createObjectMapper() {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());
        objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
        return objectMapper;
    }
    

    private static void printQueryInfo(String justificacao, String pergunta, List<Map<String, Object>> resultList) {
        Map<String, Object> queryInfoMap = new HashMap<>();
        queryInfoMap.put("justificacao", justificacao);
        queryInfoMap.put("pergunta", pergunta);
    
        // Add the query information to the resultList
        resultList.add(queryInfoMap);
    
        // Print the query information
        System.out.println("justificacao: " + justificacao);
        System.out.println("Pergunta: " + pergunta);
        System.out.println();  // Adding an empty line for better readability
    }

    private static void closeConnections() {
        if (session != null) {
            session.close();
        }
    }
}
