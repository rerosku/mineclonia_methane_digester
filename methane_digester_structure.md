# 📁 Struttura File Corretta - Methane Digester

## 📦 File da Creare

### 📂 Struttura Cartelle
```
methane_digester/
├── init.lua                    # ✅ File principale (PRONTO)
├── mod.conf                    # ✅ Configurazione (PRONTO)  
├── README.md                   # ✅ Documentazione (PRONTA)
└── textures/                   # 🎨 Da creare (6 texture)
    ├── methane_digester_top.png
    ├── methane_digester_front.png
    ├── methane_digester_side.png
    ├── methane_digester_back.png
    ├── methane_digester_bottom.png
    └── biogas_bottle.png
```

## 📋 Procedura di Installazione

### 1. **Crea Cartella Principale**
```bash
# Nella directory mods/ di Luanti
mkdir methane_digester
cd methane_digester
```

### 2. **Salva File Principali**

#### `init.lua`
- Copia il codice dal primo artifact (**init.lua - File Principale**)
- È il file completo con tutto il sistema del digestore
- Include: logica decomposizione, GUI, alimentazione fornaci, imbottigliamento

#### `mod.conf`  
- Copia il contenuto dal secondo artifact (**mod.conf**)
- Configurazione base della mod
- Dipendenze e metadati

### 3. **Crea Cartella Texture**
```bash
mkdir textures
cd textures
```

### 4. **Genera le 6 Texture**
Usa i **prompt AI** forniti negli altri artifact per creare:

#### Texture Principali (16x16 pixel PNG):
1. **`methane_digester_top.png`** - Vista dall'alto con cupola gas verde
2. **`methane_digester_front.png`** - Fronte con pannello controllo e display
3. **`methane_digester_side.png`** - Lati del cilindro metallico
4. **`methane_digester_back.png`** - Retro con tubi di collegamento
5. **`methane_digester_bottom.png`** - Base con supporti strutturali
6. **`biogas_bottle.png`** - Bottiglia con biogas verde (item)

## 🔧 Configurazione e Test

### Attivazione Mod
1. **Avvia Luanti**
2. **Seleziona Mondo** → Configura → Mod
3. **Trova "Methane Digester"** nell'elenco
4. **Abilita** e salva
5. **Riavvia** il mondo

### Test Rapido
```bash
# In-game crafting test:
/give [player] mcl_core:iron_ingot 4
/give [player] mcl_core:glass 1
/give [player] mcl_cauldrons:cauldron 1
/give [player] mcl_core:cobble 2
/give [player] mcl_core:redstone 1

# Craft il digestore e testa
```

## 📊 Materiali Organici Supportati (AGGIORNATI)

### 🌾 **Categorie Complete (senza coniglio)**

#### Verdure e Frutti (7 tipi)
- Carota - 50 RF (5 min)
- Patata - 60 RF (6.7 min)  
- Barbabietola - 40 RF (4.2 min)
- Grano - 30 RF (3.3 min)
- Fetta Anguria - 25 RF (3 min)
- Zucca - 100 RF (10 min)
- Mela - 45 RF (4.2 min)

#### Carne e Pesce (7 tipi)
- Braciola Maiale - 150 RF (13.3 min) ⭐⭐⭐⭐⭐
- Pollo Cotto - 120 RF (10 min) ⭐⭐⭐⭐
- Salmone Cotto - 90 RF (7.5 min) ⭐⭐⭐⭐
- Pesce Cotto - 80 RF (6.7 min) ⭐⭐⭐
- Salmone Crudo - 70 RF (5.8 min) ⭐⭐⭐
- Pesce Crudo - 60 RF (5 min) ⭐⭐⭐
- Carne Marcia - 20 RF (1.7 min) ⭐

#### Fiori e Piante (6 tipi)
- Erba Alta - 15 RF (2 min)
- Felce - 20 RF (2.5 min)
- Allium - 25 RF (3.3 min)
- Margherita - 22 RF (3 min)
- Peonia - 30 RF (3.7 min)
- Rampicante - 35 RF (5 min)

#### Foglie (6 tipi)
- Foglie Quercia - 35 RF (4.2 min)
- Foglie Betulla - 33 RF (4 min)
- Foglie Abete - 38 RF (4.7 min)
- Foglie Tropicali - 36 RF (4.3 min)
- Foglie Acacia - 34 RF (4.25 min)
- Foglie Scure - 37 RF (4.5 min)

