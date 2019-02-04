---
title: Forelesning 28. januar
---

# Forelesning 28. januar - Relasjonsalgebra del 2

---

## Q: Bilder tatt av fotografen Wilse
- Det finnes mange algebratrær som gir samme resultat.

## EQUIJOIN
- Kombinerer rader basert på likhet
  - Ett eller flere par av kolonner (Fra hver sin operandtabell)
- Filtrerer vekk rader som ikke matcher
- Alltid ett eller flere par kolonner med like verdier

## Naturlig join
- Som EQUIJOIN, men
  - $\*$ som operatorsymbol
  - _Implisitt_ join-betingelse
    - likhet i alle par av kolonner med like navn
  - Fjerner alle "duplikatkolonner"
- Tilsvarer
  - Kartesisk produkt + seleksjon + projeksjon
- Risiko
  - Kan bli en "større" join-betingelse enn man ønsker
  - Ved endringer i operand-tabellene kan join-betingelsen endre seg.

## Omdøping og sortering
- Omdøpingoperator
  - ρ (rho)
  - Nye navn p åtabell og kolonner
- Sorteringsoperator
  - Stigende (ASC)
  - Synkende (DESC)

## Aggregering / gruppering
- Aggregeringsoperatorer
  - SUM(<attributt>), AVG(), MIN(), MAX(), ...
  - COUNT()
    - count(<attributt>) - antall verdier, unntatt NULL
    - count(distinct <attributt>) - antall unike verdier, unntatt NULL
    - count(\*) - antall rader
- Gruppering
  - Grupperingsattributtene definerer en _partisjonering_ av radene i tabellforekomsten
  - Aggregeringen gjøres over radene i hver partisjon som hver bidrar til en rad i resultattabellen
  - Uten grupperingsattributter aggregeres det over alle radene i tabellen.


## Outer-join-operatorer
- Får med alle rader i en eller begge operand-tabellene
  - Left outer join
  - Right outer join
  - Full outer join
- Filterer ikke bort rader slik som inner-join-operatorer
- Attributter som "mangler data" får NULL-verdier

## RA kan uttrykke restriksjoner
- Entitetsintegritet
- Referanseintegritet
- Maks 10 offer for en hund

## Lesetips
- Vi er nå ferdig forelest for kapitlene:
  - Kapittel 5 om relasjonsmodellen
    - 5: The relational Model and Relational Database Constraints, side 149-170
  - Kapittel 8 om relasjonsalgebra
    - The Relational Algebra and Calculus, 8.1-8.5, side 239-264 untatt 8.4.3 Recursive Closure Operations og 8.4.5 the OUTER UNION Operation
- Starter nå på kapittel 6 Basic SQL

{% include mathjax.html %}
{% include gotop.html %}
