/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `pass_word` varchar(255) DEFAULT NULL,
  `face_app_id` varchar(255) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `refresh_token` text,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `video` (
  `video_id` int NOT NULL AUTO_INCREMENT,
  `video_name` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `description` text,
  `views` int DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`video_id`),
  KEY `user_id` (`user_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `video_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `video_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `video_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `video_comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `video_id` int DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `content` text,
  `reply_list` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `video_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `video_comment_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `video_like` (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `video_id` int DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `dis_like` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`like_id`),
  KEY `user_id` (`user_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `video_like_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `video_like_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `video_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `users` (`user_id`, `full_name`, `email`, `avatar`, `pass_word`, `face_app_id`, `role`, `refresh_token`) VALUES
(1, 'John Doe', 'john@example.com', 'http://localhost:8080/public/img/download.png', 'hashed_pass1', 'face123', 'user', NULL);
INSERT INTO `users` (`user_id`, `full_name`, `email`, `avatar`, `pass_word`, `face_app_id`, `role`, `refresh_token`) VALUES
(2, 'John Cena', 'jane@example.com', 'http://localhost:8080/public/img/download.png', '$2b$10$rLe90SjcvJIyiBVNNf5lAOtDRCnwDArZ6BGQd0ZCpsWBDYSI.e9cC', 'face456', 'user', NULL);
INSERT INTO `users` (`user_id`, `full_name`, `email`, `avatar`, `pass_word`, `face_app_id`, `role`, `refresh_token`) VALUES
(3, 'Admin User', 'admin@example.com', 'http://localhost:8080/public/img/download.png', 'hashed_pass3', 'face789', 'admin', NULL);
INSERT INTO `users` (`user_id`, `full_name`, `email`, `avatar`, `pass_word`, `face_app_id`, `role`, `refresh_token`) VALUES
(4, 'Alice Johnson', 'alice@example.com', 'http://localhost:8080/public/img/download.png', 'hashed_pass4', 'face987', 'user', NULL),
(5, 'Bob Brown', 'bob@example.com', 'http://localhost:8080/public/img/download.png', 'hashed_pass5', 'face654', 'user', NULL),
(7, 'Trần Ngọc Nhân', '111@gmail.com', 'http://localhost:8080/public/img/download.png', '$2b$10$NuCrSfdAXg0TFunCiu8ATu3t/qwF.X6P8igxoX4HMPXtJ/lqMhs0u', '', 'user', NULL),
(8, 'Ngọc Nhân', '', 'http://localhost:8080/public/img/download.png', '', '923249696130608', 'user', NULL),
(9, 'Nguyen Van Teo', 'abc@gmail.com', 'http://localhost:8080/public/img/download.png', '$2b$10$XsKdKES12IQLTdCGh5ST.O2L.9q2NYehS/ATUzKxpg.IzJXYlmFEy', '', 'user', NULL),
(10, 'Tran ', 'nhantran4102002@gmail.com', 'http://localhost:8080/public/img/download.png', '$2b$10$P/clSiRPN47yhR5G3eGcAekzuj9162f0BlNqGMl7tS0R3zuyD00em', '', 'user', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxMCwia2V5IjoxNzExOTYwMTU0NTA1LCJpYXQiOjE3MTE5NjAxNTQsImV4cCI6MTcxMjU2NDk1NH0.r39_0q7vtS6oi2zd2N4w5m1xAWX_3sR1z9ADPF22I1s'),
(11, NULL, '123@gmail.com', 'http://localhost:8080/public/img/download.png', '$2b$10$NCfZLkLiLB1OAsDYlpa5Ne1mupIHVp1aUC3LXumc5WAnZtmquhnku', '', 'user', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxMSwiaWF0IjoxNzExNjg4NjgwLCJleHAiOjE3MTIyOTM0ODB9.UEbbvvSpZG5GT1WjuyFfPPzv-Y8ifdBQ1I3BhRNBCy4'),
(12, 'tran ngoc 1', 'tranngocnhan@gmail.com', 'http://localhost:8080/public/img/download.png', '$2b$10$JZATB6c2wK/NWdaA47ZQqu9plIL214yEVVk7vdDH8HFU/rwBEefAm', '', 'user', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7InVzZXJfaWQiOjEyLCJrZXkiOjE3MTIyMjY3MzA5NDB9LCJpYXQiOjE3MTIyMjY3MzAsImV4cCI6MTcxMjgzMTUzMH0.JXKrGfrnFYzZV5oYVIbOHlfkkY7XawY4SGumCiefoq4'),
(13, 'Trần Ngọc Nhân', 'nhan@gmail.com', '1712967113257_meme2.jpg', '$2b$10$.hLKrx4piswTO8toCb448eAJutcayd9vv1Rjjry9sSigCqwMj3DxG', '', 'user', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7InVzZXJfaWQiOjEzLCJrZXkiOjE3MTI4MDEzODM4NDl9LCJpYXQiOjE3MTI4MDEzODMsImV4cCI6MTcxMzQwNjE4M30.le41Jovsp_McMkqkKZWb9psomhkVPwxsqRudef0-gVU'),
(14, 'spider man', 'spider@gmail.com', '1712895784613_meme2.jpg', '$2b$10$X4dbezcA5iOc.GlQy/Sl6uIdbGq0HEyuUrk5vqYIICrQslQYUAyXO', '', 'user', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7InVzZXJfaWQiOjE0LCJrZXkiOjE3MTI5NjE0ODM4Mjl9LCJpYXQiOjE3MTI5NjE0ODMsImV4cCI6MTcxMzU2NjI4M30.h7UBUL0NyI3fp0QjxK1_g99qsHnBPgYSsqmp1Pmnj6A');

INSERT INTO `video` (`video_id`, `video_name`, `thumbnail`, `description`, `views`, `source`, `user_id`, `type_id`) VALUES
(1, 'Introduction to Coding', 'meo.jpg', 'Learn the basics of coding', 1500, 'https://www.youtube.com/watch?v=hlL6jUhMlgM', 1, 2);
INSERT INTO `video` (`video_id`, `video_name`, `thumbnail`, `description`, `views`, `source`, `user_id`, `type_id`) VALUES
(2, 'Music Concert Highlights', 'meo.jpg', 'Highlights from a live music concert', 800, 'https://www.youtube.com/watch?v=hlL6jUhMlgM', 2, 3);
INSERT INTO `video` (`video_id`, `video_name`, `thumbnail`, `description`, `views`, `source`, `user_id`, `type_id`) VALUES
(3, 'Gaming Adventure Episode 1', 'meo.jpg', 'First episode of a gaming adventure', 2500, 'https://www.youtube.com/watch?v=hlL6jUhMlgM', 3, 5);
INSERT INTO `video` (`video_id`, `video_name`, `thumbnail`, `description`, `views`, `source`, `user_id`, `type_id`) VALUES
(4, 'Fashion Trends for Spring', 'meo.jpg', 'Latest fashion trends for the spring season', 1200, 'https://www.youtube.com/watch?v=hlL6jUhMlgM', 4, 7),
(5, 'Introduction to Cryptocurrency', 'meo.jpg', 'Understanding the basics of cryptocurrency', 300, 'https://www.youtube.com/watch?v=hlL6jUhMlgM', 5, 9),
(6, 'Full Stack Web Development Tutorial', 'meo.jpg', 'Complete guide to full stack web development', 1200, 'https://www.youtube.com/watch?v=hlL6jUhMlgM', 1, 2),
(7, 'Acoustic Guitar Performance', 'meo.jpg', 'Soulful acoustic guitar performance', 650, 'https://www.youtube.com/watch?v=hlL6jUhMlgM', 2, 3),
(8, 'Epic Gaming Moments Compilation', 'meo.jpg', 'Compilation of epic gaming moments', 3500, 'https://www.youtube.com/watch?v=hlL6jUhMlgM', 3, 5),
(9, 'Fitness Workout Routine', 'meo.jpg', 'Effective fitness workout routine', 900, 'https://www.youtube.com/watch?v=hlL6jUhMlgM', 4, 8),
(10, 'Understanding Blockchain Technology', 'meo.jpg', 'Exploring the concepts of blockchain', 500, 'https://www.youtube.com/watch?v=hlL6jUhMlgM', 5, 9);

INSERT INTO `video_comment` (`comment_id`, `user_id`, `video_id`, `date_create`, `content`, `reply_list`, `timestamp`) VALUES
(1, 5, 3, '2024-03-16 00:00:00', 'abc', NULL, NULL);
INSERT INTO `video_comment` (`comment_id`, `user_id`, `video_id`, `date_create`, `content`, `reply_list`, `timestamp`) VALUES
(2, 3, 3, '2024-03-16 00:00:00', '123asdb', NULL, NULL);
INSERT INTO `video_comment` (`comment_id`, `user_id`, `video_id`, `date_create`, `content`, `reply_list`, `timestamp`) VALUES
(3, 7, 2, '2024-03-25 00:00:00', 'abc', NULL, NULL);
INSERT INTO `video_comment` (`comment_id`, `user_id`, `video_id`, `date_create`, `content`, `reply_list`, `timestamp`) VALUES
(4, 7, 5, '2024-03-25 10:26:21', 'Phim hay', '', '2024-03-25 10:26:21'),
(5, 7, 1, '2024-03-25 10:26:39', 'Phim cũng được', '', '2024-03-25 10:26:39'),
(6, 9, 1, '2024-03-25 10:34:32', 'Phim cũng được', '', '2024-03-25 10:34:32'),
(7, 9, 6, '2024-03-27 06:25:05', 'Ok', '', '2024-03-27 06:25:05'),
(8, 9, 1, '2024-03-27 09:06:36', 'Ok', '', '2024-03-27 09:06:36'),
(9, 10, 2, '2024-03-27 09:09:03', 'Hi\n', '', '2024-03-27 09:09:03'),
(10, 10, 2, '2024-03-27 09:13:25', 'Hi my name is nhan\n\n', '', '2024-03-27 09:13:25');



INSERT INTO `video_type` (`type_id`, `type_name`, `icon`) VALUES
(1, 'New', 'fa-solid fa-house');
INSERT INTO `video_type` (`type_id`, `type_name`, `icon`) VALUES
(2, 'Coding', 'fa-solid fa-code');
INSERT INTO `video_type` (`type_id`, `type_name`, `icon`) VALUES
(3, 'Music', 'fa-solid fa-music');
INSERT INTO `video_type` (`type_id`, `type_name`, `icon`) VALUES
(4, 'Movie', 'fa-solid fa-video'),
(5, 'Gaming', 'fa-sharp fa-solid fa-gamepad'),
(6, 'Sport', 'fa-solid fa-baseball'),
(7, 'Fashion', 'fa-sharp fa-solid fa-shirt'),
(8, 'Gym', 'fa-solid fa-dumbbell'),
(9, 'Crypto', 'fa-solid fa-diamond');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;