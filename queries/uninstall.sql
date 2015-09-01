--
-- Uninstall module World
--

-- --------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE `world_countries`;
DROP TABLE `world_regions`;
DROP TABLE `world_districts`;
DROP TABLE `world_cities`;
SET FOREIGN_KEY_CHECKS = 1;

-- --------------------------------------------------------