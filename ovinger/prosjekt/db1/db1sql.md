# DB1 - SQL

```SQL
CREATE TABLE Treningsokt(
	Oktnr INT NOT NULL,
    Form INT CHECK (Form BETWEEN 1 AND 10),
    Prestasjon INT CHECK (Prestasjon BETWEEN 1 AND 10),
    Notat VARCHAR(150),
    OvelserIOkt INT CHECK (OvelserIOkt > 0),
    CONSTRAINT TreningsoktPK PRIMARY KEY (Oktnr)
);

CREATE TABLE Resultat(
	ResultatID INT NOT NULL,
    Dato DATETIME,
    Beskrivelse VARCHAR(150),
    OvelseID INT NOT NULL,
    CONSTRAINT ResultatPK PRIMARY KEY (ResultatID),
    CONSTRAINT ResultatForOvelse FOREIGN KEY (OvelseID) REFERENCES Apparatovelse(OvelseID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT ResultatForOvelse FOREIGN KEY (OvelseID) REFERENCES Kroppsovelse(OvelseID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Apparatovelse(
	OvelseID INT NOT NULL,
    Navn VARCHAR(50) NOT NULL,
    AntallKilo INT NOT NULL,
    AntallSett INT NOT NULL,
    BruktApparat VARCHAR(70) NOT NULL,
    OvelsegruppeID INT NOT NULL,
    CONSTRAINT OvelseID PRIMARY KEY (OvelseID),
    CONSTRAINT BrukApparat FOREIGN KEY (BruktApparat) REFERENCES Apparat(BruktApparat) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Ovelsegruppe FOREIGN KEY (OvelsesgruppeID) REFERENCES Ovelsesgruppe(OvelsesgruppeID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Kroppsovelse(
	OvelseID INT NOT NULL,
    Navn VARCHAR(50) NOT NULL,
    Beskrivelse VARCHAR(150) NOT NULL,
    OvelsegruppeID INT NOT NULL,
    CONSTRAINT OvelseID PRIMARY KEY (OvelseID),
    CONSTRAINT Ovelsegruppe FOREIGN KEY (OvelsesgruppeID) REFERENCES Ovelsesgruppe(OvelsesgruppeID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Apparat(
	Navn VARCHAR(70) NOT NULL,
    Beskrivelse VARCHAR(150),
    CONSTRAINT Navn PRIMARY KEY (Navn)
);

CREATE TABLE Ovelsegruppe(
	OvelsegruppeID INT NOT NULL,
    Navn VARCHAR(70) NOT NULL,
    CONSTRAINT OvelsegruppeID PRIMARY KEY (OvelsegruppeID)
);
```
