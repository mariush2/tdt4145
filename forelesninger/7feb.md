---
title: Forelesning 7. februar
---

# Forelesning 7. februar - Normaliseringsteori

---

## Terminologi
- $R(A,B,C)$ - skjema for tabellen
- $r(R)$ - tabellforekomsten
- $t_i ∈ r(R)$ - rad/tuppel i tabellforekomsten
- $t_i[A]$ - radens verdi for attributtet A
- $X ⊆ R$ - en delmengde av attributtene i R

## Restriksjoner
- _Databasetilstand_ - Database-forekomsten (dataene) på en gitt tid
- _Databasetilstand_ er _konsistent_ når alle reglene i miniverdenen er oppfylt
- Restriksjoner begrenser hvilke data som kan finnes i en konsistent databasetilstand.
- _Inherent constraints_ - Som er en del av datamodellen og håndheves av DBMS (også kalt implicit constraint)
  - Eksempel: Ikke to like rader
- _Explicit constraints_ - Som kan uttrykes i datamodellen (databaseskjemaet). Håndheves av DBMS
  - Eksempel: Primærnøkkel, fremmednøkkel
- _Applikasjonsbaserte restriksjoner_ ("business rules") - Som må håndteres utenfor datamodellen (dvs. av applikasjonsprogrammene)
  - Eksempel: Ingen kan tjene mer enn sjefen

## Restriksjoner (2)
- En delmengde av alle restriksjoner kan uttyrkkes som _funksjonelle avhengigheter_ (functional dependencies)
  - Grunnlaget for viktige _designregler_
- $StudNr \longrightarrow StudNavn$
  - Alle rader som har samme verdi for StudNr må ha samme verdi for StudNavn
  - Det er bare ett StudNavn knyttet til et StudNr
  - Dette er en _strek sammenheng_ mellom attributter
  - Men det kan være flere StudNr som har samme StudNavn så $StudNavn \longrightarrow StudNr$ gjelder ikke

## Funksjonelle avhengigheter
- $X \longrightarrow Y$, $Y \subseteq R$ uttrykker en __restriksjon__ på alle lovlige tabellforekomster:
  - Alle tupler $t_i$ og $t_j$, i en forekomst $r(R)$
    - som har samme verdier for attributtene i $X$
      - $t_i[X] = t_j[X]$
    - _må_ ha samme verdier for attributtene i $Y$
      - $t_i[Y] = t_j[Y]$
- Eksempler:
  - $Regnr \longrightarrow Navn, Rase, Får, EierPnr$
  - $Regnr, Pnr \longrightarrow Antall$

| A | B | C |
|---|---|---|
| a1| b1| c1|
| a1| b1| c2|
| a1| b2| c3|

$$A \longrightarrow B : Nei!$$

$$t_1[A] = t_3[A] = b_1$$

men

$$t_1[B] \neq t_3[B]$$

---

$$B \longrightarrow A : Går fint$$

- Konklusjonen: Det er plausibelt, men vi vet ikke. _kanskje_

---

$$AC \longrightarrow B : kanskje$$

---

$$A \longrightarrow A : Trivielt$$

---

$$ABC \longrightarrow ABC : Det samme som forrige$$

---

## Utledningsregler

- IR-1 (reflexive): $Hvis Y ⊆ X$, så $X \longrightarrow Y$
- IR-2 (augmentation): $\{X \longrightarrow Y\}$, gir $XZ \longrightarrow YZ$
- IR-3 (transitive): $\{X \longrightarrow Y, Y \longrightarrow Z\}$, gir $X \longrightarrow Z$
- IR-4 (decomoposition): $\{X \longrightarrow YZ\}$, gir $X \longrightarrow Y$
- IR-5 (additive): $\{X \longrightarrow Y, X \longrightarrow Z\}$, gir $X \longrightarrow YZ$
- IR-6 (pseudotransitive): $\{ X \longrightarrow Y, WY \longrightarrow Z\}$, gir $WX \longrightarrow Z$

$X, Y, Z, W \subseteq R$ (mengden av alle attributter)

IR-1 + IR-2 + IR-3 kalles _Armstrongs aksiomer_ og er tilstrekkelig for å utlede alle funksjonelle avhengigheter fra et gitt utgangspunkt (en mengde funksjonelle avhengigheter).


## Tillukningen til en mengde FD-er
- F er en mengde funskjonelle avhengigheter
- $F^+ = \{X \longrightarrow Y | X \longrightarrow Y kan utledes fra FD-ene i F \}$
  - Opplisting av alle FD-er som gjelder når vi har F.
  - Merk: $F$ og $F^+$ uttrykker akkurat samme restriksjon
- $F^+$ inneholder mange _trivielle_ funksjonelle avhengigheter
- Krevende å bergne, men heldigvis sjelden interessant

## Tillukningen til en mengde attributter
- Anta R og F, $X \subseteq R$
- $X^+ = \{Y \in R | X \longrightarrow Y \in F^+ \}$
  - Alle attributter som er funksjonelt avhengig av X
  - $X \longrightarrow X^+$

```julia
X^+ = X;
repeat
  oldX^+ = X^x
  for each Y ⟶ Z ∈ F do
    if Y ⊆ X^+ then
      X^+ = X^+ ∪ Z;
untill X^+ = oldX^+;
```

## Supernøler og nøkler
- En __supernøkkel__ for en tabell R er en mengde attributter S slik at:
  - Det ikke i noen forekomst av tabellen kan finnes to tupler, $t_i$ og $t_j$, med samme verdier for S
  - Supernøkkelen vil være en _unik identifikator_ for tabellen.
- En __nøkkel__ K er en _minimal_ supernøkkel
  - Vi kan ikek fjerne noe attributt fra K og fortsatt ha en supernøkkel.
  - Alle nøkler er supernøkler, noen supernøkler er nøkler.

{% include mathjax.html %}
{% include gotop.html %}
