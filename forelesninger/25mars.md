---
title: Forelesning 25. mars
---

# Forelesning 25. mars - Lagring og indeksering

---

## Læringsmål for del 2 av TDT4145

- Kunnskap om databasesystemer
  - Lagring
  - Indekser
  - Queryutføring
  - Transaksjoner
- Kunnskap om og evne til å utnytte databasesystemer effektivt og pålitelig
- Kunnskap og evne til å se databasedesign i sammenheng med programvareutvkling

## Hvorfor lære om DB-"innmat"?

- For å kunne bruke databaser bedre
  - Indekser
  - Queries
  - Transaksjoner
- For å lage en komplett forståelse av databaser
- For de som øsnker å jobbe mer med databaser

## Databasearkitektur

- Tre lag; Eksterne, konseptuelle og interne nivå.

## Databaselagring

- Databaser lagres i filer eller på "raw devices"
  - "raw devices" unngår operativsystemets buffer
- Lagring av tabeller
  - Heapfil
  - B+-trær
  - Hashfil
  - LSM-trær
- Lagring av indeksfiler (på attributter)
  - For å få rask tilgang til data i tabellene
  - Eller tvinge gjennom __PRIMARY KEY / UNIQUE__-restriksjoner
    - Hashing
    - B+-trær
    - R-trær (flere dimensjoner)

## Lagring av poster

- En rad i en tabell er vanligvis lagret som en post (record) i en fil
- En post har felter med navn og datatype
  - Integer, long integer, floating point
  - String (fast lengde og variabel lengde)
  - Date/time
  - Blobs - lange felter
  - JSON
- SQL-dictionary (Catalog) beskriver hvordan en tabell/post er lagret
  - Lengde og datatyper
  - + mye annet

## Postlayout

 - Hvordan postene til database er strukturert

## Blocklayout

- ?

## Buffer

- Kopi i RAM av ofte brukte blokker fra databasen
- Databaser vil gjerne ha kontroll på dataene i RAM, så de "pinnes" slik at "virtual memory" ikke kaster de ut.
- Kan også støtte "pre-fetching" av blokker.
- Det brukes som regel en hashbasert inngang til buffer basert på BlockID.
- Blokker som tilhører samme hashinngang lenkes sammen.
- Blokker skrives til disk som en del av sjekkpunkting i forbindelse med logging og recovery.

## Heapfiler

- "Rått" og usortert lager av poster.
- Poster settes inn på slutten av filen. Kan være to lister.
- Aksesseres med en __RecordID__ (BlockID, indeks innen blokk)
- Vanligvis har man indekser i tillegg til heapfiler.
- + lett å sette inn posten
- + god til tabellscan
- + bra skriveytelse
- - dårlig til søk på attributter og rangesøk (verdiområdesøk)

## Hashbaserte indekser

- Bra for direkte aksess på søkenøkkel
- h(K) - hashfunksjon av søkenøkkel
  - Sprer postene bra utover slik at de lett kan gjenfinnes
- F.eks. $h(K) = k MOD M$ (restfunksjon)
- Mange mulige hashfunksjoner
- En god hashfunskjon har god spredning, men er avhengig av hva som skal spres
- Hvordan håndtere overflyt
  - Åpen adressering: lagre opsten i første ledige etterfølgende blokk i fila
  - Separat overløp: lenk sammen overløpsblokker
  - Multippel hashing: bruk av ny hashfunksjoner når det blir kollisjoner

# Statisk hashing

- Partition by key i MySQL

```SQL
CREATE TABLE tm1 (
	s1 CHAR(32) PRIMARY KEY
)
PARTITION BY KEY (s1)
PARTITIONS 10;
```

- Fast antall blokker/partisjoner i samme fil
- Må bruke overløp for dynamiske datamengder (ukjent antall poster)
- Lange overløp kan ødelegge ytelsen

## Extendible hashing

- Problem ved statisk hashing.
  - Utvidelse av filen, dvs. dobling av antall blokker.
  - Les alle blokker og skriv alle blokker på nytt
