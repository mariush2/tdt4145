use 3task1;
CREATE TABLE Regissor(
	RegissorID INT NOT NULL,
    Navn VARCHAR(50) NOT NULL,
    CONSTRAINT RegissorPK PRIMARY KEY(RegissorID)
);
    
CREATE TABLE Film(
	FilmID INT NOT NULL,
    Title VARCHAR(50) NOT NULL,
    Produksjonar INT NOT NULL,
    RegissorID INT NOT NULL,
    CONSTRAINT FilmPK PRIMARY KEY (FilmID),
    CONSTRAINT FilmFK FOREIGN KEY (RegissorID) REFERENCES Regissor(RegissorID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Sjanger(
	SjangerID INT NOT NULL,
    Navn VARCHAR(50) NOT NULL,
    Beskrivelse VARCHAR(100) NOT NULL,
    CONSTRAINT SjangerPK PRIMARY KEY(SjangerID)
);

CREATE TABLE Skuespiller(
	SkuespillerID INT NOT NULL,
    Navn VARCHAR(50) NOT NULL,
    Fodselsar INT NOT NULL,
    CONSTRAINT SkuespillerPK PRIMARY KEY (SkuespillerID)
);

CREATE TABLE SkuespillerFilm(
	FilmID INT NOT NULL,
    SjangerID INT NOT NULL,
    CONSTRAINT SjangerForFilmPK PRIMARY KEY(FilmID, SjangerID),
    CONSTRAINT SjangerForFilmFK1 FOREIGN KEY(FilmID) REFERENCES Film(FilmID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT SjangerForFIlmFK2 FOREIGN KEY(SjangerID) REFERENCES Sjanger(SjangerID) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Regissor VALUES(1, "Peytod Read");
INSERT INTO Regissor VALUES(2, "Tom Shadyac");
INSERT INTO Film VALUES (1, "Yes Man", 2008, 1);
INSERT INTO Skuespiller VALUES(1, "Jim Carrey", 1962);
INSERT INTO SkuespillerIFIlm VALUES(1, 1, "Carl");

UPDATE Skuespiller SET Navn = "James Eugene Carrey" WHERE SkuespillerID = 1;

DELETE FROM Regissor 
WHERE RegissorID = 2;

#Oppgave A
SELECT FilmID, Title, Produksjonsar, RegissorID FROM Film;

#Oppgave B
SELECT Navn FROM Skuespiller WHERE Fodselsar > 1960;

#Oppgave C
SELECT Navn FROM Skuespiller WHERE Fodselsar > 1979 AND Fodselsar < 1990;

#Oppgave D
SELECT Film.Title, Sif.Rolle AS Rolle FROM Film INNER JOIN SkuespillerFilm AS Sif ON (Film.FilmID = Sif.FilmID) INNER JOIN Skuespiller 
	AS S on (Sif.SkuespillerID = S.SkuespillerID) WHERE S.Navn = "Morgan Freeman";

#Oppgave E
SELECT DISTINCT Title FROM Film INNER JOIN Regissor ON (Film.RegissorID = Regissor.RegissorID) WHERE Regissor.Navn 
	IN (SELECT Navn FROM Film INNER JOIN SkuespillerIFilm AS Sif ON (Film.FilmID = Sif.FilmID)
		INNER JOIN Skuespiller AS S ON (S.SkuespillerID = Sif.SkuespillerID)
			WHERE Regissor.RegissorID = Film.RegissorID);

#Oppgave F
SELECT COUNT(*) AS Antall FROM Skuespiller WHERE Navn LIKE "C%";

#Oppgave G
SELECT Navn, COUNT(*) AS Antall FROM Sjanger INNER JOIN SjangerForFilm ON (Sjanger.SjangerID = SjangerForFilm.SjangerID) GROUP BY Navn;

#Oppgave H
SELECT S.Navn FROM Skuespiller AS S INNER JOIN SkuespillerFilm AS Sif on (S.SkuespillerID = Sif.SkuespillerID)
	INNER JOIN Film ON (Film.FilmID  = Sif.FilmID)
		WHERE Film.Title = "Ace Ventura: Pet Detective" AND 
			S.SkuespillerID NOT IN (SELECT SkueSpillerID FROM SkuespillerFilm INNER JOIN Film
				ON (SkuespillerIFilm.FilmID = Film.FilmID) WHERE Film.Title = "Ace Ventura: When Nature Calls");

#Oppgave I
SELECT Film.Title, Film.FilmID, AVG(S.Fodselsar) FROM Film INNER JOIN SkuespillerIFIlm AS Sif
	ON (Film.FilmID = Sif.FilmID) INNER JOIN Skuespiller AS S ON (Sif.SkuespillerID = S.SkuespillerID)
		GROUP BY Film.FilmID HAVING AVG(S.Fodselsar) > (SELECT AVG(Fodselsar) FROM Skuespiller ) ORDER BY Film.Title ASC;


