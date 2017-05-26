-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 26, 2017 at 07:28 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `remotedb_fb`
--

-- --------------------------------------------------------

--
-- Table structure for table `driver_logbook_answer`
--

CREATE TABLE `driver_logbook_answer` (
  `id` int(11) NOT NULL,
  `vehicle_driver_logbook_map_id` int(11) NOT NULL DEFAULT '0',
  `app_version` int(11) NOT NULL DEFAULT '0',
  `imei` varchar(50) NOT NULL DEFAULT '0',
  `creation_time` datetime NOT NULL,
  `personnel_id` smallint(6) NOT NULL,
  `import_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `driver_logbook_checkbox_answer`
--

CREATE TABLE `driver_logbook_checkbox_answer` (
  `id` int(11) NOT NULL,
  `logbook_answer` int(11) NOT NULL DEFAULT '0',
  `checkbox_template` int(11) NOT NULL DEFAULT '0',
  `answer` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `driver_logbook_checkbox_template`
--

CREATE TABLE `driver_logbook_checkbox_template` (
  `id` int(11) NOT NULL,
  `headline_id` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `question` text NOT NULL,
  `answer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `driver_logbook_dropdown_answer`
--

CREATE TABLE `driver_logbook_dropdown_answer` (
  `id` int(11) NOT NULL,
  `logbook_answer` int(11) NOT NULL DEFAULT '0',
  `dropdown_template` int(11) NOT NULL DEFAULT '0',
  `answer` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `driver_logbook_dropdown_template`
--

CREATE TABLE `driver_logbook_dropdown_template` (
  `id` int(11) NOT NULL,
  `headline_id` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `question` text NOT NULL,
  `answer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `driver_logbook_extra_damage_answer`
--

CREATE TABLE `driver_logbook_extra_damage_answer` (
  `id` int(11) NOT NULL,
  `logbook_answer` int(11) DEFAULT NULL,
  `x_pos` float DEFAULT NULL,
  `y_pos` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `driver_logbook_headline_template`
--

CREATE TABLE `driver_logbook_headline_template` (
  `id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL DEFAULT '0',
  `name` text NOT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `creation_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `driver_logbook_radiobutton_answer`
--

CREATE TABLE `driver_logbook_radiobutton_answer` (
  `id` int(11) NOT NULL,
  `logbook_answer` int(11) NOT NULL DEFAULT '0',
  `radiobutton_template` int(11) NOT NULL DEFAULT '0',
  `answer` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `driver_logbook_radiobutton_template`
--

CREATE TABLE `driver_logbook_radiobutton_template` (
  `id` int(11) NOT NULL,
  `headline_id` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `question` text,
  `answer` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `driver_logbook_template`
--

CREATE TABLE `driver_logbook_template` (
  `id` int(11) NOT NULL,
  `xml` longtext NOT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `personnel_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `driver_logbook_textbox_date_answer`
--

CREATE TABLE `driver_logbook_textbox_date_answer` (
  `id` int(11) NOT NULL,
  `logbook_answer` int(11) DEFAULT NULL,
  `textbox_template` int(11) DEFAULT NULL,
  `answer` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `driver_logbook_textbox_float_answer`
--

CREATE TABLE `driver_logbook_textbox_float_answer` (
  `id` int(11) NOT NULL,
  `logbook_answer` int(11) NOT NULL DEFAULT '0',
  `textbox_template` int(11) NOT NULL DEFAULT '0',
  `answer` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `driver_logbook_textbox_int_answer`
--

CREATE TABLE `driver_logbook_textbox_int_answer` (
  `id` int(11) NOT NULL,
  `logbook_answer` int(11) DEFAULT NULL,
  `textbox_template` int(11) DEFAULT NULL,
  `answer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `driver_logbook_textbox_template`
--

CREATE TABLE `driver_logbook_textbox_template` (
  `id` int(11) NOT NULL,
  `headline_id` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `question` text,
  `input_type` text,
  `min_value` int(11) DEFAULT NULL,
  `max_value` int(11) DEFAULT NULL,
  `decimals` int(11) DEFAULT NULL,
  `date_time_format` tinytext,
  `operator` char(2) DEFAULT NULL,
  `variable` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `driver_logbook_textbox_time_answer`
--

CREATE TABLE `driver_logbook_textbox_time_answer` (
  `id` int(11) NOT NULL,
  `logbook_answer` int(11) DEFAULT NULL,
  `textbox_template` int(11) DEFAULT NULL,
  `answer` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `driver_logbook_answer`
--
ALTER TABLE `driver_logbook_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_template` (`vehicle_driver_logbook_map_id`);

--
-- Indexes for table `driver_logbook_checkbox_answer`
--
ALTER TABLE `driver_logbook_checkbox_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkbox_headline` (`logbook_answer`),
  ADD KEY `checkbox_template` (`checkbox_template`);

--
-- Indexes for table `driver_logbook_checkbox_template`
--
ALTER TABLE `driver_logbook_checkbox_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkbox_headline` (`headline_id`);

--
-- Indexes for table `driver_logbook_dropdown_answer`
--
ALTER TABLE `driver_logbook_dropdown_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkbox_headline` (`logbook_answer`),
  ADD KEY `checkbox_template` (`dropdown_template`);

--
-- Indexes for table `driver_logbook_dropdown_template`
--
ALTER TABLE `driver_logbook_dropdown_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dropdown_headline` (`headline_id`);

--
-- Indexes for table `driver_logbook_extra_damage_answer`
--
ALTER TABLE `driver_logbook_extra_damage_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logbook_answer_extra_damage` (`logbook_answer`);

--
-- Indexes for table `driver_logbook_headline_template`
--
ALTER TABLE `driver_logbook_headline_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `headlines_driver_logook_template` (`template_id`);

--
-- Indexes for table `driver_logbook_radiobutton_answer`
--
ALTER TABLE `driver_logbook_radiobutton_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkbox_headline` (`logbook_answer`),
  ADD KEY `checkbox_template` (`radiobutton_template`);

--
-- Indexes for table `driver_logbook_radiobutton_template`
--
ALTER TABLE `driver_logbook_radiobutton_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `radiobutton_headline` (`headline_id`);

--
-- Indexes for table `driver_logbook_template`
--
ALTER TABLE `driver_logbook_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver_logbook_textbox_date_answer`
--
ALTER TABLE `driver_logbook_textbox_date_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `textbox_date_template` (`textbox_template`),
  ADD KEY `logbook_textbox_answer` (`logbook_answer`);

--
-- Indexes for table `driver_logbook_textbox_float_answer`
--
ALTER TABLE `driver_logbook_textbox_float_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logbook_answer` (`logbook_answer`),
  ADD KEY `textbox_template` (`textbox_template`);

--
-- Indexes for table `driver_logbook_textbox_int_answer`
--
ALTER TABLE `driver_logbook_textbox_int_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logbook_answer_` (`logbook_answer`),
  ADD KEY `textbox_template_` (`textbox_template`);

--
-- Indexes for table `driver_logbook_textbox_template`
--
ALTER TABLE `driver_logbook_textbox_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `textbox_headline` (`headline_id`);

--
-- Indexes for table `driver_logbook_textbox_time_answer`
--
ALTER TABLE `driver_logbook_textbox_time_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logbook_answer_time` (`logbook_answer`),
  ADD KEY `textbox_template_time` (`textbox_template`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `driver_logbook_answer`
--
ALTER TABLE `driver_logbook_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `driver_logbook_checkbox_answer`
--
ALTER TABLE `driver_logbook_checkbox_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `driver_logbook_checkbox_template`
--
ALTER TABLE `driver_logbook_checkbox_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `driver_logbook_dropdown_answer`
--
ALTER TABLE `driver_logbook_dropdown_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `driver_logbook_dropdown_template`
--
ALTER TABLE `driver_logbook_dropdown_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `driver_logbook_extra_damage_answer`
--
ALTER TABLE `driver_logbook_extra_damage_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `driver_logbook_headline_template`
--
ALTER TABLE `driver_logbook_headline_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `driver_logbook_radiobutton_answer`
--
ALTER TABLE `driver_logbook_radiobutton_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `driver_logbook_radiobutton_template`
--
ALTER TABLE `driver_logbook_radiobutton_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `driver_logbook_template`
--
ALTER TABLE `driver_logbook_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `driver_logbook_textbox_date_answer`
--
ALTER TABLE `driver_logbook_textbox_date_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `driver_logbook_textbox_float_answer`
--
ALTER TABLE `driver_logbook_textbox_float_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `driver_logbook_textbox_int_answer`
--
ALTER TABLE `driver_logbook_textbox_int_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `driver_logbook_textbox_template`
--
ALTER TABLE `driver_logbook_textbox_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `driver_logbook_textbox_time_answer`
--
ALTER TABLE `driver_logbook_textbox_time_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `driver_logbook_answer`
--
ALTER TABLE `driver_logbook_answer`
  ADD CONSTRAINT `vehicle_driver_logbook_map_answer` FOREIGN KEY (`vehicle_driver_logbook_map_id`) REFERENCES `remotedb`.`vehicle_driver_logbook_map` (`id`);

--
-- Constraints for table `driver_logbook_checkbox_answer`
--
ALTER TABLE `driver_logbook_checkbox_answer`
  ADD CONSTRAINT `checkbox_template` FOREIGN KEY (`checkbox_template`) REFERENCES `driver_logbook_checkbox_template` (`id`),
  ADD CONSTRAINT `logbook_checkbox_answer` FOREIGN KEY (`logbook_answer`) REFERENCES `driver_logbook_answer` (`id`);

--
-- Constraints for table `driver_logbook_checkbox_template`
--
ALTER TABLE `driver_logbook_checkbox_template`
  ADD CONSTRAINT `checkbox_headline` FOREIGN KEY (`headline_id`) REFERENCES `driver_logbook_headline_template` (`id`);

--
-- Constraints for table `driver_logbook_dropdown_answer`
--
ALTER TABLE `driver_logbook_dropdown_answer`
  ADD CONSTRAINT `driver_logbook_dropdown_answer_ibfk_1` FOREIGN KEY (`dropdown_template`) REFERENCES `driver_logbook_dropdown_template` (`id`),
  ADD CONSTRAINT `driver_logbook_dropdown_answer_ibfk_2` FOREIGN KEY (`logbook_answer`) REFERENCES `driver_logbook_answer` (`id`);

--
-- Constraints for table `driver_logbook_dropdown_template`
--
ALTER TABLE `driver_logbook_dropdown_template`
  ADD CONSTRAINT `dropdown_headline` FOREIGN KEY (`headline_id`) REFERENCES `driver_logbook_headline_template` (`id`);

--
-- Constraints for table `driver_logbook_extra_damage_answer`
--
ALTER TABLE `driver_logbook_extra_damage_answer`
  ADD CONSTRAINT `logbook_answer_extra_damage` FOREIGN KEY (`logbook_answer`) REFERENCES `driver_logbook_answer` (`id`);

--
-- Constraints for table `driver_logbook_headline_template`
--
ALTER TABLE `driver_logbook_headline_template`
  ADD CONSTRAINT `headlines_driver_logook_template` FOREIGN KEY (`template_id`) REFERENCES `driver_logbook_template` (`id`);

--
-- Constraints for table `driver_logbook_radiobutton_answer`
--
ALTER TABLE `driver_logbook_radiobutton_answer`
  ADD CONSTRAINT `driver_logbook_radiobutton_answer_ibfk_1` FOREIGN KEY (`radiobutton_template`) REFERENCES `driver_logbook_radiobutton_template` (`id`),
  ADD CONSTRAINT `driver_logbook_radiobutton_answer_ibfk_2` FOREIGN KEY (`logbook_answer`) REFERENCES `driver_logbook_answer` (`id`);

--
-- Constraints for table `driver_logbook_radiobutton_template`
--
ALTER TABLE `driver_logbook_radiobutton_template`
  ADD CONSTRAINT `radiobutton_headline` FOREIGN KEY (`headline_id`) REFERENCES `driver_logbook_headline_template` (`id`);

--
-- Constraints for table `driver_logbook_textbox_date_answer`
--
ALTER TABLE `driver_logbook_textbox_date_answer`
  ADD CONSTRAINT `logbook_textbox_answer` FOREIGN KEY (`logbook_answer`) REFERENCES `driver_logbook_answer` (`id`),
  ADD CONSTRAINT `textbox_date_template` FOREIGN KEY (`textbox_template`) REFERENCES `driver_logbook_textbox_template` (`id`);

--
-- Constraints for table `driver_logbook_textbox_float_answer`
--
ALTER TABLE `driver_logbook_textbox_float_answer`
  ADD CONSTRAINT `logbook_answer` FOREIGN KEY (`logbook_answer`) REFERENCES `driver_logbook_answer` (`id`),
  ADD CONSTRAINT `textbox_template` FOREIGN KEY (`textbox_template`) REFERENCES `driver_logbook_textbox_template` (`id`);

--
-- Constraints for table `driver_logbook_textbox_int_answer`
--
ALTER TABLE `driver_logbook_textbox_int_answer`
  ADD CONSTRAINT `logbook_answer_` FOREIGN KEY (`logbook_answer`) REFERENCES `driver_logbook_answer` (`id`),
  ADD CONSTRAINT `textbox_template_` FOREIGN KEY (`textbox_template`) REFERENCES `driver_logbook_textbox_template` (`id`);

--
-- Constraints for table `driver_logbook_textbox_template`
--
ALTER TABLE `driver_logbook_textbox_template`
  ADD CONSTRAINT `textbox_headline` FOREIGN KEY (`headline_id`) REFERENCES `driver_logbook_headline_template` (`id`);

--
-- Constraints for table `driver_logbook_textbox_time_answer`
--
ALTER TABLE `driver_logbook_textbox_time_answer`
  ADD CONSTRAINT `logbook_answer_time` FOREIGN KEY (`logbook_answer`) REFERENCES `driver_logbook_answer` (`id`),
  ADD CONSTRAINT `textbox_template_time` FOREIGN KEY (`textbox_template`) REFERENCES `driver_logbook_textbox_template` (`id`);
COMMIT;