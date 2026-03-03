# ⚡ JJS Black Flash Macro - Jujutsu Shenanigans

Macro multi-personaje para Roblox Jujutsu Shenanigans, enfocada en **Black Flash** y combos.

## 📦 Requisitos

1. **AutoHotkey v1.1+** → [Descargar aquí](https://www.autohotkey.com/)
   - Descarga la versión **v1.1** (no v2, el script usa sintaxis v1)
   - Instala normalmente (siguiente, siguiente, listo)

2. **Roblox** con Jujutsu Shenanigans abierto

## 🚀 Cómo Usar

1. Haz **doble click** en `JJS_BlackFlash_Macro.ahk`
2. Aparece un **overlay** en la esquina superior izquierda
3. Abre Roblox y entra a Jujutsu Shenanigans
4. Selecciona tu personaje con **F2**
5. ¡Listo! Usa las teclas para ejecutar combos

## 🎮 Teclas

| Tecla | Acción |
|-------|--------|
| **F1** | ⚡ Ejecutar **Black Flash** (del personaje activo) |
| **F2** | 🔄 Cambiar personaje |
| **F3** | ⚔ Combo básico |
| **F4** | 💥 Combo avanzado/extendido |
| **F5** | ⏱ Bajar timing Black Flash (-10ms) |
| **F6** | ⏱ Subir timing Black Flash (+10ms) |
| **F7** | 🛡 Toggle Auto-Block |
| **F8** | ⬇ Downslam rápido |
| **F9** | 👁 Mostrar/Ocultar overlay |
| **F10** | ⏸ Pausar/Reanudar macro |
| **F12** | ❌ Salir |

> **NOTA:** F1-F8 solo funcionan cuando Roblox está en primer plano.

## 👤 Personajes Soportados

### 1. Vessel (Yuji Itadori)
- **Black Flash:** Divergent Fist (3) → espera timing → 3 otra vez
- **Combo básico:** Dash → 3 M1s → Cursed Strikes(1) → 3 M1s → Black Flash
- **Combo avanzado:** 3 M1s + Uppercut → 1 → 3 M1s → Side Dash → BF → Jump → Aerial 2 → 3 M1s → Downslam → 4
- **Tip:** Si haces BF en la espalda del enemigo, NO tiene cooldown. Puedes encadenar hasta 4 seguidos.

### 2. Honored One (Gojo)
- **Black Flash:** Reversal Red Max (2) → spam R rápidamente
- **Combo básico:** 3 M1s → Rapid Punches(3) → Twofold Kicks(4) → 3 M1s → Dash → Reversal Red(2)
- **Combo avanzado:** 4 M1s → Lapse Blue(1) → R → 4 → 3 M1s + Downslam → 2 → Dash → 3 M1s → 3 → Downslam → 1 → R → 4 M1s

### 3. Perfection (Mahito)
- **Black Flash:** Focus Strike (3) → espera timing → 3 otra vez
- **Combo básico:** 3 M1s → BF → Dash → Skill 2
- **Combo avanzado:** 1 → Downslam → 2(grab) → BF → 4
- **Nota:** No puede hacer BF aéreo ni encadenar múltiples BF como Vessel

### 4. Switcher (Todo)
- **Black Flash:** Pebble(3) → R antes del impacto → Brute Force(2) → 2 al impactar
- **Combo básico:** Dash → 3 M1s → 1 → BF complejo
- **Combo avanzado:** 3 M1s → 1 → BF → Awakening(G) → Brothers(4) = BF finisher
- **Nota:** El BF de Todo es el más complejo de todos (4 inputs)

### 5. King of Curses (Sukuna)
- **Black Flash:** Similar a Vessel (3 → 3)
- **Combo avanzado:** Incluye R×4 para World Cutting Slash (requiere Heian Era)

### 6. Salaryman (Nanami)
- **Black Flash:** Ratio Point(R) → 3 M1s (passive BF se activa automáticamente)
- **Nota:** El timing del Ratio Point se vuelve más estricto a menor HP del enemigo

## ⏱ Ajuste de Timing (IMPORTANTE)

El timing del Black Flash es **lo más crítico**. El valor por defecto es **350ms**.

- **F5** = bajar 10ms (más rápido)
- **F6** = subir 10ms (más lento)
- Rango recomendado: **300-400ms**
- El timing se guarda automáticamente en `jjs_config.ini`

### Cómo encontrar TU timing perfecto:
1. Entra a un servidor de práctica
2. Selecciona Vessel (F2 hasta llegar)
3. Acércate a un enemigo/dummy
4. Presiona F1 para Black Flash
5. Si NO sale → ajusta con F5/F6
6. Si sale un **Divergent Fist normal** → el timing fue muy lento (F5 para bajar)
7. Si no sale nada / se cancela → el timing fue muy rápido (F6 para subir)
8. Cuando funcione, ese timing aplica para Vessel, Mahito y Sukuna

> **⚠️ El timing puede variar según tu ping.** Si juegas con ping alto (>100ms), prueba subir el delay a 380-420ms.

## ⚠️ Aviso Legal

Esta macro usa **AutoHotkey** que simplemente simula pulsaciones de teclado/mouse. No inyecta código en Roblox ni modifica el juego. Sin embargo:

- Roblox puede actualizar sus políticas anti-macro en cualquier momento
- Úsala bajo tu propia responsabilidad
- Recomiendo usarla principalmente para **practicar timing** en servidores privados

## 🔧 Personalización

Puedes editar el archivo `.ahk` para:
- Cambiar las teclas (las F-keys al inicio del script)
- Ajustar delays entre M1s (`M1Delay`, default 180ms)
- Ajustar delay entre habilidades (`SkillDelay`, default 100ms)
- Agregar nuevos personajes al array `Characters`
- Modificar los combos de cada personaje

## 📁 Archivos

- `JJS_BlackFlash_Macro.ahk` → El script principal
- `jjs_config.ini` → Se crea automáticamente, guarda tu personaje y timing
- `README.md` → Este archivo
