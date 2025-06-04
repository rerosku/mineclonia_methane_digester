# 🎨 Guida Texture - Methane Digester

## 📋 Lista Texture Necessarie

### Digestore (6 texture)
- `methane_digester_top.png` - Vista dall'alto con cupola gas
- `methane_digester_bottom.png` - Base con supporti
- `methane_digester_side.png` - Lati del cilindro principale
- `methane_digester_front.png` - Fronte con pannello controllo
- `methane_digester_back.png` - Retro con tubi
- `biogas_bottle.png` - Bottiglia di biogas (item)

## 🎨 Specifiche Design

### Palette Colori

#### Metallo Industriale
```
Grigio Scuro:      #424242 (66, 66, 66)
Grigio Medio:      #616161 (97, 97, 97)  
Grigio Chiaro:     #9e9e9e (158, 158, 158)
Acciaio:           #607d8b (96, 125, 139)
```

#### Elementi Tecnici
```
Verde Circuito:    #4caf50 (76, 175, 80)
Rosso Allarme:     #f44336 (244, 67, 54)
Giallo Energia:    #ffc107 (255, 193, 7)
Blu Display:       #2196f3 (33, 150, 243)
```

#### Biogas
```
Verde Gas:         #8bc34a (139, 195, 74)
Verde Scuro:       #689f38 (104, 159, 56)
Trasparenza:       #80ffffff (128, 255, 255, 255)
```

## 🖌️ Design Specifiche

### `methane_digester_top.png`
```
Descrizione: Vista dall'alto del digestore
Elementi:
- Cupola centrale del gas (verde scuro)
- Valvola di sicurezza al centro
- Bordo metallico del cilindro
- Tubi di ingresso/uscita visibili sui lati
- Dettagli industriali e bulloni

Design Pattern:
┌─────────────────┐
│■■■■■■■■■■■■■■■■│ ← Bordo metallico
│■▓▓▓▓▓▓▓▓▓▓▓▓▓■│ ← Coperchio
│■▓░░░███░░░░░▓■│ ← Cupola gas
│■▓░░█▓▓▓█░░░▓■│ 
│■▓░░█▓V▓█░░░▓■│ ← V = Valvola
│■▓░░█▓▓▓█░░░▓■│
│■▓░░░███░░░░░▓■│
│■▓▓▓▓▓▓▓▓▓▓▓▓▓■│
│■■■■■■■■■■■■■■■■│

Colori:
■ = #424242 (grigio scuro)
▓ = #616161 (grigio medio)
░ = #8bc34a (verde gas)
█ = #607d8b (acciaio)
V = #f44336 (valvola rossa)
```

### `methane_digester_front.png`
```
Descrizione: Fronte con pannello di controllo
Elementi:
- Cilindro principale metallico
- Pannello di controllo nella parte bassa
- Display digitale con indicatori
- Luci di stato (LED)
- Tubo di ingresso laterale
- Dettagli industriali

Design Pattern:
┌─────────────────┐
│■■■■■■■■■■■■■■■■│ ← Bordo superiore
│■▓▓▓▓▓▓▓▓▓▓▓▓▓■│ ← Cilindro
│■▓░░░░░░░░░░░▓■│
│■▓░░░░░░░░░░░▓■│ ← Tank principale
│■▓░░░░░░░░░░░▓■│
│■▓▓▓▓▓▓▓▓▓▓▓▓▓■│
│■█████████████■│ ← Pannello controllo
│■█▓▓B▓▓█G█R█▓■│ ← B=display, G/R=LED
│■■■■■■■■■■■■■■■■│ ← Base

Colori:
■ = #424242 (grigio scuro)
▓ = #616161 (grigio medio)
░ = #9e9e9e (interno tank)
█ = #607d8b (pannello)
B = #2196f3 (display blu)
G = #4caf50 (LED verde)
R = #f44336 (LED rosso)
```

### `methane_digester_side.png`
```
Descrizione: Lato del cilindro
Elementi:
- Superficie cilindrica liscia
- Rinforzi strutturali orizzontali
- Supporti di montaggio
- Piccoli dettagli tecnici
- Texture metallica industriale

Design Pattern:
┌─────────────────┐
│■■■■■■■■■■■■■■■■│
│■▓▓▓▓▓▓▓▓▓▓▓▓▓■│
│■▓░░░░░░░░░░░▓■│
│■▓░░░░░░░░░░░▓■│
│■████████████■│ ← Rinforzo centrale
│■▓░░░░░░░░░░░▓■│
│■▓░░░░░░░░░░░▓■│
│■▓▓▓▓▓▓▓▓▓▓▓▓▓■│
│■■■■■■■■■■■■■■■■│
```

