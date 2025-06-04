# 🧫 Guida Completa - Methane Digester

## 📋 Introduzione

Il **Methane Digester** è un sistema avanzato di bioenergia che simula il funzionamento reale di un digestore anaerobico. Converte materiali organici di scarto in biogas utilizzabile come combustibile pulito e sostenibile.

## ⚙️ Come Funziona

### 🔄 Processo di Digestione Anaerobica
1. **Input**: Materiali organici (verdure, carne, piante)
2. **Decomposizione**: Processo graduale che simula fermentazione batterica
3. **Output**: Biogas (energia in RF) utilizzabile come combustibile

### ⚡ Sistema Energetico
- **Produzione**: Energia variabile in base al materiale (15-150 RF per item)
- **Accumulo**: Fino a quantità illimitate di biogas
- **Distribuzione**: Alimentazione automatica fornaci adiacenti
- **Trasporto**: Imbottigliamento per uso esterno

## 🏗️ Costruzione e Setup

### 🔨 Ricetta di Crafting
```
[Ferro] [Vetro] [Ferro]
[Ferro] [Caldaia] [Ferro]
[Cobble] [Redstone] [Cobble]
```

**Materiali necessari:**
- 4x Lingotto di Ferro
- 1x Vetro  
- 1x Caldaia
- 2x Pietrisco
- 1x Polvere di Redstone

### 📐 Posizionamento
1. **Posto del Digestore**: Area aperta 3×3 blocchi
2. **Fornaci Adiacenti**: Posiziona fornaci nei 6 blocchi adiacenti
3. **Accesso**: Mantieni spazio per l'accesso alla GUI
4. **Ventilazione**: Non coprire completamente (estetico)

### 🔧 Setup Iniziale
1. Piazza il digestore
2. Posiziona fornaci, forni fusori o affumicatori adiacenti
3. Apri la GUI (click destro)
4. Inserisci materiali organici nell'area input
5. Il processo inizia automaticamente

## 🥬 Materiali Organici Supportati

### 🌾 Verdure e Frutti
| Materiale | Tempo Decomp. | Energia RF | Efficienza |
|-----------|---------------|------------|------------|
| Carota | 300s (5 min) | 50 RF | ⭐⭐⭐ |
| Patata | 400s (6.7 min) | 60 RF | ⭐⭐⭐ |
| Barbabietola | 250s (4.2 min) | 40 RF | ⭐⭐ |
| Grano | 200s (3.3 min) | 30 RF | ⭐⭐ |
| Fetta Anguria | 180s (3 min) | 25 RF | ⭐⭐ |
| Zucca | 600s (10 min) | 100 RF | ⭐⭐⭐⭐ |
| Mela | 250s (4.2 min) | 45 RF | ⭐⭐⭐ |

### 🥩 Carne e Pesce
| Materiale | Tempo Decomp. | Energia RF | Efficienza |
|-----------|---------------|------------|------------|
| Braciola Maiale | 800s (13.3 min) | 150 RF | ⭐⭐⭐⭐⭐ |
| Pollo Cotto | 600s (10 min) | 120 RF | ⭐⭐⭐⭐ |
| Salmone Cotto | 450s (7.5 min) | 90 RF | ⭐⭐⭐⭐ |
| Pesce Cotto | 400s (6.7 min) | 80 RF | ⭐⭐⭐ |
| Salmone Crudo | 350s (5.8 min) | 70 RF | ⭐⭐⭐ |
| Pesce Crudo | 300s (5 min) | 60 RF | ⭐⭐⭐ |
| Carne Marcia | 100s (1.7 min) | 20 RF | ⭐ |

### 🌸 Fiori e Piante
| Materiale | Tempo Decomp. | Energia RF | Efficienza |
|-----------|---------------|------------|------------|
| Erba Alta | 120s (2 min) | 15 RF | ⭐ |
| Felce | 150s (2.5 min) | 20 RF | ⭐ |
| Allium | 200s (3.3 min) | 25 RF | ⭐⭐ |
| Margherita | 180s (3 min) | 22 RF | ⭐⭐ |
| Peonia | 220s (3.7 min) | 30 RF | ⭐⭐ |
| Rampicante | 300s (5 min) | 35 RF | ⭐⭐ |

