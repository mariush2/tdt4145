---
title: Forelesning 14. januar
---

# Forelesning 14. januar - Datamodellering med ER-modeller

---

## Oppsummering fra sist torsdag
- Miniverden med relasjoner mellom de forskjellige entitetsklassene.
- Strukturell restriksjon - (1,1) en hund kan ha 1 og bare 1 eier.
- Klassene får attributter som sier noe om egenskapene til entiteter i klassen
- En nøkkelrestriksjon som identifiserer entitetsklassene fra hverandre (Skiller mellom de).

## På forekomstnivå
- Forteller oss om hvordan en reel 'versjon' av en ER-modell vil se ut.

## Rekursive relasjonsklasser
- Relasjonsklasser der samme entitetsklasse deltar flere ganger.

```javascript
person = {Harald, Sonja, Erna, Siv, Trine}
regforhold = {(Harald, Sonja)}
sjeffor = {(Harald, Erna), (Erna, Siv), (Erna, Trine)}
```
Her kan vi se et eksempel på hvordan de rekursive relasjonsklassene vil fungere på forekomstnivå.

## Svake entitetsklasser
- Når en entitetsklasse mangler en "naturlig" nøkkel, kan den av og til identifiseres gjennom en relasjon til en annen entitetsklasse
- Navn (i Gate) + KNr må identifisere Gate
- Alternativet er å legge til en nøkkel (unik identifikator) og modellere den som en ordinær entitetsklasse.

## Designprosess
- Finn entitetklasser, kanskje noen viktige attributter
- Finn relasjonsklasser (med navn)
- Kompletter modellen med alle attributter, nøkler og andre restriksjoner
- Vurder modellen
  - Oppfylles kravene (den antatte bruken)?
  - Er det relasjonsklasser som burde vært entitetsklasser eller omvendt?
  - Er det relasjonsklasser som burde vært splittet i flere eller slått sammen?
  - Er det attributter som burde vært entietsklasser eller entitetklasser som burde vært attributter?


{% include mathjax.html %}
{% include gotop.html %}
