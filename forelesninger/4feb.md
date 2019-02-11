---
title: Forelesning 4. februar
---

# Forelesning 4. februar - SQL del 2

---

## Spørring i SQL
- Enkle spørringer
  - en-tabe

## Nøstede spørringer (IN)
- Mengdeoperator _element i_:
  - IN / NOT IN
- Q: Alle hunder som ikke har bitt nonen
  - `SELECT * FROM Hund WHERE RegNr NOT IN (SELECT RegNr FROM BittAv)`

## Nøstede spørringer (EXISTS)
- Gir del-spørringer resultat (minst en rad) eller ikke?
  - EXISTS / NOT EXISTS
- Q: Hunder som _ikke_ har bitt sin eier
  - `SELECT * FROM Hund AS H WHERE NOT EXISTS (SELECT * FROM BittAv AS BA WHERE BA.RegNr = H.RegNr AND BA.Pnr = H.Eier_Pnr)`

- Dette er en _korrelert_ del-spørring ("sender inn data")

## Mengde-operatorer
- Mengdeorientert (Fjerner duplikater):
  - UNION
  - INTERSECT
  - EXCEPT
- Bag-orientert (multiset):
  - UNION ALL
  - INTERSECT ALL
  - EXCEPT ALL
- Husk union-kompatible (operand-)tabeller
- Her er det mye mangelfull og varierende implementasjon

## Innebygde funksjoner
- COUNT, SUM, MIN, MAX, AVG etc.
- Funksjonene ignorerer NULL-verdier
- COUNT(\*) teller antall rader (uansett NULL-verdier)
- DISTINCT gjør at funksjonene opererer på unike verdier

## Gruppering
- GROUP BY <attributt-liste>
  - Definerer "grupper" (partisjoner) av tupler

## Betingelser etter gruppering
- HAVING <betingelse>
  - Betingelser knyttet til resultatet av "opptelling" i gruppene

## VIEWS / Virtuelle tabeller
- Tabeller som er avledet ut fra andre base-tabeller

- Hvorfor: Spørreforenkling + sikkerhet
- implementasjon: query modification / view materialization
- Brukes som base-tabeller, men ikke alltid mulig å oppdatere gjennom VIEW
  - Hint: Flere tabeller / aggregering gir utfordringer

## Lesetips
- Ferdig med SQL:
  - 6 Basic SQL, side 177-202
  - 7 More SQL, side 207-235
    - Untatt 7.2
- Fortsetter med:
  - 14 Basics of Functinal Dependencies and Normalization for Relation Databases, side 459-496
    - Untatt: 14.7

## Terminologi
- $R(A,B,C)$ - skjema for tabellen
- $r(R)$ - tabellforekomsten
- $t_i ∈ r(R)$ - rad/tuppel i tabellforekomsten
- $t_i[A]$ - radens verdi for attributtet A
- $X ⊆ R$ - en delmengde av attributtene i R


{% include mathjax.html %}
{% include gotop.html %}
