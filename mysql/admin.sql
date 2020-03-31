/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : go-admin-test

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 31/03/2020 11:25:08
*/
create database `go-admin-test` default character set utf8 collate utf8_general_ci;
use `go-admin-test`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goadmin_menu
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_menu`;
CREATE TABLE `goadmin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `order` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `header` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goadmin_menu
-- ----------------------------
INSERT INTO `goadmin_menu` VALUES (1, 0, 1, 2, 'Admin', 'fa-tasks', '', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_menu` VALUES (2, 1, 1, 2, 'Users', 'fa-users', '/info/manager', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_menu` VALUES (3, 1, 1, 3, 'Roles', 'fa-user', '/info/roles', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_menu` VALUES (4, 1, 1, 4, 'Permission', 'fa-ban', '/info/permission', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_menu` VALUES (5, 1, 1, 5, 'Menu', 'fa-bars', '/menu', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_menu` VALUES (6, 1, 1, 6, 'Operation log', 'fa-history', '/info/op', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_menu` VALUES (7, 0, 1, 1, 'Home', 'fa-bar-chart', '/', '', '2019-09-10 00:00:00', '2020-03-30 16:50:47');
INSERT INTO `goadmin_menu` VALUES (9, 0, 0, 2, 'temp', 'fa-bars', '', '自定义', '2020-03-27 17:22:27', '2020-03-27 17:23:04');
INSERT INTO `goadmin_menu` VALUES (10, 9, 0, 2, 'users', 'fa-bars', '/info/users', '', '2020-03-27 17:24:12', '2020-03-27 17:24:28');
INSERT INTO `goadmin_menu` VALUES (11, 9, 0, 2, 'user', 'fa-blind', '/info/user', '', '2020-03-27 17:53:12', '2020-03-27 17:53:12');

-- ----------------------------
-- Table structure for goadmin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_operation_log`;
CREATE TABLE `goadmin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 279 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goadmin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_permissions`;
CREATE TABLE `goadmin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goadmin_permissions
-- ----------------------------
INSERT INTO `goadmin_permissions` VALUES (1, 'All permission', '*', '', '*', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET,PUT,POST,DELETE', '/', '2019-09-10 00:00:00', '2019-09-10 00:00:00');

-- ----------------------------
-- Table structure for goadmin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_role_menu`;
CREATE TABLE `goadmin_role_menu`  (
  `role_id` int(11) UNSIGNED NOT NULL,
  `menu_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goadmin_role_menu
-- ----------------------------
INSERT INTO `goadmin_role_menu` VALUES (1, 8, '2019-09-11 10:20:55', '2019-09-11 10:20:55');
INSERT INTO `goadmin_role_menu` VALUES (2, 8, '2019-09-11 10:20:55', '2019-09-11 10:20:55');
INSERT INTO `goadmin_role_menu` VALUES (1, 10, '2020-03-27 17:24:28', '2020-03-27 17:24:28');
INSERT INTO `goadmin_role_menu` VALUES (1, 7, '2020-03-30 16:50:47', '2020-03-30 16:50:47');
INSERT INTO `goadmin_role_menu` VALUES (2, 7, '2020-03-30 16:50:47', '2020-03-30 16:50:47');

-- ----------------------------
-- Table structure for goadmin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_role_permissions`;
CREATE TABLE `goadmin_role_permissions`  (
  `role_id` int(11) UNSIGNED NOT NULL,
  `permission_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  UNIQUE INDEX `admin_role_permissions`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goadmin_role_permissions
-- ----------------------------
INSERT INTO `goadmin_role_permissions` VALUES (1, 1, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_role_permissions` VALUES (1, 2, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_role_permissions` VALUES (2, 2, '2019-09-10 00:00:00', '2019-09-10 00:00:00');

-- ----------------------------
-- Table structure for goadmin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_role_users`;
CREATE TABLE `goadmin_role_users`  (
  `role_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  UNIQUE INDEX `admin_user_roles`(`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goadmin_role_users
-- ----------------------------
INSERT INTO `goadmin_role_users` VALUES (1, 1, '2020-03-26 16:15:46', '2020-03-26 16:15:46');
INSERT INTO `goadmin_role_users` VALUES (2, 2, '2019-09-10 00:00:00', '2019-09-10 00:00:00');

-- ----------------------------
-- Table structure for goadmin_roles
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_roles`;
CREATE TABLE `goadmin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goadmin_roles
-- ----------------------------
INSERT INTO `goadmin_roles` VALUES (1, 'Administrator', 'administrator', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_roles` VALUES (2, 'Operator', 'operator', '2019-09-10 00:00:00', '2019-09-10 00:00:00');

-- ----------------------------
-- Table structure for goadmin_session
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_session`;
CREATE TABLE `goadmin_session`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `values` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goadmin_session
-- ----------------------------
INSERT INTO `goadmin_session` VALUES (6, 'a8046e33-68f7-4af6-b72e-9fa64a1540a2', '{\"user_id\":1}', '2020-03-31 10:38:02', '2020-03-31 10:38:02');

-- ----------------------------
-- Table structure for goadmin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_user_permissions`;
CREATE TABLE `goadmin_user_permissions`  (
  `user_id` int(11) UNSIGNED NOT NULL,
  `permission_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  UNIQUE INDEX `admin_user_permissions`(`user_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goadmin_user_permissions
-- ----------------------------
INSERT INTO `goadmin_user_permissions` VALUES (1, 1, '2020-03-26 16:15:46', '2020-03-26 16:15:46');
INSERT INTO `goadmin_user_permissions` VALUES (2, 2, '2019-09-10 00:00:00', '2019-09-10 00:00:00');

-- ----------------------------
-- Table structure for goadmin_users
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_users`;
CREATE TABLE `goadmin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goadmin_users
-- ----------------------------
INSERT INTO `goadmin_users` VALUES (1, 'admin', '$2a$10$IXK2WnmJaRZiS.p/YB12cONauC8O5lFNkyRL.ZTNfpCMuaFoMnZLG', 'admin1', '', 'tlNcBVK9AvfYH7WEnwB1RKvocJu8FfRy4um3DJtwdHuJy0dwFsLOgAc0xUfh', '2019-09-10 00:00:00', '2020-03-27 12:16:30');
INSERT INTO `goadmin_users` VALUES (2, 'operator', '$2a$10$rVqkOzHjN2MdlEprRflb1eGP0oZXuSrbJLOmJagFsCd81YZm0bsh.', 'Operator', '', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gender` tinyint(4) NULL DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (2, '123', 1, '123', '123', '123', '2020-03-26 00:00:00', '2020-03-28 00:00:00');
INSERT INTO `users` VALUES (3, '123', NULL, '123', '123', '123', '2020-03-27 17:30:08', NULL);

SET FOREIGN_KEY_CHECKS = 1;