### 🍄 Funghi e Foglie
| Materiale | Tempo Decomp. | Energia RF | Efficienza |
|-----------|---------------|------------|------------|
| Fungo Marrone | 180s (3 min) | 40 RF | ⭐⭐⭐ |
| Fungo Rosso | 180s (3 min) | 40 RF | ⭐⭐⭐ |
| Foglie Quercia | 250s (4.2 min) | 35 RF | ⭐⭐ |
| Foglie Betulla | 240s (4 min) | 33 RF | ⭐⭐ |
| Foglie Abete | 280s (4.7 min) | 38 RF | ⭐⭐ |

## 🎮 Interfaccia Utente (GUI)

### 📥 Sezione Input Materiali
- **9 slot (3×3)** per materiali organici
- **Drag & Drop** per inserire materiali
- **Info energia potenziale** mostrata in tempo reale

### 🔄 Sezione Decomposizione
- **Materiale corrente** in processo
- **Barra progresso** con percentuale
- **Tempo rimanente** stimato
- **Stato processo** (attivo/inattivo)

### ⚡ Sezione Biogas
- **RF accumulati** disponibili
- **Capacità illimitata** di storage
- **Alimentazione fornaci** in tempo reale

### 🍶 Sezione Imbottigliamento
- **4 slot per bottiglie** (vuote/piene)
- **Bottone imbottiglia** (100 RF per bottiglia)
- **Sistema automatico** vuota→piena

## 🔥 Sistema Alimentazione Fornaci

### ⚡ Funzionamento Automatico
- **Range**: Fornaci nei 6 blocchi adiacenti
- **Consumo**: 40 RF per operazione di cottura
- **Combustibile virtuale**: Aggiunge carbone automaticamente
- **Controllo intelligente**: Solo se c'è qualcosa da cuocere

### 🏭 Fornaci Supportate
- ✅ **Fornace Standard** (`mcl_furnaces:furnace`)
- ✅ **Forno Fusorio** (`mcl_blast_furnace:blast_furnace`)  
- ✅ **Affumicatore** (`mcl_smoker:smoker`)

### 🔧 Setup Ottimale
```
     [F]
[F] [MD] [F]  
     [F]

MD = Methane Digester
F = Fornace/Forno/Affumicatore
```

## 🍶 Sistema Imbottigliamento

### 📦 Materiali Necessari
- **Bottiglie vuote** (`mcl_potions:glass_bottle`)
- **Biogas** (minimo 100 RF per bottiglia)

### ⚙️ Processo
1. Inserisci bottiglie vuote negli slot dedicati
2. Assicurati di avere ≥100 RF di biogas
3. Clicca "Imbottiglia Gas"
4. Ricevi bottiglia di biogas utilizzabile

### 🔥 Utilizzo Bottiglie
- **Combustibile**: 20 secondi di cottura (equivalente a 1.33 carbone)
- **Portatile**: Trasporta energia ovunque
- **Riutilizzabile**: Restituisce bottiglia vuota dopo uso
- **Compatibile**: Funziona in tutte le fornaci

## 📊 Strategie di Ottimizzazione

### 🥇 Materiali ad Alta Efficienza
1. **Braciola di Maiale** - 150 RF (miglior rapporto energia)
2. **Pollo Cotto** - 120 RF (buon compromesso)
3. **Zucca** - 100 RF (facile da coltivare)
4. **Salmone Cotto** - 90 RF (alternativa pesce)

### ⏱️ Gestione Tempo
- **Materiali veloci** (erba, carne marcia) per energia immediata
- **Materiali lenti** (carne cotta, zucche) per massima resa
- **Mix bilanciato** per produzione continua

### 🏭 Setup Industriale
```
[F][F][F]
[F][MD][F] × multiple unità
[F][F][F]

- 8 fornaci per digestore
- Produzione massima
- Sistema modulare espandibile
```

### 🌿 Agricoltura Specializzata
- **Farm zucche** per energia massima
- **Allevamento** per carne ad alta resa  
- **Raccolta fiori** per volume alto
- **Compost scarti** invece di buttarli

