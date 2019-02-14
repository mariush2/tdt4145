---
title: Forelesning 11. februar
---

# Forelesning 11. februar - Normaliseringsteori, andre del

---

## Huskelapp
- Funksjonell avhengigheter
- Supernøkkel (S):
  - Unik identifikator for rad, $S^+ = R$
- (Kandidat-)Nøkkel (K):
  - Minimal supernøkkel:
    - $K^+ = R$, ingen ekte delmengde av K har denne egenskapen
- Primærnøkkel
  - Velges blant N kandidatnøkler ($N \geqq 1$)

## Nøkkel- og ikke-nøkkel-attributter
- _Nøkkelattributt_ (eng: prime)
  - Attributter som inngår i en eller flere kandidatnøkler
- _Ikke-nøkkelattributt_ (nonprime)
  - Attributter som ikke inngår i noen kandidatnøkkel
- Partisjonerer attributtene i en tabell i 2 deler

## Normalformer
- Regler som stiller stadig strengere krav til tabeller
  - Sikrer at vi har tabeller som unngår uheldige egenskaper
- __Første normalform__ (1NF)
  - Attributtenes domener inneholder atomiske (udelelige) verdier
  - Verdien til et attributt er en enkelt verdi fra domenet
  - Sikrer "flate, 2 dimensjonale tabeller"
  - Unngår sammensatte attributter, flere verdier og nøstede tabeller
  - NB! Det finnes tabeller som ikke er på 1NF - NON-1NF
- Alle høyere normalformer forutsetter 1NF
- Alle tabeller på 2NF er på 1NF, alle på 3NF er på 2NF

## Full Funksjonell avhengigheter
- En funksjonell avhengighet
  - $X \longrightarrow Y$
- er en _full_ funksjonell avhengighet hvis det er mulig å fjerne et attributt, $A \in X$, og har $(X - \{A\}) \longrightarrow Y$
- Inneholder ikke "overflødige" venstreside-attributter

## Andre normalform (2NF)
- En tabell er på andre normalform hvis og bare hvis
  - Det ikke finnes noen ikke-nøkkel-attributter som er delvis avhengig av en kandidatnøkkel

## Å oppnå andre normalform
- Problem
  - bokTittel henger "tettere sammen" med bokID enn med hele kandidatnøkkelen
- Løsning
  - Splitte i to tabeller
- bok og nye utlån er begge på 2NF
- Har fjernet kilde til redundans (delvis avhengighet av nøkkel)

## Tredje normalform (3NF)
- En tabell er på __tredje normalform__ hvis og bare hvis det for alle funksjonelle avhengigheter på formen, $X \longrightarrow A$, som gjelder for tabellen er slik at:
  - X er en supernøkkel i tabellen, eller
  - A er et nøkkelattributt i tabellen
- Husk: $X ⟶ BCD$, utleder $X ⟶ B; X ⟶ C; X ⟶ D$

## Å oppnå tredje normalform
- Problem
  - $postNr ⟶ postSted$ er en kilde til redundans
- Løsning
  - Splitte i to tabeller
- Begge tabeller er på 3NF
- Har fjernet kilde til redundans (f.a. mellom ikke-nøkkel-attributt)
- Men inter-tabell f.a.
- Alternativ løsning er å splitte i person og post tabeller.
  - Da unngår vi inter-tabell f.a.

## Boyce-Codd normalform
- 3NF kan ha redundansproblemer ved overlappende kandidatnøkler
- En tabell er på __Boyce-Codd normalform__ (BCNF) hvis og bare hvis det for alle funksjonelle avhengigheter på formen, $X ⟶ Y$, som gjelder for tabellen er slik at:
  - X er en supernøkkel i tabellen
- Alle venstresider i f.a.-er må altså være supernøkler

## Å oppnå BCNF
- Problem
  - $pID ⟶ Snr$ og $Snr ⟶ pID$ er kilder til redundans, selv om tabellen er på 3NF
- Løsning
  - Splitte i to tabeller
- Begge er på BCNF
- Har fjernet kilde til redundans (avhengighet inne blant kandidatnøklene)

## Relasjonsdatabasedesign
- Analyse
  - Top-down tilnærming
  - Starter alltid med en tabell
  - Bruker normalformer kriteriene og dekomponerer
- Syntese
  - Bottom-up tilnærming
  - Lager en algoritme som løser dette for oss
  - Setter inn f.a. også kommer en database ut

## Kriterier

##### Normalform
  - Ser på hver enkelt tabell (projeksjon) for seg
##### Attributtbevaring
  - Kan lagre det samme
##### Bevaring av funksjonelle avhengigheter
  - Beholde samme restriksjoner, enkelt
##### Tapsløs sammenstilling til utgangspunktet
  - Ikke skape "falske data"


### Attributtbevaring
- Alle attributter i R må finnes i minst en av projeksjonene
- Kan lagre de samme dataene

### Bevaring av funksjonelle avhengigheter
- F representerer en restriksjon på alle tabellforekomster av R
  - Må ivaretas i tabellene i dekomponeringen
- Mål:
  - Alle funksjonelle avhengigheter i F skal finnes i en eller flere $R_i$-er eller kunne tuledes fra f.a.-ene som gjelder i $R_i$-ene.
- Ellers vil vi få inter-tabell-avhengigheter som vi må joine for å sjekke.

### FD-bevaring: Definisjon
- __Projeksjonen__ av F på $R_i (R_i \subseteq R)$

$$\Pi_{R_i}(F) = \{X \longrightarrow Y ∈ F^+ | X \cup Y \subseteq R_i\}$$

- En dekomponering av $R$, $D = \{R_1, R_2, R_m\}$, er __avhengighetsbevarende__ mht. F hvis:

$$(\Pi_{R_1}(F) ∪ \Pi_{R_2}(F) ∪ … ∪ \Pi_{R_m}(F))^+ = F^+$$

### Tapsløst-join-egenskapen
- En dekomponering av $R$, $D = \{R_1, R_2, R_m\}$, har tapløst-join-egenskapen hvis det for alle forekomster $r(R)$ som oppfyller $F$, er slik at:

$$(\Pi_{R_1}(r), \Pi_{R_2}(r), \dotsm \Pi_{R_m}(r)) = r$$

- Tapløst-join = ikke-adderende-join

### Sjekke T-J-egenskapen
- En dekomponering av $R$, $D  = \{R_1, R_2\}$, har tapløst-join-egensapen hvis:

$$R_1 \cap R_2 \longrightarrow R_1 \:\:eller\:\: R_1 \cap R_2 \longrightarrow R_2$$

- Komponent-tabellenes felles attributter er supernøkkel for en eller begge komponenttabellene
- NB! Dette er ikke "hvis og bare hvis", kan være for konservativ.

{% include mathjax.html %}
{% include gotop.html %}
