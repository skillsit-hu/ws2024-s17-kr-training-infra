-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： db
-- 生成日期： 2024-06-03 09:17:40
-- 服务器版本： 10.5.15-MariaDB-1:10.5.15+maria~focal
-- PHP 版本： 8.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `booom`
--

-- --------------------------------------------------------

--
-- 表的结构 `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `admins`
--

INSERT INTO `admins` (`id`, `name`, `password_digest`, `created_at`, `updated_at`) VALUES
(1, 'admin1', '$2a$12$aiko3WFve2vE55LF060w7.1hLJ5S.EVnh2hQc1Q.FK.iCEYtF2s.K', '2024-06-03 09:14:41.506969', '2024-06-03 09:14:41.506969'),
(2, 'admin2', '$2a$12$BSO/wQX5tbYkoMpBKyI3NOTWhVjNpKy4/dPeIH8LTD8Sgmhxl3hN6', '2024-06-03 09:14:41.731701', '2024-06-03 09:14:41.731701');

-- --------------------------------------------------------

--
-- 表的结构 `ar_internal_metadata`
--

CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `ar_internal_metadata`
--

INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
('environment', 'development', '2024-06-03 09:14:37.645146', '2024-06-03 09:14:37.645146');

-- --------------------------------------------------------

--
-- 表的结构 `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `state` varchar(255) DEFAULT 'draft',
  `user_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `courses`
--

INSERT INTO `courses` (`id`, `title`, `slug`, `description`, `state`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Introduction to SQL', 'CM429-07-2024-C', 'Introduction to SQL', 'draft', 1, '2024-06-03 09:14:42.350014', '2024-06-03 09:14:42.350014'),
(2, 'Cross platform mobile App development with JavaScript', 'CM521-06-2024-C', 'Cross platform mobile App development with JavaScript', 'draft', 1, '2024-06-03 09:14:42.362702', '2024-06-03 09:14:42.362702'),
(3, 'WeChat platform operation and article production', 'CM532-07-2024-C', 'WeChat platform operation and article production', 'draft', 1, '2024-06-03 09:14:42.370863', '2024-06-03 09:14:42.370863'),
(4, 'Introduction to Python programming', 'CM540-06-2024-C', 'Introduction to Python programming', 'published', 1, '2024-06-03 09:14:42.381274', '2024-06-03 09:14:42.381274'),
(5, 'Web UI Design with Adobe XD', 'CM571-07-2024-C', 'Web UI Design with Adobe XD', 'published', 2, '2024-06-03 09:14:42.390008', '2024-06-03 09:14:42.390008');

-- --------------------------------------------------------

--
-- 表的结构 `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `room_id` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `from` time DEFAULT NULL,
  `to` time DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `lessons`
--

INSERT INTO `lessons` (`id`, `course_id`, `room_id`, `date`, `from`, `to`, `created_at`, `updated_at`) VALUES
(1, 4, 1, '2024-06-03', '10:45:00', '13:45:00', '2024-06-03 09:14:42.417536', '2024-06-03 09:14:42.417536'),
(2, 4, 1, '2024-06-06', '10:45:00', '13:45:00', '2024-06-03 09:14:42.426005', '2024-06-03 09:14:42.426005');

-- --------------------------------------------------------

--
-- 表的结构 `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `rooms`
--

INSERT INTO `rooms` (`id`, `title`, `description`, `capacity`, `created_at`, `updated_at`) VALUES
(1, 'C212', '21 PC with windows 11, AutoCAD', 21, '2024-06-03 09:14:42.302599', '2024-06-03 09:14:42.302599'),
(2, 'C213', '31 iMac with Adobe CC', 31, '2024-06-03 09:14:42.309591', '2024-06-03 09:14:42.309591');

-- --------------------------------------------------------

--
-- 表的结构 `room_unavailable_times`
--

CREATE TABLE `room_unavailable_times` (
  `id` bigint(20) NOT NULL,
  `room_id` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `from` time DEFAULT NULL,
  `to` time DEFAULT NULL,
  `fullday` tinyint(1) DEFAULT 0,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20240527065107'),
('20240527070810'),
('20240527094656'),
('20240528100125'),
('20240528101849'),
('20240528104810');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `name`, `password_digest`, `created_at`, `updated_at`) VALUES
(1, 'user1', '$2a$12$LkEpDprUF9.mNRIzjK5rXeTiJOP4/D4z5/4u8MCEhUzCw5V87PM.q', '2024-06-03 09:14:42.036887', '2024-06-03 09:14:42.036887'),
(2, 'user2', '$2a$12$JJJvCL7I2sVjP0NWc29z.ejk/VrS/Xz05jpAsMm6jptzcu70zZzCy', '2024-06-03 09:14:42.279429', '2024-06-03 09:14:42.279429');

--
-- 转储表的索引
--

--
-- 表的索引 `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ar_internal_metadata`
--
ALTER TABLE `ar_internal_metadata`
  ADD PRIMARY KEY (`key`);

--
-- 表的索引 `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_courses_on_user_id` (`user_id`);

--
-- 表的索引 `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_lessons_on_course_id` (`course_id`),
  ADD KEY `index_lessons_on_room_id` (`room_id`);

--
-- 表的索引 `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `room_unavailable_times`
--
ALTER TABLE `room_unavailable_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_room_unavailable_times_on_room_id` (`room_id`);

--
-- 表的索引 `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD PRIMARY KEY (`version`);

--
-- 表的索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `room_unavailable_times`
--
ALTER TABLE `room_unavailable_times`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 限制导出的表
--

--
-- 限制表 `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `fk_rails_b3c61f05ef` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- 限制表 `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `fk_rails_4bcdb571d9` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `fk_rails_c0de55b8ec` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- 限制表 `room_unavailable_times`
--
ALTER TABLE `room_unavailable_times`
  ADD CONSTRAINT `fk_rails_01e6b34252` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
