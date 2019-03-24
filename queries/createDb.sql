CREATE DATABASE IF NOT EXISTS Hackathon;

USE Hackathon;

CREATE TABLE IF NOT EXISTS Users (
  id INT AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE,
  username VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  phone VARCHAR(15),
  bio TEXT,
  image LONGTEXT,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Events (
  id INT AUTO_INCREMENT,
  creatorId INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  longitude VARCHAR(15) NOT NULL,
  latitude VARCHAR(15) NOT NULL,
  startTime TIMESTAMP NOT NULL DEFAULT NOW(),
  endTime TIMESTAMP NOT NULL DEFAULT NOW(),
  requiredAssets TINYINT NOT NULL DEFAULT 0,
  maxPartecipants TINYINT,
  image LONGTEXT,
  PRIMARY KEY (id),
  FOREIGN KEY (creatorId) REFERENCES Users(id),
  CHECK (startTime <= endTime)
);

CREATE TABLE IF NOT EXISTS Users_Events_th (
  id INT AUTO_INCREMENT,
  userId INT NOT NULL,
  eventId INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (userId) REFERENCES Users(id),
  FOREIGN KEY (eventId) REFERENCES Events(id),
  CONSTRAINT userId_eventId_unique UNIQUE (userId, eventId)
);

CREATE TABLE IF NOT EXISTS Assets (
  id INT AUTO_INCREMENT,
  eventId INT NOT NULL,
  checked TINYINT(1) NOT NULL DEFAULT FALSE,
  checkedBy INT,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (eventId) REFERENCES Events(id),
  FOREIGN KEY (checkedBy) REFERENCES Users(id)
);