#### Funghi e Altri (12 tipi)
- Fungo Marrone - 40 RF (3 min)
- Fungo Rosso - 40 RF (3 min)
- Semi Zucca - 20 RF (2.5 min)
- Semi Anguria - 18 RF (2.3 min)
- Semi Barbabietola - 15 RF (2 min)
- Pane - 55 RF (5.8 min)
- Biscotto - 35 RF (3.3 min)
- Torta Zucca - 70 RF (6.7 min)
- Zuppa Funghi - 65 RF (5 min)
- Cespuglio Secco - 12 RF (1.5 min)
- Canne Zucchero - 22 RF (2.7 min)
- Fave Cacao - 28 RF (3 min)

**Totale: 40+ materiali organici supportati**

## ⚡ Specifiche Tecniche

### Sistema Energetico
- **Accumulo**: Illimitato biogas storage
- **Consumo fornace**: 40 RF per operazione
- **Imbottigliamento**: 100 RF per bottiglia
- **Range alimentazione**: 6 blocchi adiacenti al digestore

### Fornaci Supportate
- ✅ Fornace Standard (`mcl_furnaces:furnace`)
- ✅ Forno Fusorio (`mcl_blast_furnace:blast_furnace`)
- ✅ Affumicatore (`mcl_smoker:smoker`)

### Performance
- **Timer globale**: 1 secondo per decomposizione
- **Alimentazione fornaci**: Ogni 5 secondi
- **Range giocatore**: 50 blocchi per efficienza
- **Memory friendly**: Ottimizzato per server

## 🎨 Texture Requirements

### Specifiche Tecniche
- **Formato**: PNG con trasparenza
- **Dimensioni**: Esattamente 16×16 pixel
- **Stile**: Pixel art industriale
- **Antialiasing**: DISABILITATO
- **Colori**: Palette industriale metallica

### Palette Colori Principale
```
# Metalli
Dark Grey: #424242    (Struttura principale)
Medium Grey: #616161  (Dettagli)
Light Grey: #9e9e9e   (Highlights)
Steel Blue: #607d8b   (Componenti tecnici)

# Biogas  
Biogas Green: #8bc34a (Gas principale)
Dark Green: #689f38   (Gas concentrato)

# Tecnici
Red Alert: #f44336    (Valvole/allarmi)
Green Status: #4caf50 (LED operativi)
Blue Display: #2196f3 (Display digitali)
```

## ✅ Checklist Pre-Lancio

### File Check
- [ ] `init.lua` salvato correttamente
- [ ] `mod.conf` configurato
- [ ] Cartella `textures/` creata
- [ ] 6 texture generate e salvate
- [ ] Nomi file texture corretti

### Test Funzionalità  
- [ ] Mod si carica senza errori
- [ ] Ricetta crafting funziona
- [ ] Digestore si piazza correttamente
- [ ] GUI si apre (click destro)
- [ ] Materiali organici accettati
- [ ] Decomposizione inizia automaticamente
- [ ] Biogas si accumula correttamente
- [ ] Fornaci adiacenti si alimentano
- [ ] Imbottigliamento funziona
- [ ] Bottiglie bruciano come combustibile

### Logs da Verificare
```bash
# Log attesi all'avvio:
[Methane Digester] Mod inizializzata correttamente
[Methane Digester] Materiali organici supportati: 40
[Methane Digester] Sistema alimentazione fornaci attivo
[Methane Digester] Sistema imbottigliamento biogas attivo
```

## 🚀 Pronto per l'Uso!

Una volta completati questi passaggi, avrai un **sistema completo di bioenergia** che include:

✅ **40+ materiali organici** processabili  
✅ **Decomposizione realistica** graduale  
✅ **Alimentazione automatica** fornaci  
✅ **Sistema imbottigliamento** biogas  
✅ **GUI avanzata** informativa  
✅ **Design 3D realistico** del digestore  
✅ **Compatibilità completa** MineClonia  
✅ **Performance ottimizzate** per server  

**Il Methane Digester è pronto per trasformare la gestione energetica del tuo mondo MineClonia!** 🌱⚡