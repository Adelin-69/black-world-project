-- phpMyAdmin SQL Dump
-- version 4.9.4deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 11, 2020 at 01:58 PM
-- Server version: 10.3.22-MariaDB-0ubuntu0.19.10.1
-- PHP Version: 7.3.11-0ubuntu0.19.10.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `server`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat_permissions`
--

CREATE TABLE `chat_permissions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `chat_permissions`
--

INSERT INTO `chat_permissions` (`id`, `userId`, `type`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `log_event_jpb`
--

CREATE TABLE `log_event_jpb` (
  `id` int(11) NOT NULL,
  `players` text COLLATE utf8_bin NOT NULL,
  `finalists` text COLLATE utf8_bin NOT NULL,
  `winner_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `log_player_kills`
--

CREATE TABLE `log_player_kills` (
  `id` int(11) NOT NULL,
  `killer_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `pushing` tinyint(1) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `player_accounts`
--

CREATE TABLE `player_accounts` (
  `userId` bigint(20) NOT NULL,
  `sessionId` varchar(32) COLLATE utf8_bin NOT NULL,
  `data` text COLLATE utf8_bin NOT NULL DEFAULT '{"uridium":0,"credits":0,"honor":0,"experience":0,"jackpot":0}',
  `bootyKeys` text COLLATE utf8_bin NOT NULL DEFAULT '{"greenKeys": 0, "redKeys": 0, "blueKeys": 0}',
  `info` text COLLATE utf8_bin NOT NULL,
  `destructions` text COLLATE utf8_bin NOT NULL DEFAULT '{"fpd":0,"dbrz":0}',
  `username` varchar(20) COLLATE utf8_bin NOT NULL,
  `pilotName` varchar(20) COLLATE utf8_bin NOT NULL,
  `petName` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'P.E.T 15',
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(260) COLLATE utf8_bin NOT NULL,
  `shipId` int(11) NOT NULL DEFAULT 10,
  `premium` tinyint(1) NOT NULL DEFAULT 0,
  `title` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `factionId` int(1) NOT NULL DEFAULT 0,
  `clanId` int(11) NOT NULL DEFAULT 0,
  `rankId` int(2) NOT NULL DEFAULT 1,
  `rankPoints` bigint(20) NOT NULL DEFAULT 0,
  `rank` int(11) NOT NULL DEFAULT 0,
  `warPoints` bigint(20) NOT NULL DEFAULT 0,
  `warRank` int(11) DEFAULT 0,
  `extraEnergy` int(11) NOT NULL DEFAULT 0,
  `nanohull` int(11) NOT NULL DEFAULT 0,
  `verification` text COLLATE utf8_bin NOT NULL,
  `oldPilotNames` text COLLATE utf8_bin NOT NULL DEFAULT '[]',
  `version` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `player_equipment`
--

CREATE TABLE `player_equipment` (
  `userId` int(11) NOT NULL,
  `config1_lasers` text COLLATE utf8_bin NOT NULL DEFAULT '[]',
  `config1_generators` text COLLATE utf8_bin NOT NULL DEFAULT '[]',
  `config1_drones` text COLLATE utf8_bin NOT NULL DEFAULT '[{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]}]',
  `config2_lasers` text COLLATE utf8_bin NOT NULL DEFAULT '[]',
  `config2_generators` text COLLATE utf8_bin NOT NULL DEFAULT '[]',
  `config2_drones` text COLLATE utf8_bin NOT NULL DEFAULT '[{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]},{"items":[],"designs":[]}]',
  `items` text COLLATE utf8_bin NOT NULL DEFAULT '{"lf4Count":0,"havocCount":0,"herculesCount":0,"apis":false,"zeus":false,"pet":false,"petModules":[],"ships":[],"designs":{},"skillTree":{"logdisks":0,"researchPoints":0,"resetCount":0}}',
  `skill_points` text COLLATE utf8_bin NOT NULL DEFAULT '{"engineering":0,"shieldEngineering":0,"detonation1":0,"detonation2":0,"heatseekingMissiles":0,"rocketFusion":0,"cruelty1":0,"cruelty2":0,"explosives":0,"luck1":0,"luck2":0}',
  `modules` longtext COLLATE utf8_bin NOT NULL DEFAULT '[]',
  `boosters` longtext COLLATE utf8_bin NOT NULL DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `player_galaxygates`
--

CREATE TABLE `player_galaxygates` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `gateId` int(11) NOT NULL,
  `parts` longtext COLLATE utf8_bin NOT NULL DEFAULT '[]',
  `multiplier` int(11) NOT NULL DEFAULT 0,
  `lives` int(11) NOT NULL DEFAULT -1,
  `prepared` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `player_settings`
--

CREATE TABLE `player_settings` (
  `userId` int(11) NOT NULL,
  `audio` text COLLATE utf8_bin NOT NULL DEFAULT '',
  `quality` text COLLATE utf8_bin NOT NULL DEFAULT '',
  `classY2T` text COLLATE utf8_bin NOT NULL DEFAULT '',
  `display` text COLLATE utf8_bin NOT NULL DEFAULT '',
  `gameplay` text COLLATE utf8_bin NOT NULL DEFAULT '',
  `window` text COLLATE utf8_bin NOT NULL DEFAULT '',
  `boundKeys` text COLLATE utf8_bin NOT NULL DEFAULT '',
  `inGameSettings` text COLLATE utf8_bin NOT NULL DEFAULT '',
  `cooldowns` text COLLATE utf8_bin NOT NULL DEFAULT '',
  `slotbarItems` text COLLATE utf8_bin NOT NULL DEFAULT '',
  `premiumSlotbarItems` text COLLATE utf8_bin NOT NULL DEFAULT '',
  `proActionBarItems` text COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `player_titles`
--

CREATE TABLE `player_titles` (
  `userID` int(11) NOT NULL,
  `titles` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `server_bans`
--

CREATE TABLE `server_bans` (
  `id` bigint(20) NOT NULL,
  `userId` int(11) NOT NULL,
  `modId` int(11) NOT NULL,
  `reason` text COLLATE utf8_bin NOT NULL,
  `typeId` tinyint(4) NOT NULL,
  `ended` tinyint(1) NOT NULL,
  `end_date` datetime NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `server_battlestations`
--

CREATE TABLE `server_battlestations` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_bin NOT NULL,
  `mapId` int(11) NOT NULL,
  `clanId` int(11) NOT NULL,
  `positionX` int(11) NOT NULL,
  `positionY` int(11) NOT NULL,
  `inBuildingState` tinyint(4) NOT NULL,
  `buildTimeInMinutes` int(11) NOT NULL,
  `buildTime` datetime NOT NULL,
  `deflectorActive` tinyint(4) NOT NULL,
  `deflectorSecondsLeft` int(11) NOT NULL,
  `deflectorTime` datetime NOT NULL,
  `visualModifiers` text COLLATE utf8_bin NOT NULL,
  `modules` longtext COLLATE utf8_bin NOT NULL,
  `active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `server_battlestations`
--

INSERT INTO `server_battlestations` (`id`, `name`, `mapId`, `clanId`, `positionX`, `positionY`, `inBuildingState`, `buildTimeInMinutes`, `buildTime`, `deflectorActive`, `deflectorSecondsLeft`, `deflectorTime`, `visualModifiers`, `modules`, `active`) VALUES
(1, 'Julius', 15, 0, 16400, 11400, 0, 0, '0000-00-00 00:00:00', 0, 0, '0001-01-01 00:00:00', '[]', '[]', 0);

-- --------------------------------------------------------

--
-- Table structure for table `server_clans`
--

CREATE TABLE `server_clans` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `tag` varchar(4) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `description` varchar(16000) COLLATE utf8_bin NOT NULL DEFAULT '',
  `factionId` tinyint(4) NOT NULL DEFAULT 0,
  `recruiting` tinyint(4) NOT NULL DEFAULT 1,
  `leaderId` int(11) NOT NULL DEFAULT 0,
  `news` text COLLATE utf8_bin NOT NULL DEFAULT '[]',
  `join_dates` text COLLATE utf8_bin NOT NULL DEFAULT '{}',
  `rankPoints` bigint(20) DEFAULT 0,
  `rank` int(11) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `profile` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `server_clan_applications`
--

CREATE TABLE `server_clan_applications` (
  `id` int(11) NOT NULL,
  `clanId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `text` varchar(255) COLLATE utf8_bin NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `server_clan_diplomacy`
--

CREATE TABLE `server_clan_diplomacy` (
  `id` bigint(20) NOT NULL,
  `senderClanId` int(11) NOT NULL,
  `toClanId` int(11) NOT NULL,
  `diplomacyType` tinyint(4) NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `server_clan_diplomacy_applications`
--

CREATE TABLE `server_clan_diplomacy_applications` (
  `id` bigint(20) NOT NULL,
  `senderClanId` int(11) NOT NULL,
  `toClanId` int(11) NOT NULL,
  `diplomacyType` tinyint(4) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `server_maps`
--

CREATE TABLE `server_maps` (
  `mapID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `npcs` longtext COLLATE utf8_bin NOT NULL,
  `stations` longtext COLLATE utf8_bin NOT NULL,
  `portals` longtext COLLATE utf8_bin NOT NULL,
  `collectables` longtext COLLATE utf8_bin NOT NULL,
  `options` varchar(512) COLLATE utf8_bin NOT NULL DEFAULT '{"StarterMap":false,"PvpMap":false,"RangeDisabled":false,"CloakBlocked":false,"LogoutBlocked":false,"DeathLocationRepair":true}',
  `factionID` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `server_maps`
--

INSERT INTO `server_maps` (`mapID`, `name`, `npcs`, `stations`, `portals`, `collectables`, `options`, `factionID`) VALUES
(1, '1-1', '[{   \"ShipId\": 23,   \"Amount\": 5},{   \"ShipId\": 84,   \"Amount\":8}]', '', '[{   \"TargetSpaceMapId\": 2,   \"Position\": [18500, 11500],   \"TargetPosition\": [2000,2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 1),
(2, '1-2', '[{   \"ShipId\": 23,   \"Amount\": 5},{   \"ShipId\": 84,   \"Amount\":8},{   \"ShipId\": 71,   \"Amount\":8}, {   \"ShipId\": 24,   \"Amount\":5}]', '', '[{   \"TargetSpaceMapId\": 1,   \"Position\": [2000, 2000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 3,   \"Position\": [18500, 2000],   \"TargetPosition\": [2000, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 4,   \"Position\": [18500, 11500],   \"TargetPosition\": [2000, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 1),
(3, '1-3', '[{   \"ShipId\": 25,   \"Amount\": 4},{   \"ShipId\": 75,   \"Amount\":6},{   \"ShipId\": 31,   \"Amount\":4}, {   \"ShipId\": 73,   \"Amount\":6},{   \"ShipId\": 72,   \"Amount\":6},{   \"ShipId\": 26,   \"Amount\":4}]', '', '[{   \"TargetSpaceMapId\": 2,   \"Position\": [2000, 11500],   \"TargetPosition\": [18500, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 4,   \"Position\": [18500, 11500],   \"TargetPosition\": [18500, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 7,   \"Position\": [18500, 2000],   \"TargetPosition\": [2000, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 1),
(4, '1-4', '[{   \"ShipId\": 25,   \"Amount\": 4},{   \"ShipId\": 75,   \"Amount\":6},{   \"ShipId\": 31,   \"Amount\":4}, {   \"ShipId\": 73,   \"Amount\":6},{   \"ShipId\": 74,   \"Amount\":6},{   \"ShipId\": 46,   \"Amount\":4}]', '', '[{   \"TargetSpaceMapId\": 2,   \"Position\": [2000, 2000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 3,   \"Position\": [18500, 2000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 13,   \"Position\": [19000, 6000],   \"TargetPosition\": [1500, 6600],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 12,   \"Position\": [18500, 11500],   \"TargetPosition\": [2000, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 1),
(5, '2-1', '[{   \"ShipId\": 23,   \"Amount\": 5},{   \"ShipId\": 84,   \"Amount\":8}]', '', '[{   \"TargetSpaceMapId\": 6,   \"Position\": [2000, 11500],   \"TargetPosition\": [18500, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 2),
(6, '2-2', '[{   \"ShipId\": 23,   \"Amount\": 5},{   \"ShipId\": 84,   \"Amount\":8},{   \"ShipId\": 71,   \"Amount\":8}, {   \"ShipId\": 24,   \"Amount\":5}]', '', '[{   \"TargetSpaceMapId\": 8,   \"Position\": [18500, 11500],   \"TargetPosition\": [2000, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 5,   \"Position\": [18500, 2000],   \"TargetPosition\": [2000, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 7,   \"Position\": [2000, 11500],   \"TargetPosition\": [18500, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 2),
(7, '2-3', '[{   \"ShipId\": 25,   \"Amount\": 4},{   \"ShipId\": 75,   \"Amount\":6},{   \"ShipId\": 31,   \"Amount\":4}, {   \"ShipId\": 73,   \"Amount\":6},{   \"ShipId\": 72,   \"Amount\":6},{   \"ShipId\": 26,   \"Amount\":4}]', '', '[{   \"TargetSpaceMapId\": 6,   \"Position\": [18500, 2000],   \"TargetPosition\": [2000, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 8,   \"Position\": [18500, 11500],   \"TargetPosition\": [18500, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 3,   \"Position\": [2000, 11500],   \"TargetPosition\": [18500, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 2),
(8, '2-4', '[{   \"ShipId\": 25,   \"Amount\": 4},{   \"ShipId\": 75,   \"Amount\":6},{   \"ShipId\": 31,   \"Amount\":4}, {   \"ShipId\": 73,   \"Amount\":6},{   \"ShipId\": 74,   \"Amount\":6},{   \"ShipId\": 46,   \"Amount\":4}]', '', '[{   \"TargetSpaceMapId\": 11,   \"Position\": [2000, 11500],   \"TargetPosition\": [2000, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 14,   \"Position\": [10000, 12000],   \"TargetPosition\": [10400, 1500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 7,   \"Position\": [18500, 2000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{  \"TargetSpaceMapId\": 6,   \"Position\": [2000, 2000],   \"TargetPosition\": [18500, 1500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 2),
(9, '3-1', '[{   \"ShipId\": 23,   \"Amount\": 5},{   \"ShipId\": 84,   \"Amount\":8}]', '', '[{   \"TargetSpaceMapId\": 10,   \"Position\": [2000, 2000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 3),
(10, '3-2', '[{   \"ShipId\": 23,   \"Amount\": 5},{   \"ShipId\": 84,   \"Amount\":8},{   \"ShipId\": 71,   \"Amount\":8}, {   \"ShipId\": 24,   \"Amount\":5}]', '', '[{   \"TargetSpaceMapId\": 12,   \"Position\": [2000, 2000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 11,   \"Position\": [18500, 2000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 9,   \"Position\": [18500, 11500],   \"TargetPosition\": [2000, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 3),
(11, '3-3', '[{   \"ShipId\": 25,   \"Amount\": 4},{   \"ShipId\": 75,   \"Amount\":6},{   \"ShipId\": 31,   \"Amount\":4}, {   \"ShipId\": 73,   \"Amount\":6},{   \"ShipId\": 72,   \"Amount\":6},{   \"ShipId\": 26,   \"Amount\":4}]', '', '[{   \"TargetSpaceMapId\": 10,   \"Position\": [18500, 11500],   \"TargetPosition\": [18500, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 12,   \"Position\": [2000, 11500],   \"TargetPosition\": [18500, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 8,   \"Position\": [2000, 2000],   \"TargetPosition\": [2000, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 3),
(12, '3-4', '[{   \"ShipId\": 25,   \"Amount\": 4},{   \"ShipId\": 75,   \"Amount\":6},{   \"ShipId\": 31,   \"Amount\":4}, {   \"ShipId\": 73,   \"Amount\":6},{   \"ShipId\": 74,   \"Amount\":6},{   \"ShipId\": 46,   \"Amount\":4}]', '', '[{   \"TargetSpaceMapId\": 4,   \"Position\": [2000, 2000],   \"TargetPosition\": [18500, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 15,   \"Position\": [10000, 1500],   \"TargetPosition\": [19000, 6600],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 11,   \"Position\": [18500, 2000],   \"TargetPosition\": [2000, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 10,   \"Position\": [18500, 11500],   \"TargetPosition\": [2000, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 3),
(13, '4-1', '', '', '[{   \"TargetSpaceMapId\": 16,   \"Position\": [10000, 6200],   \"TargetPosition\": [19200,13400],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 14,   \"Position\": [18900, 1900],   \"TargetPosition\": [2500,10900],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 15,   \"Position\": [18900, 11300],   \"TargetPosition\": [2000,11200],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{ \"TargetSpaceMapId\": 4,   \"Position\": [1500, 6600],   \"TargetPosition\": [19000, 6000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '[{   \"TypeId\": 2,   \"Amount\": 100,   \"TopLeft\": [18300,1100], \"BottomRight\": [18300,1100], \"Respawnable\":true }]', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(14, '4-2', '', '', '[{   \"TargetSpaceMapId\": 16,   \"Position\": [10400, 6300],   \"TargetPosition\": [21900,11900],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }, {   \"TargetSpaceMapId\": 13,   \"Position\": [2500, 10900],   \"TargetPosition\": [18900,1900],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }, {   \"TargetSpaceMapId\": 15,   \"Position\": [18900, 10900],   \"TargetPosition\": [2000,1900],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },{   \"TargetSpaceMapId\": 8,   \"Position\": [10400, 1500],   \"TargetPosition\": [10000, 12000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '[{   \"TypeId\": 2,   \"Amount\": 100,   \"TopLeft\": [18300,1100], \"BottomRight\": [18300,1100], \"Respawnable\":true }]', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(15, '4-3', '', '', '[{   \"TargetSpaceMapId\": 16,   \"Position\": [10300, 6600],   \"TargetPosition\": [21900,14500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },  {   \"TargetSpaceMapId\": 13,   \"Position\": [2000,11200],   \"TargetPosition\": [18900,11300],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },  {   \"TargetSpaceMapId\": 14,   \"Position\": [2000,1900],   \"TargetPosition\": [18700,10900],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }, {   \"TargetSpaceMapId\": 12,   \"Position\": [19000, 6600],   \"TargetPosition\": [10000, 1500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '[{   \"TypeId\": 2,   \"Amount\": 100,   \"TopLeft\": [18300,1100], \"BottomRight\": [18300,1100], \"Respawnable\":true }]', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(16, '4-4', '', '', '[{   \"TargetSpaceMapId\": 13,   \"Position\": [19200,13400],   \"TargetPosition\": [10000,6200],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },  {\"TargetSpaceMapId\": 14,   \"Position\": [21900,11900],   \"TargetPosition\": [10400,6300],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },  {   \"TargetSpaceMapId\": 15,   \"Position\": [21900,14500],   \"TargetPosition\": [10300,6600],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }, {\"TargetSpaceMapId\": 17,   \"Position\": [7000,13500],   \"TargetPosition\": [20000,6500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }, {\"TargetSpaceMapId\": 21,   \"Position\": [28000,1300],   \"TargetPosition\": [2000, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }, {\"TargetSpaceMapId\": 25,   \"Position\": [27900,24100],   \"TargetPosition\": [1700,1700],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":true,\"RangeDisabled\":true,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(17, '1-5', '[{   \"ShipId\": 77,   \"Amount\": 8},{   \"ShipId\": 71,   \"Amount\":8},{   \"ShipId\": 28,   \"Amount\":5}, {   \"ShipId\": 76,   \"Amount\":8},{   \"ShipId\": 27,   \"Amount\":5}]', '', '[{  \"TargetSpaceMapId\": 16,   \"Position\": [20000,6500],   \"TargetPosition\": [7000,13500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }, {\"TargetSpaceMapId\": 18,   \"Position\": [1600,1700],   \"TargetPosition\": [19300,11200],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },  {\"TargetSpaceMapId\": 19,   \"Position\": [1600,11500],   \"TargetPosition\": [18500, 1700],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 1),
(18, '1-6', '[{   \"ShipId\": 79,   \"Amount\": 8},{   \"ShipId\": 78,   \"Amount\":8},{   \"ShipId\": 35,   \"Amount\":5},{   \"ShipId\": 29,   \"Amount\":5}, {\"ShipId\":80, \"Amount\": 4}]', '', '[{   \"TargetSpaceMapId\": 17,   \"Position\": [19300,11200],   \"TargetPosition\": [1600,1700],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },  {\"TargetSpaceMapId\": 20,   \"Position\": [2000, 11500],   \"TargetPosition\": [18700, 2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 1),
(19, '1-7', '[{   \"ShipId\": 79,   \"Amount\": 8},{   \"ShipId\": 78,   \"Amount\":8},{   \"ShipId\": 35,   \"Amount\":5},{   \"ShipId\": 29,   \"Amount\":5}]', '', '[{  \"TargetSpaceMapId\": 17,   \"Position\": [18500, 1700],   \"TargetPosition\": [1600,11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }, {\"TargetSpaceMapId\": 20,   \"Position\": [1700,1700],   \"TargetPosition\": [18700,11200],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 1),
(20, '1-8', '[{   \"ShipId\": 85,   \"Amount\":8}, {\"ShipId\": 34,   \"Amount\":5}]', '[{   \"TypeId\": 46,   \"FactionId\": 1,   \"Position\": [1900,6500] }]', '[{   \"TargetSpaceMapId\": 18,   \"Position\": [18700, 2000],   \"TargetPosition\": [2000, 11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },  {\"TargetSpaceMapId\": 19,   \"Position\": [18700,11200],   \"TargetPosition\": [1700,1700],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 1),
(21, '2-5', '[{   \"ShipId\": 77,   \"Amount\": 8},{   \"ShipId\": 71,   \"Amount\":8},{   \"ShipId\": 28,   \"Amount\":5}, {   \"ShipId\": 76,   \"Amount\":8},{   \"ShipId\": 27,   \"Amount\":5}]', '', '[{   \"TargetSpaceMapId\": 22,   \"Position\": [2000, 2000],   \"TargetPosition\": [2000,11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },  {   \"TargetSpaceMapId\": 23,   \"Position\": [18500,2000],   \"TargetPosition\": [2000,11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }, { \"TargetSpaceMapId\": 16,   \"Position\": [2000, 11500],   \"TargetPosition\": [28000,1300],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 2),
(22, '2-6', '[{   \"ShipId\": 79,   \"Amount\": 8},{   \"ShipId\": 78,   \"Amount\":8},{   \"ShipId\": 35,   \"Amount\":5},{   \"ShipId\": 29,   \"Amount\":5}, {\"ShipId\":80, \"Amount\": 4}]', '', '[{   \"TargetSpaceMapId\": 21,   \"Position\": [2000, 11500],   \"TargetPosition\": [2000,2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },  {   \"TargetSpaceMapId\": 24,   \"Position\": [18500,2000],   \"TargetPosition\": [2000,11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 2),
(23, '2-7', '[{   \"ShipId\": 79,   \"Amount\": 8},{   \"ShipId\": 78,   \"Amount\":8},{   \"ShipId\": 35,   \"Amount\":5},{   \"ShipId\": 29,   \"Amount\":5}]', '', '[{  \"TargetSpaceMapId\": 21,   \"Position\": [2000, 11500],   \"TargetPosition\": [18500,2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }, {\"TargetSpaceMapId\": 24,   \"Position\": [18500, 2000],   \"TargetPosition\": [18500,11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 2),
(24, '2-8', '[{   \"ShipId\": 85,   \"Amount\":8}, {\"ShipId\": 34,   \"Amount\":5}]', '[{   \"TypeId\": 46,   \"FactionId\": 2,   \"Position\": [10200,1800] }]', '[{  \"TargetSpaceMapId\": 22,   \"Position\": [2000,11500],   \"TargetPosition\": [18500,2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }, {\"TargetSpaceMapId\": 23,   \"Position\": [18500,11500],   \"TargetPosition\": [18500,2000],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 2),
(25, '3-5', '[{   \"ShipId\": 77,   \"Amount\": 8},{   \"ShipId\": 71,   \"Amount\":8},{   \"ShipId\": 28,   \"Amount\":5}, {   \"ShipId\": 76,   \"Amount\":8},{   \"ShipId\": 27,   \"Amount\":5}]', '', '[{   \"TargetSpaceMapId\": 16,   \"Position\": [1700,1700],   \"TargetPosition\": [27900,24100],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }, {\"TargetSpaceMapId\": 26,   \"Position\": [1700,11500],   \"TargetPosition\": [1700,1700],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },  {\"TargetSpaceMapId\": 27,   \"Position\": [19100,11500],   \"TargetPosition\": [1500,11300],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 3),
(26, '3-6', '[{   \"ShipId\": 79,   \"Amount\": 8},{   \"ShipId\": 78,   \"Amount\":8},{   \"ShipId\": 35,   \"Amount\":5},{   \"ShipId\": 29,   \"Amount\":5}, {\"ShipId\":80, \"Amount\": 4}]', '', '[{   \"TargetSpaceMapId\": 25,   \"Position\": [1700,1700],   \"TargetPosition\": [1700,11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },  {\"TargetSpaceMapId\": 28,   \"Position\": [18700,11200],   \"TargetPosition\": [1800,11300],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 3),
(27, '3-7', '[{   \"ShipId\": 79,   \"Amount\": 8},{   \"ShipId\": 78,   \"Amount\":8},{   \"ShipId\": 35,   \"Amount\":5},{   \"ShipId\": 29,   \"Amount\":5}]', '', '[{   \"TargetSpaceMapId\": 25,   \"Position\": [1500,11300],   \"TargetPosition\": [19100,11500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }, {\"TargetSpaceMapId\": 28,   \"Position\": [19300,11300],   \"TargetPosition\": [1800,1500],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 3),
(28, '3-8', '[{   \"ShipId\": 85,   \"Amount\":8}, {\"ShipId\": 34,   \"Amount\":5}]', '[{   \"TypeId\": 46,   \"FactionId\": 3,   \"Position\": [19100,6600] }]', '[{   \"TargetSpaceMapId\": 27,   \"Position\": [1800,1500],   \"TargetPosition\": [19300,11300],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true },  {   \"TargetSpaceMapId\": 26,   \"Position\": [1800,11300],   \"TargetPosition\": [18700,11200],   \"GraphicId\": 1,   \"FactionId\": 1,   \"Visible\": true,   \"Working\": true }]', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 3),
(42, '???', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":true,\"CloakBlocked\":true,\"LogoutBlocked\":true,\"DeathLocationRepair\":false}', 0),
(71, 'GG Zeta', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(74, 'GG Kappa', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(101, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":true,\"CloakBlocked\":true,\"LogoutBlocked\":true,\"DeathLocationRepair\":false}', 0),
(102, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(103, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(104, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(105, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(106, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(107, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(108, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(109, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(110, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(111, 'JP', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(121, 'TA', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":true,\"CloakBlocked\":true,\"LogoutBlocked\":true,\"DeathLocationRepair\":false}', 0),
(200, 'LoW', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0),
(224, 'Custom Tournament', '', '', '', '', '{\"StarterMap\":false,\"PvpMap\":false,\"RangeDisabled\":false,\"CloakBlocked\":false,\"LogoutBlocked\":false,\"DeathLocationRepair\":true}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `server_ships`
--

CREATE TABLE `server_ships` (
  `id` int(11) NOT NULL,
  `shipID` int(11) NOT NULL,
  `baseShipId` int(11) NOT NULL,
  `lootID` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `health` int(11) NOT NULL DEFAULT 0,
  `shield` int(11) NOT NULL DEFAULT 0,
  `speed` int(11) NOT NULL DEFAULT 300,
  `lasers` int(11) NOT NULL DEFAULT 1,
  `generators` int(11) NOT NULL DEFAULT 1,
  `cargo` int(11) NOT NULL DEFAULT 100,
  `aggressive` tinyint(1) NOT NULL DEFAULT 0,
  `damage` int(11) NOT NULL DEFAULT 20,
  `respawnable` tinyint(1) NOT NULL,
  `reward` varchar(2048) COLLATE utf8_bin NOT NULL DEFAULT '{"Experience":0,"Honor":0,"Credits":0,"Uridium":0}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `server_ships`
--

INSERT INTO `server_ships` (`id`, `shipID`, `baseShipId`, `lootID`, `name`, `health`, `shield`, `speed`, `lasers`, `generators`, `cargo`, `aggressive`, `damage`, `respawnable`, `reward`) VALUES
(18, 1, 0, 'ship_phoenix', 'Phoenix', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}'),
(19, 2, 0, 'ship_yamato', 'Yamato', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}'),
(20, 3, 0, 'ship_leonov', 'Leonov', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}'),
(21, 4, 0, 'ship_defcom', 'Defcom', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}'),
(22, 5, 0, 'ship_liberator', 'Liberator', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}'),
(23, 6, 0, 'ship_piranha', 'Piranha', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}'),
(24, 7, 0, 'ship_nostromo', 'Nostromo', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}'),
(25, 8, 8, 'ship_vengeance', 'Vengeance', 180000, 0, 380, 10, 10, 0, 0, 0, 0, ''),
(26, 9, 0, 'ship_bigboy', 'Bigboy', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}'),
(27, 10, 10, 'ship_goliath', 'Goliath', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(28, 12, 0, 'pet', 'P.E.T. Level 1-3', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":25000,\"Honor\":150,\"Credits\":0,\"Uridium\":0}'),
(29, 13, 0, 'pet', 'P.E.T. Red', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":25000,\"Honor\":150,\"Credits\":0,\"Uridium\":0}'),
(30, 15, 0, 'pet', 'P.E.T. Frozen', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":25000,\"Honor\":150,\"Credits\":0,\"Uridium\":0}'),
(31, 16, 8, 'ship_vengeance_design_adept', 'Adept', 180000, 0, 380, 10, 10, 0, 0, 0, 0, '{\"Experience\":25600,\"Honor\":256,\"Credits\":0,\"Uridium\":256}'),
(32, 17, 8, 'ship_vengeance_design_corsair', 'Corsair', 180000, 0, 380, 10, 10, 0, 0, 0, 0, '{\"Experience\":25600,\"Honor\":256,\"Credits\":0,\"Uridium\":256}'),
(33, 18, 8, 'ship_vengeance_design_lightning', 'Lightning', 180000, 0, 380, 10, 10, 0, 0, 0, 0, '{\"Experience\":25600,\"Honor\":256,\"Credits\":0,\"Uridium\":256}'),
(34, 19, 10, 'ship_goliath_design_jade', 'Jade', 256000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(35, 20, 0, 'ship_admin', 'Ufo', 1, 1, 1, 1, 1, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}'),
(36, 22, 0, 'pet', 'P.E.T. Normal', 0, 50000, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":25000,\"Honor\":150,\"Credits\":0,\"Uridium\":0}'),
(37, 49, 49, 'ship_aegis', 'Aegis', 275000, 0, 300, 10, 15, 0, 0, 0, 0, '{\"Experience\":25000,\"Honor\":250,\"Credits\":0,\"Uridium\":250}'),
(38, 52, 10, 'ship_goliath_design_amber', 'Amber', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(39, 53, 10, 'ship_goliath_design_crimson', 'Crimson', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(40, 54, 10, 'ship_goliath_design_sapphire', 'Sapphire', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(41, 56, 10, 'ship_goliath_design_enforcer', 'Enforcer', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(42, 57, 10, 'ship_goliath_design_independence', 'Independence', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(43, 58, 8, 'ship_vengeance_design_revenge', 'Revenge', 180000, 0, 380, 10, 10, 0, 0, 0, 0, '{\"Experience\":25600,\"Honor\":256,\"Credits\":0,\"Uridium\":256}'),
(44, 59, 10, 'ship_goliath_design_bastion', 'Bastion', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(45, 60, 8, 'ship_vengeance_design_avenger', 'Avenger', 180000, 0, 380, 10, 10, 0, 0, 0, 0, '{\"Experience\":25600,\"Honor\":256,\"Credits\":0,\"Uridium\":256}'),
(46, 14, 0, 'pet', 'P.E.T. Green', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":25000,\"Honor\":150,\"Credits\":0,\"Uridium\":0}'),
(47, 62, 10, 'ship_goliath_design_exalted', 'Exalted', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(48, 63, 10, 'ship_goliath_design_solace', 'Solace', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(49, 64, 10, 'ship_goliath_design_diminisher', 'Diminisher', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(50, 65, 10, 'ship_goliath_design_spectrum', 'Spectrum', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(51, 66, 10, 'ship_goliath_design_sentinel', 'Sentinel', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(52, 67, 10, 'ship_goliath_design_venom', 'Venom', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(53, 68, 10, 'ship_goliath_design_ignite', 'Ignite', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(54, 69, 69, 'ship_citadel', 'Citadel', 550000, 0, 240, 7, 20, 0, 0, 0, 0, '{\"Experience\":120000,\"Honor\":1200,\"Credits\":0,\"Uridium\":1200}'),
(55, 70, 70, 'ship_spearhead', 'Spearhead', 100000, 0, 370, 5, 12, 0, 0, 0, 0, '{\"Experience\":7500,\"Honor\":75,\"Credits\":0,\"Uridium\":75}'),
(56, 81, 0, 'ship81', '..::{ Protegit }::..', 60000, 60000, 450, 0, 0, 0, 1, 1500, 1, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(57, 86, 10, 'ship_goliath_design_kick', 'Kick', 256000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(58, 87, 10, 'ship_goliath_design_referee', 'Referee', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(59, 88, 10, 'ship_goliath_design_goal', 'Goal', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(60, 98, 98, 'ship_police', 'PoliceShip', 999999999, 0, 3000, 50, 50, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}'),
(61, 109, 10, 'ship_goliath_design_saturn', 'Saturn', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(62, 110, 10, 'ship_goliath_design_centaur', 'Centaur', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(63, 61, 10, 'ship_goliath_design_veteran', 'Veteran', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(64, 140, 10, 'ship_goliath_design_vanquisher', 'Vanquisher', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(65, 141, 10, 'ship_goliath_design_sovereign', 'Sovereign', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(66, 142, 10, 'ship_goliath_design_peacemaker', 'Peacemaker', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(67, 150, 0, 'ship_nostromo_design_diplomat', 'Nostromo Diplomat', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}'),
(68, 151, 0, 'ship_nostromo_design_envoy', 'Nostromo Envoy', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}'),
(69, 152, 0, 'ship_nostromo_design_ambassador', 'Nostromo Ambassador', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}'),
(70, 153, 10, 'ship_goliath_design_goliath-razer', 'Razer', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(71, 154, 0, 'ship_nostromo_design_nostromo-razer', 'Nostromo Razer', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}'),
(72, 155, 10, 'ship_goliath_design_turkish', 'Hezarfen', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(73, 156, 156, 'ship_g-surgeon', 'Surgeon', 500000, 0, 300, 15, 16, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(74, 157, 49, 'ship_aegis_design_aegis-elite', 'Aegis Veteran', 275000, 0, 300, 10, 15, 0, 0, 0, 0, '{\"Experience\":25000,\"Honor\":250,\"Credits\":0,\"Uridium\":250}'),
(75, 158, 49, 'ship_aegis_design_aegis-superelite', 'Aegis Super Elite', 275000, 0, 300, 10, 15, 0, 0, 0, 0, '{\"Experience\":25000,\"Honor\":250,\"Credits\":0,\"Uridium\":250}'),
(76, 159, 69, 'ship_citadel_design_citadel-elite', 'Citadel Veteran', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}'),
(77, 160, 69, 'ship_citadel_design_citadel-superelite', 'Citadel Super Elite', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}'),
(78, 161, 70, 'ship_aegis_design_aegis-elite', 'Spearhead Veteran', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}'),
(79, 162, 70, 'ship_aegis_design_aegis-superelite', 'Spearhead Super Elite', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}'),
(80, 442, 0, 'spaceball_summer', '..::{Spaceball}::..', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}'),
(81, 443, 0, 'spaceball_winter', '..::{Spaceball}::..', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}'),
(82, 444, 0, 'spaceball_soccer', '..::{Spaceball}::..', 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"Experience\":0,\"Honor\":0,\"Credits\":0,\"Uridium\":0}'),
(83, 79, 0, 'ship79', '-=[ Kristallon ]=-', 400000, 300000, 250, 1, 1, 100, 0, 5000, 1, '{\"Experience\":614400,\"Honor\":3072,\"Credits\":4915200,\"Uridium\":1536}'),
(84, 78, 0, 'ship78', '-=[ Kristallin ]=-', 50000, 40000, 320, 1, 1, 100, 1, 1200, 1, '{\"Experience\":76800,\"Honor\":384,\"Credits\":153600,\"Uridium\":192}'),
(85, 35, 0, 'ship35', '..::{ Boss Kristallon }::..', 1600000, 1200000, 250, 1, 1, 100, 0, 20000, 1, '{\"Experience\":2457600,\"Honor\":12888,\"Credits\":19660800,\"Uridium\":6144}'),
(86, 29, 0, 'ship29', '..::{ Boss Kristallin }::..', 200000, 160000, 340, 1, 1, 100, 1, 4800, 1, '{\"Experience\":307200,\"Honor\":1536,\"Credits\":614400,\"Uridium\":768}'),
(87, 80, 0, 'ship80', '..::{ Cubikon }::..', 1600000, 1200000, 30, 1, 1, 100, 0, 0, 1, '{\"Experience\":6144000,\"Honor\":49152,\"Credits\":19660800,\"Uridium\":12888}'),
(88, 77, 0, 'ship77', '..::{ Lordakium }::..', 300000, 200000, 230, 1, 1, 100, 0, 4000, 1, '{\"Experience\":307200,\"Honor\":1536,\"Credits\":2457600,\"Uridium\":768}'),
(89, 71, 0, 'ship71', '..::{ Lordakia }::..', 2000, 2000, 320, 1, 1, 100, 1, 80, 1, '{\"Experience\":9600,\"Honor\":48,\"Credits\":9600,\"Uridium\":24}'),
(90, 91, 0, 'ship81', '..::{ Protegit }::..', 60000, 50000, 500, 1, 1, 100, 1, 1500, 1, '{\"Experience\":76800,\"Honor\":384,\"Credits\":153600,\"Uridium\":192}'),
(91, 28, 0, 'ship28', '..::{ Boss Lordakium }::..', 1200000, 800000, 200, 1, 1, 100, 0, 16000, 1, '{\"Experience\":1228800,\"Honor\":6144,\"Credits\":9830400,\"Uridium\":3072}'),
(92, 85, 0, 'ship85', '..::{ StreuneR }::..', 20000, 10000, 280, 1, 1, 100, 1, 500, 1, '{\"Experience\":38400,\"Honor\":192,\"Credits\":76800,\"Uridium\":180}'),
(93, 34, 0, 'ship34', '..::{ Boss StreuneR }::..', 80000, 40000, 200, 1, 1, 100, 1, 1400, 1, '{\"Experience\":154320,\"Honor\":768,\"Credits\":307200,\"Uridium\":384}'),
(94, 76, 0, 'ship76', '..::{ Sibelonit }::..', 40000, 40000, 320, 1, 1, 100, 1, 1000, 1, '{\"Experience\":38400,\"Honor\":192,\"Credits\":153600,\"Uridium\":144}'),
(95, 27, 0, 'ship27', '..::{ Boss Sibelonit }::..', 160000, 160000, 300, 1, 1, 100, 1, 4350, 1, '{\"Experience\":153600,\"Honor\":768,\"Credits\":1228800,\"Uridium\":576}'),
(96, 200, 10, 'ship_g-champion_design_g-champion_albania', 'G-Champion-Albania', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(97, 201, 10, 'ship_g-champion_design_g-champion_austria', 'G-Champion-Austria', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(98, 202, 10, 'ship_g-champion_design_g-champion_belgium', 'G-Champion-Belgium', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(99, 203, 10, 'ship_g-champion_design_g-champion_croatia', 'G-Champion-Croatia', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(100, 204, 10, 'ship_g-champion_design_g-champion_czech_republic', 'G-Champion-Czech-Republic', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(101, 205, 10, 'ship_g-champion_design_g-champion_england', 'G-Champion-England', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(102, 206, 10, 'ship_g-champion_design_g-champion_france', 'G-Champion-France', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(103, 207, 10, 'ship_g-champion_design_g-champion_hungary', 'G-Champion-Hungary', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(104, 208, 10, 'ship_g-champion_design_g-champion_iceland', 'G-Champion-Iceland', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(105, 209, 10, 'ship_g-champion_design_g-champion_italy', 'G-Champion-Italy', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(106, 210, 10, 'ship_g-champion_design_g-champion_poland', 'G-Champion-Poland', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(107, 211, 10, 'ship_g-champion_design_g-champion_portugal', 'G-Champion-Portugal', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(108, 212, 10, 'ship_g-champion_design_g-champion_republic_of_ireland', 'G-Champion-Republic-Of-Ireland', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(109, 213, 10, 'ship_g-champion_design_g-champion_romania', 'G-Champion-Romania', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(110, 214, 10, 'ship_g-champion_design_g-champion_russia', 'G-Champion-Russia', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(111, 215, 0, 'ship_g-champion_design_g-champion_slovakia', 'G-Champion-Slovakia', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(112, 216, 10, 'ship_g-champion_design_g-champion_spain', 'G-Champion-Spain', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(113, 217, 10, 'ship_g-champion_design_g-champion_sweden', 'G-Champion-Sweden', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(114, 218, 10, 'ship_g-champion_design_g-champion_switzerland', 'G-Champion-Switzerland', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(115, 219, 10, 'ship_g-champion_design_g-champion_ukraine', 'G-Champion-Ukraine', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(116, 220, 10, 'ship_g-champion_design_g-champion_wales', 'G-Champion-Wales', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(117, 72, 0, 'ship72', '..::{ Devolarium }::..', 100000, 100000, 200, 1, 1, 100, 1, 1500, 1, '{\"Experience\":76800,\"Honor\":384,\"Credits\":614400,\"Uridium\":192}'),
(118, 84, 0, 'ship84', '..::{ Streuner }::..', 800, 400, 280, 1, 1, 100, 1, 80, 1, '{\"Experience\":4800,\"Honor\":24,\"Credits\":4800,\"Uridium\":12}'),
(119, 75, 0, 'ship75', '..::{ Saimon }::..', 6000, 3000, 320, 1, 1, 100, 1, 200, 1, '{\"Experience\":20000,\"Honor\":96,\"Credits\":19200,\"Uridium\":48}'),
(120, 73, 0, 'ship73', '..::{ Mordon }::..', 20000, 10000, 125, 1, 1, 100, 1, 600, 1, '{\"Experience\":38400,\"Honor\":192,\"Credits\":76800,\"Uridium\":100}'),
(121, 74, 0, 'ship74', '..::{ Sibelon }::..', 200000, 200000, 100, 1, 1, 100, 1, 3000, 1, '{\"Experience\":153600,\"Honor\":768,\"Credits\":1228800,\"Uridium\":400}'),
(122, 23, 0, 'ship23', '..::{ Boss Streuner }::..', 3200, 1600, 250, 1, 1, 100, 1, 120, 1, '{\"Experience\":20000,\"Honor\":96,\"Credits\":19200,\"Uridium\":40}'),
(123, 25, 0, 'ship25', '..::{ Boss Saimon }::..', 24000, 12000, 300, 1, 1, 100, 1, 800, 1, '{\"Experience\":76800,\"Honor\":384,\"Credits\":76800,\"Uridium\":200}'),
(124, 31, 0, 'ship31', '..::{ Boss Mordon }::..', 80000, 40000, 150, 1, 1, 100, 1, 1560, 1, '{\"Experience\":153600,\"Honor\":768,\"Credits\":307200,\"Uridium\":350}'),
(125, 46, 0, 'ship46', '..::{ Boss Sibelon }::..', 800000, 800000, 175, 1, 1, 100, 1, 12000, 1, '{\"Experience\":614400,\"Honor\":3072,\"Credits\":4915200,\"Uridium\":1500}'),
(126, 24, 0, 'ship24', '..::{ Boss Lordakia }::..', 8000, 8000, 320, 1, 1, 100, 1, 363, 1, '{\"Experience\":38400,\"Honor\":192,\"Credits\":38400,\"Uridium\":96}'),
(127, 26, 0, 'ship26', '..::{ Boss Devolarium }::..', 400000, 400000, 225, 1, 1, 100, 1, 4650, 1, '{\"Experience\":307200,\"Honor\":1536,\"Credits\":2457600,\"Uridium\":800}'),
(128, 221, 10, 'ship_spectrum_design_spectrum-legend', 'Spectrum-Legend', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(129, 222, 10, 'ship_spectrum_design_spectrum-tyrannos', 'Spectrum-Tyrannos', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(130, 223, 10, 'ship_spectrum_design_spectrum-blaze', 'Spectrum-Blaze', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(131, 224, 10, 'ship_spectrum_design_spectrum-dusklight', 'Spectrum-Dusklight', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(132, 225, 10, 'ship_spectrum_design_spectrum-frost', 'Spectrum-Frost', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(133, 226, 10, 'ship_spectrum_design_spectrum-lava', 'Spectrum-Lava', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(134, 227, 10, 'ship_spectrum_design_spectrum-ocean', 'Spectrum-Ocean', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(135, 228, 10, 'ship_spectrum_design_spectrum-poison', 'Spectrum-Poison', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(136, 229, 10, 'ship_spectrum_design_spectrum-sandstorm', 'Spectrum-Sandstorm', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(137, 230, 10, 'ship_spectrum_design_spectrum-inferno', 'Spectrum-Inferno', 500000, 0, 300, 15, 15, 0, 0, 0, 0, '{\"Experience\":51200,\"Honor\":512,\"Credits\":0,\"Uridium\":512}'),
(138, 231, 231, 'ship_zephyr', 'Zephyr', 500000, 0, 300, 17, 20, 0, 0, 0, 0, '{\"Experience\":71200,\"Honor\":712,\"Credits\":0,\"Uridium\":712}'),
(139, 232, 8, 'ship_pusat_blaze', 'Pusat-Blaze', 186000, 0, 300, 14, 16, 0, 0, 0, 0, '{\"Experience\":25600,\"Honor\":256,\"Credits\":0,\"Uridium\":256}'),
(140, 233, 8, 'ship_pusat_design_pusat-inferno', 'Pusat-Inferno', 186000, 0, 300, 14, 16, 0, 0, 0, 0, '{\"Experience\":25600,\"Honor\":256,\"Credits\":0,\"Uridium\":256}'),
(141, 234, 8, 'ship_pusat_lava', 'Pusat-Lava', 186000, 0, 300, 14, 16, 0, 0, 0, 0, '{\"Experience\":25600,\"Honor\":256,\"Credits\":0,\"Uridium\":256}'),
(142, 235, 8, 'ship_pusat_legend', 'Pusat-Legend', 186000, 0, 300, 14, 16, 0, 0, 0, 0, '{\"Experience\":25600,\"Honor\":256,\"Credits\":0,\"Uridium\":256}'),
(143, 236, 8, 'ship_pusat_ocean', 'Pusat-Ocean', 186000, 0, 300, 14, 16, 0, 0, 0, 0, '{\"Experience\":25600,\"Honor\":256,\"Credits\":0,\"Uridium\":256}'),
(144, 237, 8, 'ship_pusat_poison', 'Pusat-Poison', 186000, 0, 300, 14, 16, 0, 0, 0, 0, '{\"Experience\":25600,\"Honor\":256,\"Credits\":0,\"Uridium\":256}'),
(145, 238, 8, 'ship_pusat_sandstorm', 'Pusat-Sandstorm', 186000, 0, 300, 14, 16, 0, 0, 0, 0, '{\"Experience\":25600,\"Honor\":256,\"Credits\":0,\"Uridium\":256}'),
(146, 239, 8, 'ship_pusat_violet', 'Pusat-Violet', 186000, 0, 300, 14, 16, 0, 0, 0, 0, '{\"Experience\":25600,\"Honor\":256,\"Credits\":0,\"Uridium\":256}'),
(147, 240, 8, 'ship_vengeance_design_pusat', 'Pusat', 186000, 0, 300, 14, 16, 0, 0, 0, 0, '{\"Experience\":25600,\"Honor\":256,\"Credits\":0,\"Uridium\":256}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat_permissions`
--
ALTER TABLE `chat_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_event_jpb`
--
ALTER TABLE `log_event_jpb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_player_kills`
--
ALTER TABLE `log_player_kills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `player_accounts`
--
ALTER TABLE `player_accounts`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `player_equipment`
--
ALTER TABLE `player_equipment`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `player_galaxygates`
--
ALTER TABLE `player_galaxygates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `player_settings`
--
ALTER TABLE `player_settings`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `player_titles`
--
ALTER TABLE `player_titles`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `server_bans`
--
ALTER TABLE `server_bans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `server_battlestations`
--
ALTER TABLE `server_battlestations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `server_clans`
--
ALTER TABLE `server_clans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `server_clan_applications`
--
ALTER TABLE `server_clan_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `server_clan_diplomacy`
--
ALTER TABLE `server_clan_diplomacy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `server_clan_diplomacy_applications`
--
ALTER TABLE `server_clan_diplomacy_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `server_maps`
--
ALTER TABLE `server_maps`
  ADD PRIMARY KEY (`mapID`);

--
-- Indexes for table `server_ships`
--
ALTER TABLE `server_ships`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shipID` (`shipID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_permissions`
--
ALTER TABLE `chat_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `log_event_jpb`
--
ALTER TABLE `log_event_jpb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_player_kills`
--
ALTER TABLE `log_player_kills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_accounts`
--
ALTER TABLE `player_accounts`
  MODIFY `userId` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_equipment`
--
ALTER TABLE `player_equipment`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_galaxygates`
--
ALTER TABLE `player_galaxygates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_settings`
--
ALTER TABLE `player_settings`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_titles`
--
ALTER TABLE `player_titles`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `server_bans`
--
ALTER TABLE `server_bans`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `server_battlestations`
--
ALTER TABLE `server_battlestations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `server_clans`
--
ALTER TABLE `server_clans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `server_clan_applications`
--
ALTER TABLE `server_clan_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `server_clan_diplomacy`
--
ALTER TABLE `server_clan_diplomacy`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `server_clan_diplomacy_applications`
--
ALTER TABLE `server_clan_diplomacy_applications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `server_maps`
--
ALTER TABLE `server_maps`
  MODIFY `mapID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT for table `server_ships`
--
ALTER TABLE `server_ships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
