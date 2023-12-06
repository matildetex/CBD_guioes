CREATE KEYSPACE sistema_videos WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 3};

CREATE TABLE Users(
 user_id UUID,
 username TEXT,
 name TEXT,
 email TEXT,
 timestamp TIMESTAMP,
 PRIMARY KEY (user_id, username)
);

CREATE TABLE Videos(
 username TEXT,
 video_id UUID,
 video_name TEXT,
 description TEXT,
 tags list<TEXT>,
 upload_timestamp TIMESTAMP,
 PRIMARY KEY ((username), upload_timestamp)
) WITH CLUSTERING ORDER BY (upload_timestamp DESC);

CREATE TABLE Comments (
 comment_id UUID,
 username TEXT,
 video_name TEXT,
 comment_text TEXT,
 timestamp TIMESTAMP,
 PRIMARY KEY((username), timestamp, video_name,  comment_id)
) WITH CLUSTERING ORDER BY (timestamp DESC);

CREATE TABLE CommentsByVideo (
 video_name TEXT,
 timestamp TIMESTAMP,
 username TEXT,
 comment_id UUID,
 comment_text TEXT,
 PRIMARY KEY((video_name), timestamp, username, comment_id)
) WITH CLUSTERING ORDER BY (timestamp DESC);


CREATE TABLE Followers (
   user_username text,
   video_name TEXT,
   PRIMARY KEY (video_name, user_username)
);

CREATE TABLE Events (
  event_id uuid,
  video_name TEXT,
  user_username TEXT,
  event_type TEXT,
  event_timestamp TIMESTAMP,
  video_time TIMEUUID,
  PRIMARY KEY ((video_name, user_username), event_timestamp, video_time)
) WITH CLUSTERING ORDER BY (event_timestamp DESC);



CREATE TABLE Ratings (
   video_name TEXT,
   user_username TEXT,
   rating INT,
   PRIMARY KEY (video_name, user_username)
);

CREATE INDEX ON Videos (video_name);

CREATE INDEX ON Comments (username);

CREATE INDEX IF NOT EXISTS ON Videos (tags);

CREATE INDEX IF NOT EXISTS ON Events (user_username);

CREATE INDEX ON Ratings (user_username);




