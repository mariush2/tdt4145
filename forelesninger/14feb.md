---
title: Forelesning 14. februar
---

# Forelesning 14. februar - MVD-er og 4NF. EER: Kategorier

---

## Dekomponering: Kriterier
Starter med R og F. Finner en dekomponering i tabeller (projeksjoner) som kan lagre det samme og har bedre egenskaper

1. Normalform
2. Attributtbevaring
3. Bevaring av funskjonelle avhengigheter
4. Tapsløs sammenstilling til utgangspunktet

## Sjekke T-J-egenskapen
- En dekomponering av $R, D = \{R_1, R_2\}$, har tapsløst-join-egenskapen hvis


$R_1 \cap R_2 \longrightarrow R_1$ eller $R_1 \cap R_2 \longrightarrow R_2$


- Komponent-tabellenes felles attributter er supernøkkel for en eller begge komponenttabellene
- NB! Dette er ikke "hvis og bare hvis", kan være for konservativ.

- Ved oppslitting i flere trinn vil sluttresultatet ha T-J-egenskapen hvis alle oppsplittingene har det
- Kan brue "felles-attributt-regelen" for å sjekke hver dekomponering

## Sjekke T-L-J: Tabellmetoden
- Se læreboka, algoritme 15.3

## BCNF og kriteriene
- Kan alltid oppnå alle 4 kriterer når vi nøyer oss med tabelelr på 3NF
- Ønsker vi BCNF kan vi måtte velge bort noe:
  - Attributtbevaring - kan vi ikke klare oss uten
	- Bevaring av funksjonelle avhengigheter - restriksjonen blir mer krevende å gjennomføre, men det er mulig
	- Tapsløst-join-egenskapen - kan vi ikke velge bort, da får vi et design som genrerer "søppel"
- I noen "vanskelige" tilfeller: 3NF og FA-bevaring eller BCNF uten FA-bevaring

## 3NF / BCNF kan ha problemer

### Ansattinfo

 AnsattNr | Kompetanse | Hobby 
 --- | --- | ---
 1 | DB | Fotball
 1 | C++ | Foto 
 2 | DB | Ski 
 1 | C++ | Fotball 
 1 | DB | Foto 

- Kompetanser og Hobbyer er uavhengige av hverandre (for en person)
- Innsetting av <1, Java, Tennis> krever innsetting av
  - <1, Jva, Fotball> og <1, Java, Foto>
	- <1, DB, Tennis>
	- <1, C++, Tennis>
- (Ekstrem) grad redundans, men BCNF!

## Flerverdi-avhengigheter

Gitt X, Y, Z som er delmengder av R.

En multi-value dependency (MVD) X->> Y betyr at Y-verdier som er assosiert med en X-verdi bestemmes av X og ingenting annet.
- AnsattNr ->> Kompetanse
- AnsattNr ->> Hobby

## MVD-egenskaper
- X ->> Y er _trivielle_ hvis Y er en delmengde av X eller $X \cup Y = R$
  - Trivielle MVD-er gir ingen restriksjon
- Alle FD-er er MVD-er
- MVD-er kommer (ofte) i par
  - Hvis X ->> Y så vil X ->> Z, der $Z = R - (X \cup Y)$
- Det finnes utledningsregler for FD+MDR (Ikke pensum)

## Fjerde normalform (4NF)
- En tabell er på 4NF hvis det for alle ikke-trivielle MVD-er, X ->> Y, er slik at X er en supernøkkel
- Fagins teorem ($A$, $B$ er delmengder av $R$, $C = R - AB$):

Projeksjonene AB og AC har tapsløs-join-egenskapen hvis A ->> B eller A ->> C

## Ansattinfo (ny)

### Ansattkompetanse

AnsattNr | Kompetanse 
 --- | --- 
 1 | DB 
 1 | C++ 
 2 | DB 

### AnsattHobbyer

AnsattNr | Hobby 
 --- | --- 
 1 | Fotball 
 1 | Foto 
 2 | Ski 

- Komponent-tabellene er på 4NF
- Vi har tapsløst-join mellom komponentene
- Redundanser er borte
- <1, Java, Tennis> vil føre til
  - <1, Java> i AnsattKompetanse
	- <1, Tennis> I AnsattHobbyer

## Kategorier: Subklasser med flere superklasser
- Mengden entiteter i en kategori er en delmengde av entitetene i superklassene
- UNION-klasse, derfor U i sirkelen
- JuridiskPerson er enten Selskap eller Person
- Selektiv arving

## Kategorier: Pensum
- 4.4 Modelling of UNION Types Using Categories
- 9.2.3 Mapping Of Categories (Union Types)

{% include mathjax.html %}
{% include gotop.html %}
