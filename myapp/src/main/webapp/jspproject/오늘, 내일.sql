CREATE TABLE `user` (
  `user_id` varchar(50) UNIQUE PRIMARY KEY NOT NULL,
  `user_pwd` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(50) UNIQUE NOT NULL,
  `user_phone` varchar(20) UNIQUE NOT NULL,
  `grade` int NOT NULL,
  `user_icon` varchar(255)
);

CREATE TABLE `timer` (
  `timer_id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `timer_title` varchar(100),
  `timer_cnt` varchar(300),
  `timer_img` varchar(255)
);

CREATE TABLE `user_timer` (
  `user_timer_id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50),
  `timer_id` int,
  `timer_session` int,
  `timer_break` int,
  `timer_loc` int NOT NULL
);

CREATE TABLE `tema` (
  `tema_id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50),
  `tema_title` varchar(100),
  `tema_bimg` varchar(255),
  `tema_cnt` varchar(300),
  `tema_dark` int,
  `tema_onoff` int NOT NULL,
  `tema_img` varchar(255)
);

CREATE TABLE `obj` (
  `obj_id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50),
  `obj_title` varchar(50) NOT NULL,
  `obj_check` INT DEFAULT(0), 
  `obj_regdate` date,
  `obj_sdate` date,
  `obj_edate` DATE,
  `objgroup_id` INT NOT NULL
);

CREATE TABLE `jour` (
  `jour_id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50),
  `jour_title` varchar(50) NOT NULL,
  `jour_cnt` varchar(255),
  `jour_regdate` date
);

CREATE TABLE `bgm` (
  `bgm_id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50),
  `bgm_name` varchar(255) NOT NULL,
  `bgm_cnt` varchar(300),
  `bgm_music` varchar(255) NOT NULL,
  `bgm_onoff` int,
  `bgm_image` varchar(255)
);

CREATE TABLE `anc` (
  `anc_id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50),
  `anc_title` varchar(100) NOT NULL,
  `anc_cnt` varchar(500) NOT NULL,
  `anc_regdate` date,
  `anc_img` varchar(255)
);

CREATE TABLE `notifi` (
  `notifi_id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50),
  `notifi_title` varchar(100) NOT NULL,
  `notifi_cnt` varchar(255) NOT NULL,
  `notifi_regdate` date,
  `notifi_check` int
);

CREATE TABLE `mplist` (
  `mplist_id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `mplist_name` varchar(255) NOT NULL,
  `user_id` varchar(255),
  `mplist_cnt` varchar(300),
  `mplist_img` varchar(255)
);

CREATE TABLE `mplistmgr` (
  `mplistmgr_id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `mplist_id` int,
  `bgm_id` int,
  `user_id` varchar(255)
);

CREATE TABLE `objgroup` (
  `objgroup_id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `objgroup_name` varchar(255) NOT NULL,
  `user_id` VARCHAR(50)
);

CREATE TABLE `id_check` (
	`user_id` VARCHAR(50)
);

-- 🔗 외래키 설정
ALTER TABLE `tema` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
ALTER TABLE `obj` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
ALTER TABLE `jour` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
ALTER TABLE `bgm` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
ALTER TABLE `anc` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
ALTER TABLE `notifi` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
ALTER TABLE `mplist` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
ALTER TABLE `mplistmgr` ADD FOREIGN KEY (`bgm_id`) REFERENCES `bgm` (`bgm_id`) ON DELETE CASCADE;
ALTER TABLE `mplistmgr` ADD FOREIGN KEY (`mplist_id`) REFERENCES `mplist` (`mplist_id`) ON DELETE CASCADE;
ALTER TABLE `mplistmgr` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
ALTER TABLE `objgroup` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
ALTER TABLE `obj` ADD FOREIGN KEY (`objgroup_id`) REFERENCES `objgroup` (`objgroup_id`) ON DELETE CASCADE;
ALTER TABLE `id_check` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
ALTER TABLE `user_timer` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
ALTER TABLE `user_timer` ADD FOREIGN KEY (`timer_id`) REFERENCES `timer` (`timer_id`);

INSERT INTO timer (timer_title, timer_cnt, timer_img)
VALUES ('기본 타이머', '기본으로 적용되는 타이머입니다.', '기본타이머.png');
