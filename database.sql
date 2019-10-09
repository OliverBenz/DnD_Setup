CREATE DATABASE if not exists dnd;

use dnd;

CREATE TABLE `users`(
	id INT UNIQUE NOT NULL AUTO_INCREMENT,
	firstname varchar(20) NOT NULL,
	lastname varchar(20) NOT NULL,
	email varchar(30) UNIQUE NOT NULL,
  password varchar(255) NOT NULL,
	sessionId varchar(255) UNIQUE NOT NULL,
	
	PRIMARY KEY(id)
);

CREATE TABLE schools(
	id INT UNIQUE NOT NULL AUTO_INCREMENT,
	name VARCHAR(50),
	`desc` TEXT,
	
	PRIMARY KEY(id)
);

CREATE TABLE sizes(
	id INT UNIQUE NOT NULL AUTO_INCREMENT,
	name VARCHAR(15),

	PRIMARY KEY(id)
);

CREATE TABLE `races`(
	id INT UNIQUE NOT NULL AUTO_INCREMENT,
	name VARCHAR(25),
	speed INT,
	alignment TEXT,
	size INT,
	sizeDesc TEXT,

	PRIMARY KEY(id),
	FOREIGN KEY(size) REFERENCES sizes(id)
);

CREATE TABLE `languages`(
	id INT UNIQUE NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(25),
	`type` VARCHAR(25),
	`script` VARCHAR(25),

	PRIMARY KEY(id)
);

-- CREATE TABLE 'languageSpeakers'(
-- 	languageId INT NOT NULL,
-- 	`name` VARCHAR(20) NOT NULL,

-- 	PRIMARY KEY(languageId, `name`),
-- 	UNIQUE(languageId, `name`),

-- 	FOREIGN KEY(languageId) REFERENCES languages(id)
-- );

CREATE TABLE `spells`(
	`id` INT UNIQUE NOT NULL AUTO_INCREMENT,
	`name` varchar(30) UNIQUE NOT NULL,
	`desc` TEXT,
	`higher_level` TEXT,
	`page` VARCHAR(10),
	`material` TEXT,
	`ritual` BOOLEAN,
	`duration` VARCHAR(15),
	`concentration` BOOLEAN,
	`school` INT,
	`level` INT,
	`range` VARCHAR(10),
	`castTime` VARCHAR(15),

	PRIMARY KEY(id),
	FOREIGN KEY(school) REFERENCES school(id)
);

CREATE TABLE `alignments`(
	id INT UNIQUE NOT NULL AUTO_INCREMENT,
	name VARCHAR(20) UNIQUE,

	PRIMARY KEY(id)	
);

CREATE TABLE `backgrounds`(
	id INT UNIQUE NOT NULL AUTO_INCREMENT,
	name VARCHAR(20) UNIQUE,
	
	PRIMARY KEY(id)
);

CREATE TABLE `characters`(
	id INT UNIQUE NOT NULL AUTO_INCREMENT,
	charString VARCHAR(20) UNIQUE NOT NULL,
	userId INT NOT NULL,
	
	firstname VARCHAR(30),
	lastname VARCHAR(30),
	level INT NOT NULL,
	xp INT,
	alignment INT,
	background INT,
	age INT,
	height INT,
	weight INT,
	
	maxHealth INT NOT NULL,
	tempHealth INT NOT NULL,
	currentHealth INT NOT NULL,
	
	copper INT,
	silver INT,
	electrum INT,
	gold INT,
	platinum INT,

	deleted BOOLEAN,
	
	PRIMARY KEY(id),
	FOREIGN KEY(userId) REFERENCES `users`(id),
	FOREIGN KEY(alignment) REFERENCES alignments(id),
	FOREIGN KEY(background) REFERENCES `backgrounds`(id)
);

CREATE TABLE charSpells(
	characterId INT NOT NULL,
	spellId INT NOT NULL,
	
	UNIQUE(characterId, spellId),
	PRIMARY KEY(characterId, spellId),
	
	FOREIGN KEY(characterId) REFERENCES `characters`(id),
	FOREIGN KEY(spellId) REFERENCES spells(id)
);

CREATE TABLE charLanguages(
	characterId INT NOT NULL,
	languageId INT NOT NULL,

	UNIQUE(characterId, languageId),
	PRIMARY KEY(characterId, languageId),

	FOREIGN KEY(characterId) REFERENCES `characters`(id),
	FOREIGN KEY(languageId) REFERENCES `languages`(id)
);

-- Campaign
CREATE TABLE campaigns(
	id INT UNIQUE NOT NULL AUTO_INCREMENT,
	name varchar(30),
	campaignString VARCHAR(20) UNIQUE NOT NULL,
	
	PRIMARY KEY(id)
);

CREATE TABLE campaignChar(
	campaignId INT NOT NULL,
	characterId INT NOT NULL,
	
	UNIQUE(campaignId, characterId),
	PRIMARY KEY(campaignId, characterId),
	FOREIGN KEY(campaignId) REFERENCES campaigns(id),
	FOREIGN KEY(characterId) REFERENCES characters(id)
);

-- Note
CREATE TABLE `notes`(
	id INT UNIQUE NOT NULL AUTO_INCREMENT,
	charId INT NOT NULL,
	date DATETIME NOT NULL,
	note TEXT,
	
	PRIMARY KEY(id),
	FOREIGN KEY(charId) REFERENCES characters(id)
);

-- Tracker
CREATE TABLE charTrackers(
	id INT UNIQUE NOT NULL AUTO_INCREMENT,
	charId INT NOT NULL,
	title VARCHAR(25) NOT NULL,
	
	`value` INT NOT NULL,
	`maxValue` INT,
	`minValue` INT,
	
	PRIMARY KEY(id),
	FOREIGN KEY(charId) REFERENCES characters(id)
);