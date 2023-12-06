##Users
INSERT INTO Users (user_id, username, name, email, timestamp) 
VALUES (uuid(), 'john_doe', 'John Doe', 'john.doe@example.com', toTimestamp(toDate('2023-11-25 12:00:00')));

INSERT INTO Users (user_id, username, name, email, timestamp) 
VALUES (uuid(), 'jane_smith', 'Jane Smith', 'jane.smith@example.com', toTimestamp(toDate('2023-11-25 12:15:00')));

INSERT INTO Users (user_id, username, name, email, timestamp) 
VALUES 
  (uuid(), 'alice_jones', 'Alice Jones', 'alice.jones@example.com', toTimestamp(toDate('2023-12-06 09:30:00')));

INSERT INTO Users (user_id, username, name, email, timestamp) 
VALUES 
  (uuid(), 'bob_smith', 'Bob Smith', 'bob.smith@example.com', toTimestamp(toDate('2023-12-07 11:45:00')));

INSERT INTO Users (user_id, username, name, email, timestamp) 
VALUES 
  (uuid(), 'carol_miller', 'Carol Miller', 'carol.miller@example.com', toTimestamp(toDate('2023-12-08 14:00:00')));

INSERT INTO Users (user_id, username, name, email, timestamp) 
VALUES 
  (uuid(), 'david_taylor', 'David Taylor', 'david.taylor@example.com', toTimestamp(toDate('2023-12-09 16:15:00')));

INSERT INTO Users (user_id, username, name, email, timestamp) 
VALUES 
  (uuid(), 'emma_wilson', 'Emma Wilson', 'emma.wilson@example.com', toTimestamp(toDate('2023-12-10 18:30:00')));

INSERT INTO Users (user_id, username, name, email, timestamp) 
VALUES 
  (uuid(), 'frank_harris', 'Frank Harris', 'frank.harris@example.com', toTimestamp(toDate('2023-12-11 20:45:00')));

INSERT INTO Users (user_id, username, name, email, timestamp) 
VALUES 
  (uuid(), 'grace_martin', 'Grace Martin', 'grace.martin@example.com', toTimestamp(toDate('2023-12-12 23:00:00')));

INSERT INTO Users (user_id, username, name, email, timestamp) 
VALUES 
  (uuid(), 'henry_roberts', 'Henry Roberts', 'henry.roberts@example.com', toTimestamp(toDate('2023-12-13 01:15:00')));

INSERT INTO Users (user_id, username, name, email, timestamp) 
VALUES 
  (uuid(), 'isabel_davis', 'Isabel Davis', 'isabel.davis@example.com', toTimestamp(toDate('2023-12-14 03:30:00')));

INSERT INTO Users (user_id, username, name, email, timestamp) 
VALUES 
  (uuid(), 'jack_thompson', 'Jack Thompson', 'jack.thompson@example.com', toTimestamp(toDate('2023-12-15 05:45:00')));

INSERT INTO Users (user_id, username, name, email, timestamp) 
VALUES 
  (uuid(), 'oliver_wilkins', 'Oliver Wilkins', 'oliver.wilkins@example.com', toTimestamp(toDate('2023-12-16 08:00:00')));

INSERT INTO Users (user_id, username, name, email, timestamp) 
VALUES 
  (uuid(), 'penelope_jackson', 'Penelope Jackson', 'penelope.jackson@example.com', toTimestamp(toDate('2023-12-17 10:15:00')));

INSERT INTO Users (user_id, username, name, email, timestamp) 
VALUES 
  (uuid(), 'quinn_nelson', 'Quinn Nelson', 'quinn.nelson@example.com', toTimestamp(toDate('2023-12-18 12:30:00')));

INSERT INTO Users (user_id, username, name, email, timestamp) 
VALUES 
  (uuid(), 'rachel_smithson', 'Rachel Smithson', 'rachel.smithson@example.com', toTimestamp(toDate('2023-12-19 14:45:00')));

