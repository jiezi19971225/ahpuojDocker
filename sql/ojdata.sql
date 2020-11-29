START TRANSACTION;
USE `oj`;
INSERT INTO `oj`.`config` (`item`, `value`) VALUES ('enable_issue', 'true');

COMMIT;


-- -----------------------------------------------------
-- Data for table `oj`.`role`
-- -----------------------------------------------------
START TRANSACTION;
USE `oj`;
INSERT INTO `oj`.`role` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (1, 'user', '', NOW(), NOW());
INSERT INTO `oj`.`role` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (2, 'admin', '', NOW(), NOW());
INSERT INTO `oj`.`role` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (3, 'secondaryadmin', '', NOW(), NOW());

COMMIT;


-- -----------------------------------------------------
-- Data for table `oj`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `oj`;
INSERT INTO `oj`.`user` (`id`, `email`, `username`, `nick`, `avatar`, `passsalt`, `password`, `submit`, `solved`, `defunct`, `created_at`, `updated_at`, `is_compete_user`, `role_id`) VALUES (1, '\'\'', 'admin', 'admin', 'static/images/default_avatar.png', 'abcdefghijklmnop', '72bd4f7ef86a8492eba63b96ee11d1f329fff8cc', 0, 0, 0, NOW(), NOW(), 0, 2);

COMMIT;