## 🔧 Risoluzione Problemi

### ❌ "Digestore non funziona"
**Possibili cause:**
- Nessun materiale organico inserito
- Processo già in corso (aspetta completamento)
- GUI non aggiornata (chiudi e riapri)

**Soluzioni:**
1. Verifica materiali nell'input
2. Controlla progresso decomposizione
3. Aspetta completamento processo corrente

### ❌ "Fornaci non si alimentano"
**Possibili cause:**
- Fornaci non adiacenti al digestore
- Nessun biogas disponibile (<40 RF)
- Fornaci non hanno materiale da cuocere
- Slot combustibile fornace pieno

**Soluzioni:**
1. Posiziona fornaci nei 6 blocchi adiacenti
2. Accumula almeno 40 RF di biogas
3. Inserisci materiale da cuocere nelle fornaci
4. Libera spazio nel slot combustibile

### ❌ "Imbottigliamento non funziona"
**Possibili cause:**
- Biogas insufficiente (<100 RF)
- Nessuna bottiglia vuota disponibile
- Nessuno spazio per bottiglie piene
- Bottiglie sbagliate negli slot

**Soluzioni:**
1. Accumula almeno 100 RF
2. Inserisci `mcl_potions:glass_bottle`
3. Libera spazio negli slot bottiglie
4. Usa solo bottiglie di vetro standard

### ❌ "Materiali non accettati"
**Possibili cause:**
- Materiale non organico
- Slot input pieni
- Item non supportato dalla mod

**Soluzioni:**
1. Usa solo materiali dalla lista supportati
2. Libera spazio negli slot input (9 massimo)
3. Verifica nome esatto del materiale

## 📈 Statistiche e Monitoraggio

### 📊 Metriche Importanti
- **RF totali prodotti**: Energia lifetime generata
- **Materiali processati**: Conteggio totale decomposizioni
- **Efficienza temporale**: RF per minuto medio
- **Utilizzo fornaci**: Numero fornaci alimentate

### 🔍 Debug e Diagnostica
La GUI mostra in tempo reale:
- ✅ Materiale in decomposizione
- ✅ Progresso percentuale
- ✅ Energia disponibile
- ✅ Stato alimentazione fornaci
- ✅ Energia potenziale da materiali in input

## 🌱 Sostenibilità e Ambiente

### 🌍 Vantaggi Ecologici
- **Riciclo completo** degli scarti organici
- **Energia rinnovabile** da biomasse
- **Riduzione rifiuti** alimentari e agricoli
- **Combustibile pulito** alternativo al carbone

### 🔄 Economia Circolare
1. **Produzione agricola** → Raccolto + scarti
2. **Scarti organici** → Digestore → Biogas
3. **Biogas** → Cottura/Energia → Prodotti finiti
4. **Ciclo continuo** sostenibile e autoproduttivo

## 🎯 Obiettivi e Traguardi

### 🥉 Principiante
- [ ] Costruire primo digestore
- [ ] Produrre 1000 RF di biogas
- [ ] Alimentare 1 fornace automaticamente
- [ ] Imbottigliare prima bottiglia di biogas

### 🥈 Intermedio  
- [ ] Setup con 4+ fornaci alimentate
- [ ] Produrre 10,000 RF totali
- [ ] Gestire 3+ materiali diversi contemporaneamente
- [ ] Creare farm dedicata per digestore

### 🥇 Avanzato
- [ ] Sistema industriale con 8+ fornaci
- [ ] Produrre 100,000 RF totali
- [ ] Ottimizzare per massima efficienza RF/minuto
- [ ] Setup completamente automatizzato

### 🏆 Maestro Bioenergia
- [ ] Network multipli di digestori
- [ ] Produzione 1,000,000+ RF lifetime
- [ ] Sistema distribution biogas in bottiglia
- [ ] Economia server basata su bioenergia

---

**Il Methane Digester rappresenta il futuro dell'energia sostenibile in MineClonia!** 🌱⚡

*Trasforma i tuoi scarti in energia pulita e contribuisci a un mondo più verde.*