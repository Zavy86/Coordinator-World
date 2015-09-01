--
-- Setup module Contacts
--

-- --------------------------------------------------------

--
-- Table structure for table `world_countries`
--

CREATE TABLE IF NOT EXISTS `world_countries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `iso` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `areaCode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `world_regions`
--

CREATE TABLE IF NOT EXISTS `world_regions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idCountry` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCountry` (`idCountry`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `world_districts`
--

CREATE TABLE IF NOT EXISTS `world_districts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idRegion` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idRegion` (`idRegion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `world_cities`
--

CREATE TABLE IF NOT EXISTS `world_cities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idDistrict` int(11) unsigned NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idDistrict` (`idDistrict`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Constraints for dumped tables
--

--
-- Constraints for table `world_regions`
--
ALTER TABLE `world_regions`
  ADD CONSTRAINT `world_regions_ibfk_1` FOREIGN KEY (`idCountry`) REFERENCES `world_countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `world_districts`
--
ALTER TABLE `world_districts`
  ADD CONSTRAINT `world_districts_ibfk_1` FOREIGN KEY (`idRegion`) REFERENCES `world_regions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `world_cities`
--
ALTER TABLE `world_cities`
  ADD CONSTRAINT `world_cities_ibfk_1` FOREIGN KEY (`idDistrict`) REFERENCES `world_districts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- --------------------------------------------------------

--
-- Dumping IT - Italy tables data
--

--
-- Dumping data for table `world_countries`
--

INSERT INTO `world_countries` (`id`, `iso`, `name`, `areaCode`) VALUES
(1, 'IT', 'Italy', '+39');

--
-- Dumping data for table `world_regions`
--

INSERT INTO `world_regions` (`id`, `idCountry`, `name`) VALUES
(1, 1, 'Abruzzo'),
(2, 1, 'Basilicata'),
(3, 1, 'Calabria'),
(4, 1, 'Campania'),
(5, 1, 'Emilia-Romagna'),
(6, 1, 'Friuli-Venezia Giulia'),
(7, 1, 'Lazio'),
(8, 1, 'Liguria'),
(9, 1, 'Lombardia'),
(10, 1, 'Marche'),
(11, 1, 'Molise'),
(12, 1, 'Piemonte'),
(13, 1, 'Puglia'),
(14, 1, 'Sardegna'),
(15, 1, 'Sicilia'),
(16, 1, 'Toscana'),
(17, 1, 'Trentino-Alto Adige'),
(18, 1, 'Umbria'),
(19, 1, 'Valle d''Aosta'),
(20, 1, 'Veneto');

--
-- Dumping data for table `world_districts`
--

INSERT INTO `world_districts` (`id`, `idRegion`, `name`) VALUES
(1, 1, 'CH'),
(2, 1, 'AQ'),
(3, 1, 'PE'),
(4, 1, 'TE'),
(5, 2, 'MT'),
(6, 2, 'PZ'),
(7, 3, 'CZ'),
(8, 3, 'CS'),
(9, 3, 'KR'),
(10, 3, 'RC'),
(11, 3, 'VV'),
(12, 4, 'AV'),
(13, 4, 'BN'),
(14, 4, 'CE'),
(15, 4, 'NA'),
(16, 4, 'SA'),
(17, 5, 'BO'),
(18, 5, 'FE'),
(19, 5, 'FC'),
(20, 5, 'MO'),
(21, 5, 'PR'),
(22, 5, 'PC'),
(23, 5, 'RA'),
(24, 5, 'RE'),
(25, 5, 'RN'),
(26, 6, 'GO'),
(27, 6, 'PN'),
(28, 6, 'TS'),
(29, 6, 'UD'),
(30, 7, 'FR'),
(31, 7, 'LT'),
(32, 7, 'RI'),
(33, 7, 'RM'),
(34, 7, 'VT'),
(35, 8, 'GE'),
(36, 8, 'IM'),
(37, 8, 'SP'),
(38, 8, 'SV'),
(39, 9, 'BG'),
(40, 9, 'BS'),
(41, 9, 'CO'),
(42, 9, 'CR'),
(43, 9, 'LC'),
(44, 9, 'LO'),
(45, 9, 'MN'),
(46, 9, 'MI'),
(47, 9, 'MB'),
(48, 9, 'PV'),
(49, 9, 'SO'),
(50, 9, 'VA'),
(51, 10, 'AN'),
(52, 10, 'AP'),
(53, 10, 'FM'),
(54, 10, 'MC'),
(55, 10, 'PU'),
(56, 11, 'CB'),
(57, 11, 'IS'),
(58, 12, 'AL'),
(59, 12, 'AT'),
(60, 12, 'BI'),
(61, 12, 'CN'),
(62, 12, 'NO'),
(63, 12, 'TO'),
(64, 12, 'VB'),
(65, 12, 'VC'),
(66, 13, 'BA'),
(67, 13, 'BT'),
(68, 13, 'BR'),
(69, 13, 'FG'),
(70, 13, 'LE'),
(71, 13, 'TA'),
(72, 14, 'CA'),
(73, 14, 'CI'),
(74, 14, 'VS'),
(75, 14, 'NU'),
(76, 14, 'OG'),
(77, 14, 'OT'),
(78, 14, 'OR'),
(79, 14, 'SS'),
(80, 15, 'AG'),
(81, 15, 'CL'),
(82, 15, 'CT'),
(83, 15, 'EN'),
(84, 15, 'ME'),
(85, 15, 'PA'),
(86, 15, 'RG'),
(87, 15, 'SR'),
(88, 15, 'TP'),
(89, 16, 'AR'),
(90, 16, 'FI'),
(91, 16, 'GR'),
(92, 16, 'LI'),
(93, 16, 'LU'),
(94, 16, 'MS'),
(95, 16, 'PI'),
(96, 16, 'PT'),
(97, 16, 'PO'),
(98, 16, 'SI'),
(99, 17, 'BZ'),
(100, 17, 'TN'),
(101, 18, 'PG'),
(102, 18, 'TR'),
(103, 19, 'AO'),
(104, 20, 'BL'),
(105, 20, 'PD'),
(106, 20, 'RO'),
(107, 20, 'TV'),
(108, 20, 'VE'),
(109, 20, 'VR'),
(110, 20, 'VI');

-- --------------------------------------------------------

--
-- Dumping CH - Switzerland tables data
--

--
-- Dumping data for table `world_countries`
--

INSERT INTO `world_countries` (`id`, `iso`, `name`, `areaCode`) VALUES
(2, 'CH', 'Switzerland', '+41');

--
-- Dumping data for table `world_regions`
--

INSERT INTO `world_regions` (`id`, `idCountry`, `name`) VALUES
(21, 2, 'AG'),
(22, 2, 'AI'),
(23, 2, 'AR'),
(24, 2, 'BE'),
(25, 2, 'BL'),
(26, 2, 'BS'),
(27, 2, 'FR'),
(28, 2, 'GE'),
(29, 2, 'GL'),
(30, 2, 'GR'),
(31, 2, 'JU'),
(32, 2, 'LU'),
(33, 2, 'NE'),
(34, 2, 'NW'),
(35, 2, 'OW'),
(36, 2, 'SG'),
(37, 2, 'SH'),
(38, 2, 'SO'),
(39, 2, 'SZ'),
(40, 2, 'TG'),
(41, 2, 'TI'),
(42, 2, 'UR'),
(43, 2, 'VD'),
(44, 2, 'VS'),
(45, 2, 'ZG'),
(46, 2, 'ZH');

--
-- Dumping data for table `world_districts`
--

INSERT INTO `world_districts` (`id`, `idRegion`, `name`) VALUES
(111, 21, 'Aarau'),
(112, 21, 'Baden'),
(113, 21, 'Bremgarten'),
(114, 21, 'Brugg'),
(115, 21, 'Kulm'),
(116, 21, 'Laufenburg'),
(117, 21, 'Lenzburg'),
(118, 21, 'Muri'),
(119, 21, 'Rheinfelden'),
(120, 21, 'Zofingue'),
(121, 21, 'Zurzach'),
(122, 22, 'Appenzell'),
(123, 22, 'Gonten'),
(124, 22, 'Oberegg'),
(125, 22, 'Rüte'),
(126, 22, 'Schlatt-Haslen'),
(127, 22, 'Schwende'),
(128, 23, 'Appenzell Ausserrhoden '),
(129, 24, 'Berne-Mittelland'),
(130, 24, 'Bienne'),
(131, 24, 'Emmental'),
(132, 24, 'Frutigen-Niedersimmental'),
(133, 24, 'Interlaken-Oberhasli'),
(134, 24, 'Jura bernois'),
(135, 24, 'Oberargau'),
(136, 24, 'Obersimmental-Saanen'),
(137, 24, 'Seeland'),
(138, 24, 'Thun'),
(139, 25, 'Arlesheim'),
(140, 25, 'Laufen'),
(141, 25, 'Liestal'),
(142, 25, 'Sissach'),
(143, 25, 'Waldenburg'),
(144, 26, 'Basel-Stadt'),
(145, 27, 'Broye'),
(146, 27, 'Glâne'),
(147, 27, 'Gruyère'),
(148, 27, 'Lac'),
(149, 27, 'Sarine'),
(150, 27, 'Sense'),
(151, 27, 'Veveyse'),
(152, 28, 'Genève '),
(153, 29, 'Glarus '),
(154, 30, 'Albula'),
(155, 30, 'Bernina'),
(156, 30, 'Hinterrhein'),
(157, 30, 'Imboden'),
(158, 30, 'Inn'),
(159, 30, 'Landquart'),
(160, 30, 'Maloggia'),
(161, 30, 'Moesa'),
(162, 30, 'Plessur'),
(163, 30, 'Prättigau/Davos'),
(164, 30, 'Surselva'),
(165, 31, 'Delémont'),
(166, 31, 'Franches-Montagnes'),
(167, 31, 'Porrentruy'),
(168, 32, 'Entlebuch'),
(169, 32, 'Hochdorf'),
(170, 32, 'Luzern'),
(171, 32, 'Sursee'),
(172, 32, 'Willisau'),
(173, 33, 'Boudry'),
(174, 33, 'La Chaux-de-Fonds'),
(175, 33, 'Locle'),
(176, 33, 'Neuchâtel'),
(177, 33, 'Val-de-Ruz'),
(178, 33, 'Val-de-Travers'),
(179, 34, 'Nidwalden '),
(180, 35, 'Obwalden '),
(181, 36, 'Rheintal'),
(182, 36, 'Rorschach'),
(183, 36, 'Saint-Gall'),
(184, 36, 'Sarganserland'),
(185, 36, 'See-Gaster'),
(186, 36, 'Toggenburg'),
(187, 36, 'Werdenberg'),
(188, 36, 'Wil'),
(189, 37, 'Schaffhausen '),
(190, 38, 'Bucheggberg'),
(191, 38, 'Dorneck'),
(192, 38, 'Gäu'),
(193, 38, 'Gösgen'),
(194, 38, 'Lebern'),
(195, 38, 'Olten'),
(196, 38, 'Solothurn'),
(197, 38, 'Thal'),
(198, 38, 'Thierstein'),
(199, 38, 'Wasseramt'),
(200, 39, 'Einsiedeln'),
(201, 39, 'Gersau'),
(202, 39, 'Höfe'),
(203, 39, 'Küssnacht'),
(204, 39, 'March'),
(205, 39, 'Schwytz'),
(206, 40, 'Arbon'),
(207, 40, 'Frauenfeld'),
(208, 40, 'Kreuzlingen'),
(209, 40, 'Münchwilen'),
(210, 40, 'Weinfelden'),
(211, 41, 'Bellinzona'),
(212, 41, 'Blenio'),
(213, 41, 'Leventina'),
(214, 41, 'Locarno'),
(215, 41, 'Lugano'),
(216, 41, 'Mendrisio'),
(217, 41, 'Riviera'),
(218, 41, 'Vallemaggia'),
(219, 42, 'Uri'),
(220, 43, 'Aigle'),
(221, 43, 'Broye-Vully'),
(222, 43, 'Gros-de-Vaud'),
(223, 43, 'Jura-Nord vaudois'),
(224, 43, 'Lausanne'),
(225, 43, 'Lavaux-Oron'),
(226, 43, 'Morges'),
(227, 43, 'Nyon'),
(228, 43, 'Ouest lausannois'),
(229, 43, 'Riviera-Pays-d''Enhaut'),
(230, 44, 'Brig'),
(231, 44, 'Conthey'),
(232, 44, 'Entremont'),
(233, 44, 'Goms'),
(234, 44, 'Hérens'),
(235, 44, 'Leuk'),
(236, 44, 'Martigny'),
(237, 44, 'Monthey'),
(238, 44, 'Raron'),
(239, 44, 'Saint-Maurice'),
(240, 44, 'Sierre'),
(241, 44, 'Sion'),
(242, 44, 'Visp'),
(243, 45, 'Zug'),
(244, 46, 'Affoltern'),
(245, 46, 'Andelfingen'),
(246, 46, 'Bülach'),
(247, 46, 'Dielsdorf'),
(248, 46, 'Dietikon'),
(249, 46, 'Hinwil'),
(250, 46, 'Horgen'),
(251, 46, 'Meilen'),
(252, 46, 'Pfäffikon'),
(253, 46, 'Uster'),
(254, 46, 'Winterthour'),
(255, 46, 'Zurich');