INSERT INTO Users (user_id, username, name, email, timestamp) 
VALUES 
  (uuid(), 'samuel_tucker', 'Samuel Tucker', 'samuel.tucker@example.com', toTimestamp(toDate('2023-12-20 17:00:00')));

##Videos
INSERT INTO Videos (username, video_id, video_name, description, tags, upload_timestamp)
VALUES 
  ('alice_jones', uuid(), 'Vacation Adventure', 'Amazing vacation trip to the mountains', ['travel', 'adventure'], '2023-12-16 09:30:00');

INSERT INTO Videos (username, video_id, video_name, description, tags, upload_timestamp)
VALUES 
  ('bob_smith', uuid(), 'Cooking Masterclass', 'Learn how to cook delicious recipes at home', ['cooking', 'food'], '2023-12-17 12:00:00');

INSERT INTO Videos (username, video_id, video_name, description, tags, upload_timestamp)
VALUES 
  ('carol_miller', uuid(), 'Fitness Journey', 'Sharing my fitness routine and tips', ['fitness', 'health'], '2023-12-18 14:45:00');

INSERT INTO Videos (username, video_id, video_name, description, tags, upload_timestamp)
VALUES 
  ('david_taylor', uuid(), 'Tech Reviews', 'Reviewing the latest gadgets and tech trends', ['technology', 'reviews'], '2023-12-19 17:15:00');

INSERT INTO Videos (username, video_id, video_name, description, tags, upload_timestamp)
VALUES 
  ('emma_wilson', uuid(), 'DIY Home Decor', 'Creative ideas for decorating your home', ['diy', 'home decor'], '2023-12-20 19:30:00');

INSERT INTO Videos (username, video_id, video_name, description, tags, upload_timestamp)
VALUES 
  ('frank_harris', uuid(), 'Guitar Jam Session', 'Enjoy a relaxing guitar jam session', ['music', 'guitar'], '2023-12-21 22:00:00');

INSERT INTO Videos (username, video_id, video_name, description, tags, upload_timestamp)
VALUES 
  ('grace_martin', uuid(), 'Nature Photography', 'Capturing the beauty of nature through photography', ['photography', 'nature'], '2023-12-22 00:15:00');

INSERT INTO Videos (username, video_id, video_name, description, tags, upload_timestamp)
VALUES 
  ('henry_roberts', uuid(), 'Book Recommendations', 'Sharing my favorite books and book reviews', ['books', 'reading'], '2023-12-23 02:30:00');

INSERT INTO Videos (username, video_id, video_name, description, tags, upload_timestamp)
VALUES 
  ('isabel_davis', uuid(), 'Travel Vlogs', 'Exploring different places and cultures around the world', ['travel', 'vlogs'], '2023-12-24 04:45:00');

INSERT INTO Videos (username, video_id, video_name, description, tags, upload_timestamp)
VALUES 
  ('jack_thompson', uuid(), 'Fitness Challenges', 'Taking on various fitness challenges and documenting the journey', ['fitness', 'challenges'], '2023-12-25 07:00:00');

INSERT INTO Videos (username, video_id, video_name, description, tags, upload_timestamp)
VALUES 
  ('alice_jones', uuid(), 'Exploring Aveiro', 'Discover the charm of Aveiro, its canals, and historic sites', ['Aveiro', 'travel'], '2023-12-31 09:30:00');

INSERT INTO Videos (username, video_id, video_name, description, tags, upload_timestamp)
VALUES 
  ('bob_smith', uuid(), 'Culinary Delights in Aveiro', 'Savoring local cuisine and food spots in Aveiro', ['Aveiro', 'food'], '2023-12-31 12:00:00');

INSERT INTO Videos (username, video_id, video_name, description, tags, upload_timestamp)
VALUES 
  ('carol_miller', uuid(), 'University Life Chronicles', 'A day in the life of a university student - challenges and joys', ['university', 'student life'], '2023-12-31 14:45:00');

