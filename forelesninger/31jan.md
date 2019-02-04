---
title: Forelesning 31. januar
---

# Forelesning 31. januar - SQL

---

## SQL
- Opprinneling fra IBM på 1970-tallet
- ANSI/ISO-standard
  - Omfattende
  - Produkttilpasning (mangler, tillegg, varianter)
- Historiske alternativer
  - QUEL (fra Ingres)
  - QBE - Query By Example
- Ikke like mengdeorientert som relasjonsalgebra
  - Resultattabeller kan ha like rader/tuppler
- Deklarativt (hva, ikke hvordan)
  - Røtter i relational calculus (ikke pensum)
- Tips: SQL Tutorial på W3Schools.com:
  - [https://www.w3schools.com/sql/](https://www.w3schools.com/sql/)

## DDL - Data Definiton Language
- `create schema/table/domain`
- `alter table`
- `drop schema/table/domain`
- Mange innebygde datatyper
  - Sjekk læreboka eller produkt-dokumentasjon
- Vi skal bruke __MySQL__

## Hundedatabasen

```SQL
CREATE TABLE Person (
  Pnr     INTEGER NOT NULL,
  Navn    VARCHAR(20),
  CONSTRAINT Person_PK PRIMARY KEY (Pnr)
);

CREATE TABLE Hund (
  Regnr   INTEGER NOT NULL,
  Navn    VARCHAR(30),
  Faar    INTEGER,
  Rase    VARCHAR(30),
  EierPnr INTEGER NOT NULL,
  CONSTRAINT Hund_PK PRIMARY KEY (Regnr),
  CONSTRAINT Hund_FK FOREIGN KEY (EierPnr) REFERENCES Person(Pnr) ON UPDATE CASCADE ON DELETE NO ACTION,
  CONSTRAINT Alderssjekk CHECK (Faar > 1980)
);

CREATE TABLE BittAv (
  Pnr     INTEGER NOT NULL,
  Regnr   INTEGER NOT NULL,
  Antall  INTEGER DEFAULT 0,
  CONSTRAINT BittAv_PK PRIMARY KEY (Pnr, Regnr),
  CONSTRAINT BittAv_FK FOREIGN KEY (Pnr) REFERENCES Person(Pnr) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT BittAv_FK2 FOREIGN KEY (Regnr) REFERENCES Hund(Regnr) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT AntallSjekk CHECK (Antall >= 0)
);

```
## Foreign Key restriksjoner
```SQL
CONSTRAINT Hund_FK
    FOREIGN KEY (Eier_Pnr)
    REFERENCES Person(Pnr)
    ON UPDATE *
    ON DELETE *
```
- Alternativer for __\*__
  - `NO ACTION (default) / RESTRICT`
  - `SET NULL`
  - `CASCADE`

## DML - Data Manipulation Language
- Insetting, endring, sletting
  - `insert`
  - `update`
  - `delete`
- Spørring
  - select-setningen

## DML: Spørring
- SELECT-setningen (NB! ikke samme som seleksjon!)
```SQL
SELECT < attributt-list >
FROM < tabell-liste >
WHERE < logisk betingelse >
```
- Spesifiserer
  - "Skjema" for resultattabellen
  - Hvilke tabeller som er involvert og sammenstilling av disse
  - En betingelse som alle rader i resultattabellen må oppfylle
  - SQL eliminerer ikke duplikater (bag-semantikk)
  - Setningen kan bygges ut med flere deler

## Ordning av resultat
- `ORDER BY <attributt-ordning-liste>`
- ASC - ascending, DESC - descending
- Alltid _til slutt_ i SELECT-setningen

## Data fra flere tabeller
Klassisk SQL:
```SQL
SELECT RegNr, Hund.navn, Person.Navn FROM Hund, Person WHERE Eier_Pnr = Pnr
```

Moderne SQL:
```SQL
SELECT RegNr, Hund.navn, Person.Navn FROM Hund INNER JOIN Person ON Eier_Pnr = Pnr
```

## Joined tables: Data fra flere tabeller
- Moderne SQL Spesifiserer sammenstilling i FROM-delen:
  - JOIN typer
    - JOIN / INNER JOIN
    - NATURAL JOIN
    - LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN
    - CROSS JOIN (kartesisk produkt)
  - JOIN betingelse (condition)
    - NATURAL
    - ON <logisk betingelse>
    - USING ( <attributtliste> )
- Klassisk SQL nevner tabellene i FROM-delen, spesifiserer  betingelse i WHERE-delen (se eksempel tidligere)
- NB! Uten betingelse genererer alle join kartesisk produkt




{% include mathjax.html %}
{% include gotop.html %}