### `methane_digester_back.png`
```
Descrizione: Retro con collegamenti
Elementi:
- Cilindro principale
- Tubi di collegamento
- Valvole e raccordi
- Supporti strutturali
- Elementi di manutenzione

Design Pattern:
┌─────────────────┐
│■■■■■■■■■■■■■■■■│
│■▓▓▓▓▓▓▓▓▓▓▓▓▓■│
│■▓░░░░░░░░░░░▓■│
│■▓░░░██░░██░░▓■│ ← Raccordi tubi
│■▓░░░██░░██░░▓■│
│■▓░░░░░░░░░░░▓■│
│■▓▓▓▓▓▓▓▓▓▓▓▓▓■│
│■■█■■█■■█■■█■■│ ← Supporti base
│■■■■■■■■■■■■■■■■│
```

### `methane_digester_bottom.png`
```
Descrizione: Base con fondamenta
Elementi:
- Piastra base metallica
- Supporti strutturali a croce
- Fori di montaggio
- Drenaggio e ventilazione
- Base industriale robusta

Design Pattern:
┌─────────────────┐
│■■■■■■■■■■■■■■■■│
│■▓▓▓▓▓▓▓▓▓▓▓▓▓■│
│■▓░█░░░░░░░█░▓■│ ← Supporti
│■▓░░░░░░░░░░░▓■│
│■▓░░░░███░░░░▓■│ ← Centro drenaggio
│■▓░░░░███░░░░▓■│
│■▓░░░░░░░░░░░▓■│
│■▓░█░░░░░░░█░▓■│
│■▓▓▓▓▓▓▓▓▓▓▓▓▓■│
│■■■■■■■■■■■■■■■■│
```

### `biogas_bottle.png`
```
Descrizione: Bottiglia contenente biogas
Elementi:
- Bottiglia di vetro trasparente
- Gas verde visibile all'interno
- Tappo metallico/corck
- Etichetta o marcature
- Effetto luminoso sottile

Design Pattern (item 16x16):
    ░░░░░░░░
  ░░██████░░
  ░██▓▓▓▓██░  ← Tappo
  ░█▓░░░░▓█░
  ░█▓░▓▓░▓█░  ← Gas verde
  ░█▓░▓▓░▓█░
  ░█▓░▓▓░▓█░
  ░█▓░▓▓░▓█░
  ░█▓░▓▓░▓█░
  ░█▓░▓▓░▓█░
  ░█▓░░░░▓█░
  ░██▓▓▓▓██░
  ░░██████░░
    ░░██░░
    
Colori:
░ = Trasparente
█ = #ffffff (vetro)
▓ = #8bc34a (biogas verde)
Tappo = #616161 (metallo)
```

## 🛠️ Tools Consigliati

### Software per Pixel Art
- **Aseprite** - Professionale per pixel art
- **GIMP** - Gratuito e completo
- **Pixelorama** - Specializzato pixel art gratuito
- **Paint.NET** - Semplice per Windows

### Parametri Tecnici
- **Dimensione**: 16×16 pixel esatti
- **Formato**: PNG con trasparenza
- **Antialiasing**: DISABILITATO
- **Colori**: Limitati alla palette specificata

## 🎯 Stile e Coerenza

### Obiettivi Design
1. **Industriale**: Aspetto professionale e tecnico
2. **Realistico**: Basato su veri digestori anaerobici
3. **Funzionale**: Ogni elemento visivo ha uno scopo
4. **Coerente**: Si integra con lo stile MineClonia
5. **Distintivo**: Facilmente riconoscibile in-game

### Guidelines
- Usa sempre bordi di 1 pixel per definire forme
- Mantieni contrasto alto per leggibilità
- Evita dettagli troppo piccoli per 16x16
- Usa dithering per transizioni colore
- Aggiungi highlights per effetto 3D

## ✅ Checklist Qualità

Prima della pubblicazione:
- [ ] Tutte le texture sono 16×16 pixel
- [ ] Formato PNG con trasparenza corretta
- [ ] Nomi file corrispondono al codice
- [ ] Colori rispettano la palette definita
- [ ] Contrasto sufficiente per visibilità
- [ ] Stile coerente tra tutte le texture
- [ ] Test in-game completato
- [ ] Nessun artifatto o errore visivo

## 🔍 Test Visivo

### In-Game Testing
1. Piazza il digestore in diversi ambienti
2. Testa con diversi shader/texture pack
3. Verifica visibilità a diverse distanze
4. Controlla orientamento su tutti i lati
5. Testa bottiglia di biogas nell'inventario

### Lighting Test
- Prova con luce diurna/notturna
- Verifica con torce vicine
- Controlla ombre e riflessi
- Testa in ambienti sotterranei

---

**Con queste texture il Methane Digester avrà un aspetto professionale e realistico!** 🧫⚡