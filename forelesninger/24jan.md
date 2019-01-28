---
title: Forelesning 24. januar
---

# Forelesning 24. januar - Relasjonsalgebra

---

## Relasjonsalgebra
- Operatorer for _manipulere_ tabeller:
  - Vi ser kun på spørrefunksjonalitet, ikke innsetting, endring eller sletting
  - Viktig grunnlag for å forstå hva man kan gjøre med tabeller, for normaliseringsteorien og for spørreoptimalisering og spørreutføring
- Husk: Tabellforekomster er mengder av tuppler
- Operatorene er _lukket_ over tabeller:
  - Operanden(e) er tabell(er), resultatet er en tabell
- _Mengdeoperatorer:_
  - Union, Snitt, mengdedifferanse (minus), kartesisk produkt...
- _Spesielle operatorer:_
  - Seleksjon, projeksjon, join-operatorer, ...

## Seleksjon
- Velger ut rader (tuppler) som oppfyller en logisk betingelse
  - Sammenligningsoperatorer + logiske konnektiver + parenteser
- Merk: Resultat-tabellen har samme skjema som operand-tabellen

## Projeksjon
- Tar med kolonnene (attributtene) i attributtlisten
- Resultat-tabellen får nytt skjema
- Fjerner duplikater i resultat-tabellen

## Kombinerer operatorer
- Q: Finn navn på alle pudler

## Union, Snitt og Differanse
- Kun mellom _union-kompatible_ tabeller
  - Samme _grad_ - det vil si like mange kolonner (attributter)
  - _Korresponderende_ kolonner er definert over samme dataype (domene)

## Katresisk produkt (X)
- Kombinerer alle tuppler i den ene tabellen med alle tuppler i den andre tabellen
- Resultat-tabellen får alle kolonner fra den første tabellen og alle kolonner fra den andre
- Har operand-tabellene henholdsvis $r$ og $s$ tuppler, vil resultat-tabellen ha $r*s$ tuppler

## JOIN - kritisk sammenstilling
- Kartesisk produkt er _ukritisk_ sammenstilling
  - Alle rader kombineres med alle rader
  - Store resultat-tabeller
- __JOIN__-operatorer kombinerer _relaterte_ rader
  - Radene i resultat-tabellen oppfyller en _join-betingelse_
- __EQUIJOIN__ - basert på likhet, kan ha generaliserte join-betingelser.


{% include mathjax.html %}
{% include gotop.html %}