- Extendible hashing
  - Bruk katalog med pekere til blokker og doble katalogen ved behov
  - Splitt (les og skriv) kun den blokken som ble full
  - Lokal og global dybde
  - Hvis en blokk er full og $lokal dybde == global dybde$: Directory doubling

## Hvorfor bruke indekser?

- For å gjøre queries raskere

```SQL
Student(pnr, studnr, navn, adresse, epost)

SELECT navn, adresse FROM Student WHERE studnr=123456;

Film(id, fnavn, år, selskap, nasjonalitet, score)

SELECT fnavn, år FROM Film WHERE score > 7.0;
```

- For å tvinge gjennom __UNIQUE__ og __PRIMARY KEY__-restriksjoner

## Begreper innen indeksering

- Indeksfelt: Felt / attributt av posten som indeksen bruker 
- Primærindeks: Indeks på primærnøkkelen 
- Clustered indeks: Indeks på en tabell hvor postene er fysisk lagret sammen med (i) indeksen
- Sekundærindeks: Ekstra indeks på et annet felt hvor det også finnes en primærindeks. 
- Sekundærindeksen kan være brukt for å tvinge gjennom UNIQUE, dvs. en unik verdi for hver post i tabellen

## Lagrings- og indekseringsmuligheter

- Systemspesifikt, se dokumentasjon av «ditt» system
- Clustered B+-tree / clustered index
  - B+-tre på primærnøkkel
  - Løvnivå av treet lagrer selve posten
  - MySQL: InnoDB
  - SQL Server: Clustered index når primærnøkkel er definert
- Heapfil og B+-tre
  - Tabell lagret i heapfil
  - B+-tre på primærnøkkel
  - Evt. annen indeks på et annet felt
  - MySQL: MyISAM
  - SQL Server: Heap + unclustered index
- Heapfil
  - Postene lagres fortløpende uten nonen annen organisering
  - SQL Server: Hvis primærnøkkel ikke er definert
- Clustered hash index
  - Hashindeks på primærnøkkel
  - Posten lagret i indeksen
  - Oracle: Hash cluster
- LSM-trees (log-structured merge trees)
  - Moderne lagrings- og indekseringsmetode
  - "Cacher" de nyeste innsatte/oppdaterte postene.
  - Høy skriveytelse, lav "write amplification", bedre komprimering.
  - Eldre poster flyttes over i "langtidslager" (flere nivåer)
  - NoSQL, RocksDB, MySQL/myRocks, Apache Hbase
- Column stores
  - Tradisjonelt lagres tabellens rader i SQL-databaser
  - Analyseapplikasjoner / datavarehus vil oppleve bedre ytelse med kolonnebasert lagring
  - Leser mindre data ved queries og kan bruke komprimering
  - `SELECT MAX(score) FROM Film;`
  - SQL Server: Columnstore index + _delta store_ for å samle nok oppdateringer til å flette sammen med kolonnen.
  - Apache Kudu (Hadoop platform)

## B+-trær i praksis

- Typisk fanout: 133
- Typisk fyllgrad: 67%
- Typisk kapasitet ~3 mill poster (høyde 3), ~300 mill (høyde 4)
- Clustered B+ gir ca 47 millioner poster
- I praksis er de øverste nivåene alltid i buffer (RAM)

## Poster i B+-trær

- Tabell: Student (_pnr_, studnr, navn, adresse, epost)
- Clustered B+
- Løvnivå (level=0)
  - ('101195 12345', 123456, 'Hans Hansen', 'Revekroken 1', 'hans@stud.ntnu.no')

## Blokksplitting i B+-tre

- Splitting vanligvis ved midterste post
- Størrelsesmessig midterste post ved variabel lengde poster
- Maks poststørrelse kan være ½ blokk, men spesialløsninger for virkelig lange poster (BLOBs)
- Indeksposter (level > 0) er små: nøkkel + BlockId
- Løvnodeposter kan være større. Hvorfor?


## Indekser på sammensatte nøkler

- Employee(ssn, dno, age, street, zip, salary, skill)
- `SELECT * FROM Employee WHERE dno=4 AND age>50`

{% include mathjax.html %}
{% include gotop.html %}