INSERT INTO Videos (username, video_id, video_name, description, tags, upload_timestamp)
VALUES 
  ('maria1987', uuid(), 'Summer Adventure', 'Exploring beautiful places and enjoying the summer vibes', ['travel', 'summer'], '2017-08-05 10:30:00');

INSERT INTO Videos (username, video_id, video_name, description, tags, upload_timestamp)
VALUES 
  ('maria1987', uuid(), 'Cooking Delights', 'Trying out new recipes and cooking delicious meals at home', ['cooking', 'recipes'], '2017-08-12 15:20:00');

INSERT INTO Videos (username, video_id, video_name, description, tags, upload_timestamp)
VALUES 
  ('maria1987', uuid(), 'Fitness Journey Update', 'Sharing my fitness progress and workout routines', ['fitness', 'health'], '2017-08-18 08:45:00');

INSERT INTO Videos (username, video_id, video_name, description, tags, upload_timestamp)
VALUES 
  ('maria1987', uuid(), 'Tech Gadgets Review', 'Reviewing the latest tech gadgets and sharing my thoughts', ['tech', 'gadgets'], '2017-08-25 12:00:00');

INSERT INTO Videos (username, video_id, video_name, description, tags, upload_timestamp)
VALUES 
  ('maria1987', uuid(), 'Book Recommendations', 'Discussing my favorite books and recommending must-reads', ['books', 'recommendations'], '2017-08-29 17:30:00');

##Comments
INSERT INTO Comments (comment_id, username, video_name, comment_text, timestamp)
VALUES (uuid(), 'frank_harris', 'Fitness Journey', 'Great workout tips. Keep it up!', '2024-01-02 17:00:00');

INSERT INTO Comments (comment_id, username, video_name, comment_text, timestamp)
VALUES (uuid(), 'alice_jones', 'Vacation Adventure', 'Amazing scenery! Can not wait to visit.', '2024-01-02 10:15:00');

INSERT INTO Comments (comment_id, username, video_name, comment_text, timestamp)
VALUES (uuid(), 'carol_miller', 'Vacation Adventure', 'Incredible! Love the travel vibes.', '2024-01-02 11:30:00');

INSERT INTO Comments (comment_id, username, video_name, comment_text, timestamp)
VALUES (uuid(), 'bob_smith', 'Cooking Masterclass', 'This recipe changed my cooking game!', '2024-01-02 13:00:00');

INSERT INTO Comments (comment_id, username, video_name, comment_text, timestamp)
VALUES (uuid(), 'david_taylor', 'Cooking Masterclass', 'Delicious! Thanks for sharing.', '2024-01-02 14:15:00');


INSERT INTO Comments (comment_id, username, video_name, comment_text, timestamp)
VALUES (uuid(), 'grace_martin', 'Tech Reviews', 'Informative tech review. Thanks for sharing!', '2024-01-02 18:30:00');

INSERT INTO Comments (comment_id, username, video_name, comment_text, timestamp)
VALUES (uuid(), 'henry_roberts', 'Tech Reviews', 'Your insights on the latest gadgets are great!', '2024-01-02 19:45:00');

INSERT INTO Comments (comment_id, username, video_name, comment_text, timestamp)
VALUES (uuid(), 'isabel_davis', 'DIY Home Decor', 'Love your creative ideas for home decor!', '2024-01-02 21:15:00');

INSERT INTO Comments (comment_id, username, video_name, comment_text, timestamp)
VALUES (uuid(), 'jack_thompson', 'DIY Home Decor', 'Inspired to try some DIY projects at home.', '2024-01-02 22:30:00');

INSERT INTO Comments (comment_id, username, video_name, comment_text, timestamp)
VALUES (uuid(), 'oliver_wilkins', 'Guitar Jam Session', 'Beautiful music! Enjoyed the jam session.', '2024-01-02 23:45:00');

