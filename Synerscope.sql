CREATE DATABASE Synerscope
GO

USE Synerscope

CREATE TABLE Persoon
(
	PersoonID	INT IDENTITY(1,1) PRIMARY KEY,
	Voornaam	VARCHAR(100),
	Achternaam	VARCHAR(100),
	DEL			BIT
);

CREATE TABLE Hobby
(
	HobbyID		INT IDENTITY(1,1) PRIMARY KEY,
	HobbyNaam	VARCHAR(100),
	DEL			BIT
);

CREATE TABLE PersoonHobby
(
	PersoonHobbyID	INT IDENTITY(1,1) PRIMARY KEY,
	PersoonID		INT,
	HobbyID			INT,
	DEL				BIT
);

ALTER TABLE PersoonHobby
ADD FOREIGN KEY (PersoonID)
REFERENCES Persoon(PersoonID);

ALTER TABLE PersoonHobby
ADD FOREIGN KEY (HobbyID)
REFERENCES Hobby(HobbyID);

INSERT INTO Persoon(Voornaam, Achternaam)
VALUES('Henk', 'de Vries')

INSERT INTO Hobby(HobbyNaam)
VALUES('Fietsen'),
('Biljarten')

INSERT INTO PersoonHobby(PersoonID, HobbyID)
VALUES(1, 1),
		(1,2)

SELECT ph.*, h.HobbyNaam
FROM PersoonHobby ph
LEFT JOIN Hobby h ON ph.HobbyID = h.HobbyID

INSERT INTO Persoon(Voornaam, Achternaam)
VALUES('Piet', 'de Vries')

SELECT * FROM Persoon

GO;
CREATE PROCEDURE HobbyAanPersoon
AS

SELECT PersoonID, Voornaam + ' ' + Achternaam AS [Naam]
FROM Persoon

GO;
CREATE PROCEDURE HobbyAanPersoonH
AS

SELECT HobbyID, HobbyNaam
FROM Hobby

INSERT INTO Hobby(HobbyNaam)
VALUES('Sporten')