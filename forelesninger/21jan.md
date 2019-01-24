---
title: Forelesning 21. januar
---

# Forelesning 21. januar - Relasjonsdatabasemodellen + oversetting fra ER

---

## Hundedatabasen
- Kort sagt, vi fyller inn data på en logisk flat måte for å representere data.

## ER -> RelasjonsDB
### 1: Regulære entitetstyper (ikke svake)

Eks: Person(__Pnr__, Navn, Gatenavn, Gatenr)

Her er alt som er i _fet skrift_ nøkkel-attributt

### 2: Svake entitetstyper

Entitetstyper som mangler en egen nøkkel, men blir identifisert gjennom relasjoner (svake entitetstyper)

Eks: Ordrelinje(__OrdreNr, LinjeNr__, Antall, Pris)

Her er OrdreNr en delvisnøkkel sammen med LinjeNr. Altså vi "låner" nøkkelen fra Ordre entiteten for å identifisere Ordrelinje entitetene.

### 3: Binære 1:1-relasjonsklasser
- Legger til en fremmednøkkel i en av tabellene eller lager en egen koblingstabell
- Velger ofte den løsningen som gir minst NULL-verdier.

### 4: Binære 1:N-relasjonsklasser
Legg merke til at:
1. Fremmednøkkelen EierPnr i Hund-tabellen kan ikke ha NULL-verdi
2. HundRegnr må være primærnøkkel i HundeEier-tabellen
3. Fremmednøkkelen EierPnr i HundeEier-tabellen kan ikke ha NULL-verdi

Kan ofte 'lage' en til tabell for å unngå flest mulige NULL-verdier, men dette kan ofte øke kompleksiteten.

### 5: Binære N:M-relasjonsklasser
Legg merke til at:
1. HundRegnr og OfferPnr (sammen) må være primærnøkkel i HundeEier-tabellen

### 6: Fler-verdi-attributter
Legg merke til at:
1. Pnr og TlfNr (sammen) som primærnøkkel betyr at flere kan dele samme telefonnr
2. TlfNr som primærnøkkel betyr en (eller ingen) person per telefonnr
3. Pnr som primærnøkkel ville bety kun ett telefonnr per person (ikke fler-verdi)

Fler-verdiatrbiutt må (vanligvis) håndteres i en egen tabell, med en fremmednøkkel til entitetstabellen.

Det kan være flere muligheter når det gjelder nøkkel i denne fler-verdi-attributt-tabellen.

### 7: N-ære relasjonsklasser ($$N > 2$$)
Legg merke til at:
1. LID, PID og VID (sammen) må være primærnøkkel i Leveranse-tabellen.

### 8: Mapping av spesialisering
Dårlig støtte i ER-diagrammer. Kan gjøres på mange måter, den beste løsningen kommer veldig an på spesialiseringen.

## Forelesning / Pensum
- Nå er vi ferdig med ER
  - Pensum fra kapittel 3 og 4.1-4.3
  - Kommer tilbake til _kategorier_ senere (4.4)
- Relasjonsdatabasemodellen
  - Ferdig med pensum fra kapittel 5
- Oversetting fra ER til R-DB
  - Oversetting fra standard ER og spesialisering/generalisering er ferdig
  - Oversetting av kategorier tas senere
- Torsdag 24. vil vi starte på _relasjonsalgebra_
  - kapittel 8.1 og 8.2



{% include mathjax.html %}
{% include gotop.html %}
