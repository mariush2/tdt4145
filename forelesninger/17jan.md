---
title: Forelesning 17. januar
---

# Forelesning 17. januar - Introduksjon til relasjonsdatabaser

---

## Enhanced ER (EER)
- Standard ER, pluss
  - Støtte for spesialisering/generalisering
    - Subklasser/superklasser
  - Entitetsklasser med entiteter fra ulike E.-klasser
    - Kategorier (union-typer)
  - Arving
    - Relasjonsklasser og attributter
- Pensum
  - spesialisering/generalisering: 4.1-4.3
  - Kategorier: 4.4 (venter en stund med dette)

## Spesialisering/generalisering
- Spesialisering
  - Å definere en mengde subklasser (underklasser) for en entitetsklasse (superklasse)
- Generalisering
  - Samling av entitetsklasser med felles egenskaper som subklasser under en (felles) superklasse (overklasse)
- De _felles_ egenskapene modelleres på superklassen
- Det som er _unikt_ for en subklasse, modelleres på subklassen

## Notasjon m.m
- En entitet i en subklasser er alltid en entitet i superklassen
  - Men har en spesiell _rolle_
- Entiteter i subklasser:
  - Arver alle superklassens attributter og relasjoner
- Subklassene kan ha egne
  - Attributter
  - Relasjonsklasser
- Entiteter må ikke være med i en subklasse, men det kan være et krav

## Relasjonsdatabaser
- Skjema ("intention") beskriver
  - Tabellnavn
  - Kolonner (attributter)
  - Kolonnenes datatyper
  - Restriksjoner
    - Primærnøkkel (entydig identifikator) m.fl
- Forekomst av data ("extention")
  - Rader / tuppler med lovlige verdier
- NULL-verdi
  - Der vi ikke har noen verdi (ukjent eller mangler)
- Fremmednøkkel
  - Verdi som viser til en rad (tuppel) i en annen tabell (eventuelt samme)
- Standard relasjonsdatabaser har
  - Atomiske verdier i domenene
  - En verdi for hvert attributt (i en rad)
  - Dette gir oss "flate, 2-dimensjonale tabeller"
- Ikke-standard relasjonsdatabaser kan ha
  - Sammensatte attributter, repeterende grupper (fler-verdi-attributter)
- Entitetsintegritet
  - Kan ikke ha 2 like rader, tillater derfor ikke NULL-verdier i primærnøkkel (som kan bestå av flere attributter)
- Referanseintegritet
  - Fremmednøkler må referere til en rad (tuppel) som finnes eller bare bestå av NULL-verdi(er)



{% include mathjax.html %}
{% include gotop.html %}
