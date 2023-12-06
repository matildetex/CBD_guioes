package pt.ua.cbd.lab3.ex3;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import com.datastax.oss.driver.api.core.CqlIdentifier;
import com.datastax.oss.driver.api.core.CqlSession;
import com.datastax.oss.driver.api.core.CqlSessionBuilder;
import com.datastax.oss.driver.api.core.cql.ResultSet;
import com.datastax.oss.driver.api.core.cql.Row;

public class Application {
  public static CqlSession session;

   static {
        CqlSessionBuilder sessionBuilder = CqlSession.builder();
        sessionBuilder.withKeyspace(CqlIdentifier.fromCql("sistema_videos"));

        session = sessionBuilder.build();
    }
  public static void main(String[] args) {

        // Insert a new user
        System.out.println("\n==============INSERTING==================\n");
        insert_new_user("john_doe", "John Doe", "john.doe@example.com");
        String username_insert="john_doe";
        String query = String.format("SELECT * FROM Users WHERE username='%s'ALLOW FILTERING;", username_insert);
        ResultSet resultSet = session.execute(query);
        for (Row row : resultSet) {
          System.out.printf("User ID: %s, Username: %s, Name: %s, Email: %s, Timestamp: %s%n",
                  row.getUuid("user_id"),
                  row.getString("username"),
                  row.getString("name"),
                  row.getString("email"),
                  row.getInstant("timestamp"));
        }

        // Update a video
        System.out.println("\n==============UPDATING==================\n");
        update_video("bob_smith", "Culinary Delights in Aveiro", "Aveiro is a great city, and its food is even better.", Arrays.asList("delicious", "ovosmolesaremuah"), "2023-12-31 12:00:00.000000+0000");
        String username_update="bob_smith";
        String video_name_update="Culinary Delights in Aveiro";
        String queryU= String.format("SELECT * FROM Videos WHERE username='%s' AND video_name='%s' ALLOW FILTERING;", username_update, video_name_update);
        

        ResultSet resultSetU = session.execute(queryU);
        for (Row row : resultSetU) {
          System.out.printf("UserName: %s, Video: %s, Name: %s, Tags: %s, Timestamp: %s%n",
                  row.getString("username"),
                  row.getString("video_name"),
                  row.getString("description"),
                  row.getList("tags", String.class),
                  row.getInstant("upload_timestamp"));
        }

        // Search for followers
        System.out.println("\n==============SEARCHING==================\n");
        search_followers("david_taylor", "Vacation Adventure");

        //Queries
        //7. Permitir a pesquisa de todos os vídeos de determinado autor;
        // SELECT * FROM Videos WHERE username='bob_smith';
        System.out.println("\n==============7. Permitir a pesquisa de todos os vídeos de determinado autor;==================\n");
         String username="bob_smith";
         String query7 = String.format("SELECT * FROM Videos WHERE username='%s';", username);
         ResultSet resultSet7 = session.execute(query7);

         for (Row row7 : resultSet7) {
              System.out.printf("Video: username='%s', video_name='%s', description='%s', tags='%s%n'",
                      row7.getString("username"),
                      row7.getString("video_name"),
                      row7.getString("description"),
                      row7.getList("tags", String.class)
              );
          }

        //9. Permitir a pesquisa de comentários por vídeos, ordenado inversamente pela data;
        // SELECT * FROM CommentsByVideo WHERE video_name = 'Nature Photography' ORDER BY timestamp DESC;
        System.out.println("\n==============9. Permitir a pesquisa de comentários por vídeos, ordenado inversamente pela data;==================\n");
        String videoName="Nature Photography"; 
          String query9 = String.format("SELECT * FROM CommentsByVideo WHERE video_name = '%s' ORDER BY timestamp DESC;", videoName);
          ResultSet resultSet9 = session.execute(query9);
      
          for (Row row9 : resultSet9) {
              System.out.printf("Comment: video_name='%s', comment='%s', timestamp='%s%n'",
                      row9.getString("video_name"),
                      row9.getString("comment_text"),
                      row9.getInstant("timestamp")
              );
          }
        //2. Lista das tags de determinado vídeo;
        // SELECT video_name, tags FROM Videos WHERE video_name='DIY Home Decor'; 
        System.out.println("\n==============2. Lista das tags de determinado vídeo;==================\n");
        String videoName2="DIY Home Decor";
        String query2 = String.format("SELECT video_name, tags FROM Videos WHERE video_name='%s';", videoName2);
        ResultSet resultSet2 = session.execute(query2);

        for (Row row2 : resultSet2) {
            System.out.printf("Video: video_name=%s, tags=%s%n",
                    row2.getString("video_name"),
                    row2.getList("tags", String.class)
            );
        }

        //3. Todos os vídeos com a tag Aveiro;
        // SELECT * FROM Videos WHERE tags CONTAINS 'Aveiro';
        System.out.println("\n==============3. Todos os vídeos com a tag Aveiro;==================\n");
        String tag="Aveiro";
        String query3 = String.format("SELECT * FROM Videos WHERE tags CONTAINS '%s';", tag);
        ResultSet resultSet3 = session.execute(query3);
    
        for (Row row3 : resultSet3) {
            System.out.printf("Video: username=%s, video_name=%s, description=%s, tags=%s%n",
                    row3.getString("username"),
                    row3.getString("video_name"),
                    row3.getString("description"),
                    row3.getList("tags", String.class)
            );
        }

        System.out.println("\n==================TERMINATING PROGRAM===========================\n");
        session.close();
  }

    public static void insert_new_user(String username, String name, String email) {
        // for now registration_date will always be dateof(now())
        String query = String.format("insert into users (user_id, username, name, email, timestamp) values (uuid(), '%s', '%s', '%s', dateof(now()));", username, name, email);
        session.execute(query);
        System.out.println("User inserted successfully");
    }

    public static void update_video(String username,String video, String description, List<String> tagslist, String timestamp) {
      if (username == null) {
          System.out.println("Username cannot be null");
          return;
      }

      StringBuilder queryBuilder = new StringBuilder("UPDATE Videos SET ");

      if (description != null) {
          queryBuilder.append(String.format("description = '%s', ", description));
      }

      if (tagslist != null && !tagslist.isEmpty()) {
          String tagsString = tagslist.stream()
              .map(tag -> "'" + tag + "'")  
              .collect(Collectors.joining(", ", "[", "]")); 

          queryBuilder.append(String.format("tags = tags + %s", tagsString));
      }
      queryBuilder.append(String.format(" WHERE username = '%s' AND upload_timestamp='%s';", username, timestamp));

      String query = queryBuilder.toString();

      session.execute(query);
      System.out.println("Video updated successfully.");
  }


     
  
  public static void search_followers(String username, String video_name){
    String query = String.format("SELECT * FROM followers WHERE user_username = '%s' AND video_name = '%s';", username, video_name);
    ResultSet resultSetS= session.execute(query);
    System.out.println("Search executed successfully.");

    for (Row row : resultSetS) {
      System.out.printf("Username: %s, Video Name: %s%n",
              row.getString("user_username"),
              row.getString("video_name"));
    }

  }



}