INSERT INTO Comments (comment_id, username, video_name, comment_text, timestamp)
VALUES (uuid(), 'penelope_jackson', 'Guitar Jam Session', 'Your guitar skills are amazing!', '2024-01-03 01:00:00');

INSERT INTO Comments (comment_id, username, video_name, comment_text, timestamp)
VALUES (uuid(), 'quinn_nelson', 'Nature Photography', 'Captivating photos! Natures beauty is truly stunning.', '2024-01-03 02:30:00');

INSERT INTO Comments (comment_id, username, video_name, comment_text, timestamp)
VALUES (uuid(), 'rachel_smithson', 'Nature Photography', 'Your photography skills are on point!', '2024-01-03 03:45:00');

INSERT INTO Comments (comment_id, username, video_name, comment_text, timestamp)
VALUES (uuid(), 'samuel_tucker', 'Book Recommendations', 'Adding these books to my reading list. Thanks for the recommendations!', '2024-01-03 05:15:00');

INSERT INTO Comments (comment_id, username, video_name, comment_text, timestamp)
VALUES (uuid(), 'sophie_miller', 'Book Recommendations', 'Your book choices are excellent! Excited to read them.', '2024-01-03 06:30:00');

INSERT INTO Comments (comment_id, username, video_name, comment_text, timestamp) VALUES (uuid(), 'alice_jones', 'Nature Photography', 'Loving this new series. Next trey taking pictures of rocks. It is a whole another universe.', '2024-01-03 05:15:00');  INSERT INTO Comments (comment_id, username, video_name, comment_text, timestamp) VALUES (uuid(), 'isabel_davis', 'Ex
ploring Aveiro', 'Loved the video. Excited to visit.', '2024-01-03 06:30:00');

INSERT INTO Comments (comment_id, video_name, username, comment_text, timestamp)
VALUES (uuid(), 'Cooking Masterclass', 'emma_wilson', 'I tried your recipe, and it turned out amazing! Thanks for sharing.', '2024-01-07 14:00:00');

INSERT INTO Comments (comment_id, video_name, username, comment_text, timestamp)
VALUES (uuid(), 'Cooking Masterclass', 'samuel_tucker', 'Your cooking tips are always so helpful. Can not wait to try this dish.', '2024-01-07 15:30:00');

INSERT INTO Comments (comment_id, video_name, username, comment_text, timestamp)
VALUES (uuid(), 'Cooking Masterclass', 'grace_martin', 'This recipe is a game-changer. My family loved it!', '2024-01-07 16:45:00');

INSERT INTO Comments (comment_id, video_name, username, comment_text, timestamp)
VALUES (uuid(), 'Cooking Masterclass', 'oliver_wilkins', 'Your videos inspire me to cook more. Keep up the great work!', '2024-01-07 18:00:00');

INSERT INTO Comments (comment_id, video_name, username, comment_text, timestamp)
VALUES (uuid(), 'Cooking Masterclass', 'penelope_jackson', 'I have been following your recipes, and they never disappoint. Another fantastic one!', '2024-01-07 19:15:00');

##CommentsByVideo
INSERT INTO CommentsByVideo (video_name, timestamp, username, comment_id, comment_text)
VALUES ('Fitness Journey', '2024-01-02 17:00:00', 'frank_harris', uuid(), 'Great workout tips. Keep it up!');

INSERT INTO CommentsByVideo (video_name, timestamp, username, comment_id, comment_text)
VALUES ('Vacation Adventure', '2024-01-02 10:15:00', 'alice_jones', uuid(), 'Amazing scenery! Can not wait to visit.');

INSERT INTO CommentsByVideo (video_name, timestamp, username, comment_id, comment_text)
VALUES ('Vacation Adventure', '2024-01-02 11:30:00', 'carol_miller', uuid(), 'Incredible! Love the travel vibes.');

INSERT INTO CommentsByVideo (video_name, timestamp, username, comment_id, comment_text)
VALUES ('Cooking Masterclass', '2024-01-02 13:00:00', 'bob_smith', uuid(), 'This recipe changed my cooking game!');

INSERT INTO CommentsByVideo (video_name, timestamp, username, comment_id, comment_text)
VALUES ('Cooking Masterclass', '2024-01-02 14:15:00', 'david_taylor', uuid(), 'Delicious! Thanks for sharing.');

INSERT INTO CommentsByVideo (video_name, timestamp, username, comment_id, comment_text)
VALUES ('Tech Reviews', '2024-01-02 18:30:00', 'grace_martin', uuid(), 'Informative tech review. Thanks for sharing!');

INSERT INTO CommentsByVideo (video_name, timestamp, username, comment_id, comment_text)
VALUES ('Tech Reviews', '2024-01-02 19:45:00', 'henry_roberts', uuid(), 'Your insights on the latest gadgets are great!');

INSERT INTO CommentsByVideo (video_name, timestamp, username, comment_id, comment_text)
VALUES ('DIY Home Decor', '2024-01-02 21:15:00', 'isabel_davis', uuid(), 'Love your creative ideas for home decor!');

INSERT INTO CommentsByVideo (video_name, timestamp, username, comment_id, comment_text)
VALUES ('DIY Home Decor', '2024-01-02 22:30:00', 'jack_thompson', uuid(), 'Inspired to try some DIY projects at home.');

INSERT INTO CommentsByVideo (video_name, timestamp, username, comment_id, comment_text)
VALUES ('Guitar Jam Session', '2024-01-02 23:45:00', 'oliver_wilkins', uuid(), 'Beautiful music! Enjoyed the jam session.');

INSERT INTO CommentsByVideo (video_name, timestamp, username, comment_id, comment_text)
VALUES ('Guitar Jam Session', '2024-01-03 01:00:00', 'penelope_jackson', uuid(), 'Your guitar skills are amazing.');

INSERT INTO CommentsByVideo (video_name, timestamp, username, comment_id, comment_text)
VALUES ('Nature Photography', '2024-01-03 02:30:00', 'quinn_nelson', uuid(), 'Captivating photos! Natures beauty is truly stunning.');

INSERT INTO CommentsByVideo (video_name, timestamp, username, comment_id, comment_text)
VALUES ('Nature Photography', '2024-01-03 03:45:00', 'rachel_smithson', uuid(), 'Your photography skills are on point.');

INSERT INTO CommentsByVideo (video_name, timestamp, username, comment_id, comment_text)
VALUES ('Book Recommendations', '2024-01-03 05:15:00', 'samuel_tucker', uuid(), 'Adding these books to my reading list. Thanks for the recommendations!');

INSERT INTO CommentsByVideo (video_name, timestamp, username, comment_id, comment_text)
VALUES ('Book Recommendations', '2024-01-03 06:30:00', 'sophie_miller', uuid(), 'Your book choices are excellent! Excited to read them.');

INSERT INTO CommentsByVideo (video_name, timestamp, username, comment_id, comment_text)
VALUES ('Nature Photography', '2024-01-03 05:15:00', 'alice_jones', uuid(), 'Loving this new series. Next trey taking pictures of rocks. It is a whole another universe.');

INSERT INTO CommentsByVideo (video_name, timestamp, username, comment_id, comment_text)
VALUES ('Exploring Aveiro', '2024-01-03 06:30:00', 'isabel_davis', uuid(), 'Loved the video. Excited to visit.');

INSERT INTO CommentsByVideo (video_name, timestamp, comment_id, username, comment_text)
VALUES ('Cooking Masterclass', '2024-01-07 14:00:00', uuid(), 'emma_wilson', 'I tried your recipe, and it turned out amazing! Thanks for sharing.');

INSERT INTO CommentsByVideo (video_name, timestamp, comment_id, username, comment_text)
VALUES ('Cooking Masterclass', '2024-01-07 15:30:00', uuid(), 'samuel_tucker', 'Your cooking tips are always so helpful. Can not wait to try this dish.');

INSERT INTO CommentsByVideo (video_name, timestamp, comment_id, username, comment_text)
VALUES ('Cooking Masterclass', '2024-01-07 16:45:00', uuid(), 'grace_martin', 'This recipe is a game-changer. My family loved it!');

INSERT INTO CommentsByVideo (video_name, timestamp, comment_id, username, comment_text)
VALUES ('Cooking Masterclass', '2024-01-07 18:00:00', uuid(), 'oliver_wilkins', 'Your videos inspire me to cook more. Keep up the great work!');

INSERT INTO CommentsByVideo (video_name, timestamp, comment_id, username, comment_text)
VALUES ('Cooking Masterclass', '2024-01-07 19:15:00', uuid(), 'penelope_jackson', 'I have been following your recipes, and they never disappoint. Another fantastic one!');

##Followers
INSERT INTO Followers (user_username, video_name)
VALUES ('john_doe', 'Vacation Adventure');
INSERT INTO Followers (user_username, video_name)
VALUES ('john_doe', 'Cooking Masterclass');
INSERT INTO Followers (user_username, video_name)
VALUES ('john_doe', 'Fitness Journey');

INSERT INTO Followers (user_username, video_name)
VALUES ('jane_smith', 'Vacation Adventure');
INSERT INTO Followers (user_username, video_name)
VALUES ('jane_smith', 'Tech Reviews');
INSERT INTO Followers (user_username, video_name)
VALUES ('jane_smith', 'Nature Photography');

INSERT INTO Followers (user_username, video_name)
VALUES ('bob_smith', 'Cooking Masterclass');
INSERT INTO Followers (user_username, video_name)
VALUES ('bob_smith', 'Guitar Jam Session');
INSERT INTO Followers (user_username, video_name)
VALUES ('bob_smith', 'Book Recommendations');

INSERT INTO Followers (user_username, video_name)
VALUES ('carol_miller', 'Fitness Journey');
INSERT INTO Followers (user_username, video_name)
VALUES ('carol_miller', 'DIY Home Decor');
INSERT INTO Followers (user_username, video_name)
VALUES ('carol_miller', 'Nature Photography');

INSERT INTO Followers (user_username, video_name)
VALUES ('david_taylor', 'Cooking Masterclass');
INSERT INTO Followers (user_username, video_name)
VALUES ('david_taylor', 'Vacation Adventure');
INSERT INTO Followers (user_username, video_name)
VALUES ('david_taylor', 'Book Recommendations');

INSERT INTO Followers (user_username, video_name)
VALUES ('emma_wilson', 'Tech Reviews');
INSERT INTO Followers (user_username, video_name)
VALUES ('emma_wilson', 'Guitar Jam Session');
INSERT INTO Followers (user_username, video_name)
VALUES ('emma_wilson', 'DIY Home Decor');

INSERT INTO Followers (user_username, video_name)
VALUES ('frank_harris', 'Nature Photography');
INSERT INTO Followers (user_username, video_name)
VALUES ('frank_harris', 'Fitness Journey');
INSERT INTO Followers (user_username, video_name)
VALUES ('frank_harris', 'Cooking Masterclass');

INSERT INTO Followers (user_username, video_name)
VALUES ('grace_martin', 'Vacation Adventure');
INSERT INTO Followers (user_username, video_name)
VALUES ('grace_martin', 'Tech Reviews');
INSERT INTO Followers (user_username, video_name)
VALUES ('grace_martin', 'Nature Photography');

##Ratings
INSERT INTO Ratings (video_name, user_username, rating) VALUES ('Vacation Adventure', 'samantha_jones', 1);
INSERT INTO Ratings (video_name, user_username, rating) VALUES ('Vacation Adventure', 'michael_smith', 3);

INSERT INTO Ratings (video_name, user_username, rating) VALUES ('Cooking Masterclass', 'olivia_taylor', 2);
INSERT INTO Ratings (video_name, user_username, rating) VALUES ('Cooking Masterclass', 'liam_anderson', 4);

INSERT INTO Ratings (video_name, user_username, rating) VALUES ('Fitness Journey', 'natalie_white', 1);
INSERT INTO Ratings (video_name, user_username, rating) VALUES ('Fitness Journey', 'rachel_smithson', 3);

INSERT INTO Ratings (video_name, user_username, rating) VALUES ('Tech Reviews', 'samuel_tucker', 2);
INSERT INTO Ratings (video_name, user_username, rating) VALUES ('Tech Reviews', 'sophie_miller', 4);

INSERT INTO Ratings (video_name, user_username, rating) VALUES ('DIY Home Decor', 'alex_jackson', 1);
INSERT INTO Ratings (video_name, user_username, rating) VALUES ('DIY Home Decor', 'sophia_miller', 3);

INSERT INTO Ratings (video_name, user_username, rating) VALUES ('Guitar Jam Session', 'liam_anderson', 2);
INSERT INTO Ratings (video_name, user_username, rating) VALUES ('Guitar Jam Session', 'penelope_jackson', 4);

INSERT INTO Ratings (video_name, user_username, rating) VALUES ('Nature Photography', 'quinn_nelson', 1);
INSERT INTO Ratings (video_name, user_username, rating) VALUES ('Nature Photography', 'rachel_smithson', 3);

INSERT INTO Ratings (video_name, user_username, rating) VALUES ('Book Recommendations', 'samuel_tucker', 2);
INSERT INTO Ratings (video_name, user_username, rating) VALUES ('Book Recommendations', 'sophie_miller', 4);

#Events
INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'john_doe', 'Vacation Adventure', 'play', '2023-12-01 14:35:54', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'jane_smith', 'Cooking Masterclass', 'play', '2023-12-01 15:20:12', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'bob_smith', 'Fitness Journey', 'play', '2023-12-01 16:45:30', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'carol_miller', 'Tech Reviews', 'play', '2023-12-01 17:55:21', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'john_doe', 'Vacation Adventure', 'pause', '2023-12-01 14:45:00', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'john_doe', 'Vacation Adventure', 'stop', '2023-12-01 14:50:22', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'frank_harris', 'Guitar Jam Session', 'stop', '2023-12-01 19:40:22', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'emma_wilson', 'DIY Home Decor', 'play', '2023-12-01 18:15:45', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'frank_harris', 'Guitar Jam Session', 'play', '2023-12-01 19:30:00', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'grace_martin', 'Nature Photography', 'play', '2023-12-01 20:45:18', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'henry_roberts', 'Book Recommendations', 'play', '2023-12-01 22:00:37', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'emma_wilson', 'DIY Home Decor', 'pause', '2023-12-01 18:25:00', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'isabel_davis', 'Tech Reviews', 'play', '2023-12-02 09:15:30', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'isabel_davis', 'Tech Reviews', 'pause', '2023-12-02 09:25:00', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'isabel_davis', 'Tech Reviews', 'play', '2023-12-02 09:30:45', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'isabel_davis', 'Tech Reviews', 'stop', '2023-12-02 09:40:15', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'isabel_davis', 'Tech Reviews', 'play', '2023-12-02 10:00:30', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'isabel_davis', 'Tech Reviews', 'pause', '2023-12-02 10:10:00', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'jack_thompson', 'Vacation Adventure', 'play', '2023-12-02 10:30:45', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'olivia_taylor', 'Cooking Masterclass', 'play', '2023-12-02 11:45:15', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'liam_anderson', 'Fitness Journey', 'play', '2023-12-02 13:00:22', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'isabel_davis', 'Tech Reviews', 'pause', '2023-12-02 09:25:00', now());

INSERT INTO Events (event_id, user_username, video_name, event_type, event_timestamp, video_time)
VALUES (uuid(), 'jack_thompson', 'Vacation Adventure', 'stop', '2023-12-02 10:40:18', now());
