; ============================================================
;   JJS BLACK FLASH MACRO v5.0
;   Jujutsu Shenanigans - Pro Tech Edition
;   AutoHotkey v1.1+
; ============================================================

#NoEnv
#SingleInstance Force
#MaxHotkeysPerInterval 200
SendMode Input
SetWorkingDir %A_ScriptDir%
SetKeyDelay, 8, 8
SetBatchLines, -1

; ========================
;  CONFIG
; ========================
Global Mode     := 0
Global BFDelay  := 350
Global Awakened := false

Global C_NAME  := []
Global C_INPUT := []
Global C_COLOR := []
Global C_CHAR  := []

C_NAME[0]  := "VESSEL"        & C_CHAR[0]  := "Yuji Itadori"
C_NAME[1]  := "HONORED ONE"   & C_CHAR[1]  := "Satoru Gojo"
C_NAME[2]  := "PERFECTION"    & C_CHAR[2]  := "Mahito"
C_NAME[3]  := "SWITCHER"      & C_CHAR[3]  := "Aoi Todo"
C_NAME[4]  := "SALARYMAN"     & C_CHAR[4]  := "Kento Nanami"

C_INPUT[0] := "3 --> 3"
C_INPUT[1] := "2 --> R x10"
C_INPUT[2] := "3 --> 3"
C_INPUT[3] := "3 --> R --> 2 --> 2"
C_INPUT[4] := "R --> R"

C_COLOR[0] := "FF8C00"
C_COLOR[1] := "4D9FFF"
C_COLOR[2] := "B266FF"
C_COLOR[3] := "FFD700"
C_COLOR[4] := "88AA55"

Global CharCount := 5

IniRead, Mode,     %A_ScriptDir%\jjs.ini, cfg, mode,  0
IniRead, BFDelay,  %A_ScriptDir%\jjs.ini, cfg, delay, 350
IniRead, OvX,      %A_ScriptDir%\jjs.ini, cfg, x,     20
IniRead, OvY,      %A_ScriptDir%\jjs.ini, cfg, y,     20

if (Mode >= CharCount)
    Mode := 0

; ========================
;  BUILD UI
; ========================
BuildUI(OvX, OvY)
return

BuildUI(px, py) {
    Global
    W := 360

    Gui, Ov: Destroy
    Gui, Ov: -Caption +AlwaysOnTop +ToolWindow +LastFound
    Gui, Ov: Color, 0C0C14
    WinSet, Transparent, 245
    Gui, Ov: Margin, 0, 0

    ; ── TOP BAR ─────────────────────────────
    Gui, Ov: Font, cFFFFFF s11 Bold, Consolas
    Gui, Ov: Add, Text, x0 y0 w%W% h28 +0x200 BackgroundColor=1A1A2E Center vTopBar, JJS BLACK FLASH MACRO v5

    ; ── CHARACTER SECTION ───────────────────
    charColor := C_COLOR[Mode]
    Gui, Ov: Font, c%charColor% s24 Bold, Segoe UI
    Gui, Ov: Add, Text, x0 y34 w%W% Center vCharLabel, % C_NAME[Mode]

    Gui, Ov: Font, c555577 s10, Consolas
    Gui, Ov: Add, Text, x0 y62 w%W% Center vCharSub, % C_CHAR[Mode]

    ; ── DIVIDER ─────────────────────────────
    Gui, Ov: Font, c1E1E30 s7, Consolas
    Gui, Ov: Add, Text, x16 y76 w%W%, ___________________________________________

    ; ── BLACK FLASH SEQUENCE ────────────────
    Gui, Ov: Font, c888899 s10 Bold, Consolas
    Gui, Ov: Add, Text, x0 y90 w%W% Center, BLACK FLASH SEQUENCE

    Gui, Ov: Font, cFFFFFF s14 Bold, Consolas
    Gui, Ov: Add, Text, x0 y108 w%W% Center vInputLabel, % C_INPUT[Mode]

    ; ── TIMING ──────────────────────────────
    Gui, Ov: Font, c1E1E30 s7, Consolas
    Gui, Ov: Add, Text, x16 y128 w%W%, ___________________________________________

    Gui, Ov: Font, c888899 s10 Bold, Consolas
    Gui, Ov: Add, Text, x0 y142 w%W% Center, TIMING  (F5 lower / F6 higher)

    Gui, Ov: Font, cFFFFFF s20 Bold, Consolas
    Gui, Ov: Add, Text, x0 y160 w%W% Center vDelayLabel, % BFDelay . " ms"

    ; ── AWAKENING STATE ─────────────────────
    Gui, Ov: Font, c1E1E30 s7, Consolas
    Gui, Ov: Add, Text, x16 y188 w%W%, ___________________________________________

    Gui, Ov: Font, c44FF66 s13 Bold, Consolas
    Gui, Ov: Add, Text, x0 y202 w%W% Center vAwakenLabel, BASE FORM

    Gui, Ov: Font, c555577 s9, Consolas
    Gui, Ov: Add, Text, x0 y220 w%W% Center, Press F4 when you Awaken (G key)

    ; ── STATUS ──────────────────────────────
    Gui, Ov: Font, c44FF66 s12 Bold, Consolas
    Gui, Ov: Add, Text, x0 y238 w%W% Center vStatusDot, READY

    ; ── DIVIDER ─────────────────────────────
    Gui, Ov: Font, c1E1E30 s7, Consolas
    Gui, Ov: Add, Text, x16 y256 w%W%, ___________________________________________

    ; ── CONTROLS SECTION ────────────────────
    Gui, Ov: Font, c888899 s10 Bold, Consolas
    Gui, Ov: Add, Text, x0 y270 w%W% Center, CONTROLS

    ; Two-column layout for keys
    LX := 20    ; left col x
    RX := 190   ; right col x
    KW := 160   ; column width

    Gui, Ov: Font, c555577 s9, Consolas
    Gui, Ov: Add, Text, x%LX% y288 w%KW%, BLACK FLASH
    Gui, Ov: Font, cFFFFFF s9 Bold, Consolas
    Gui, Ov: Add, Text, x%RX% y288 w%KW%, F1

    Gui, Ov: Font, c555577 s9, Consolas
    Gui, Ov: Add, Text, x%LX% y304 w%KW%, Next Character
    Gui, Ov: Font, cFFFFFF s9 Bold, Consolas
    Gui, Ov: Add, Text, x%RX% y304 w%KW%, F2

    Gui, Ov: Font, c555577 s9, Consolas
    Gui, Ov: Add, Text, x%LX% y320 w%KW%, Prev Character
    Gui, Ov: Font, cFFFFFF s9 Bold, Consolas
    Gui, Ov: Add, Text, x%RX% y320 w%KW%, F3

    Gui, Ov: Font, c555577 s9, Consolas
    Gui, Ov: Add, Text, x%LX% y336 w%KW%, Awakening Toggle
    Gui, Ov: Font, cFFFFFF s9 Bold, Consolas
    Gui, Ov: Add, Text, x%RX% y336 w%KW%, F4

    Gui, Ov: Font, c555577 s9, Consolas
    Gui, Ov: Add, Text, x%LX% y352 w%KW%, Timing -5ms / +5ms
    Gui, Ov: Font, cFFFFFF s9 Bold, Consolas
    Gui, Ov: Add, Text, x%RX% y352 w%KW%, F5 / F6

    ; ── PRO TECHS ───────────────────────────
    Gui, Ov: Font, c1E1E30 s7, Consolas
    Gui, Ov: Add, Text, x16 y370 w%W%, ___________________________________________

    Gui, Ov: Font, c888899 s10 Bold, Consolas
    Gui, Ov: Add, Text, x0 y384 w%W% Center, PRO TECHS

    Gui, Ov: Font, c555577 s9, Consolas
    Gui, Ov: Add, Text, x%LX% y400 w%KW%, Feint Cancel
    Gui, Ov: Font, cFFFFFF s9 Bold, Consolas
    Gui, Ov: Add, Text, x%RX% y400 w%KW%, F7

    Gui, Ov: Font, c555577 s9, Consolas
    Gui, Ov: Add, Text, x%LX% y416 w%KW%, Ragdoll Cancel
    Gui, Ov: Font, cFFFFFF s9 Bold, Consolas
    Gui, Ov: Add, Text, x%RX% y416 w%KW%, F8

    Gui, Ov: Font, c555577 s9, Consolas
    Gui, Ov: Add, Text, x%LX% y432 w%KW%, Slide Walk
    Gui, Ov: Font, cFFFFFF s9 Bold, Consolas
    Gui, Ov: Add, Text, x%RX% y432 w%KW%, F9

    Gui, Ov: Font, c555577 s9, Consolas
    Gui, Ov: Add, Text, x%LX% y448 w%KW%, Perfect 3x M1
    Gui, Ov: Font, cFFFFFF s9 Bold, Consolas
    Gui, Ov: Add, Text, x%RX% y448 w%KW%, F10

    ; ── BOTTOM BAR ──────────────────────────
    Gui, Ov: Font, c1E1E30 s7, Consolas
    Gui, Ov: Add, Text, x16 y466 w%W%, ___________________________________________

    Gui, Ov: Font, c444455 s9, Consolas
    Gui, Ov: Add, Text, x%LX% y480 w%KW%, Hide Overlay
    Gui, Ov: Font, cFFFFFF s9 Bold, Consolas
    Gui, Ov: Add, Text, x%RX% y480 w%KW%, ~ (tilde)

    Gui, Ov: Font, cFF4444 s9 Bold, Consolas
    Gui, Ov: Add, Text, x%LX% y496 w%KW%, EXIT MACRO
    Gui, Ov: Font, cFF4444 s9 Bold, Consolas
    Gui, Ov: Add, Text, x%RX% y496 w%KW%, F12

    Gui, Ov: Show, x%px% y%py% w%W% h516 NoActivate, JJS

    OnMessage(0x201, "WM_LBUTTONDOWN")
    OnMessage(0x202, "WM_LBUTTONUP")
}

; ========================
;  UI UPDATES
; ========================
RefreshUI() {
    Global
    charColor := C_COLOR[Mode]
    Gui, Ov: Font, c%charColor% s24 Bold, Segoe UI
    GuiControl, Ov: Font, CharLabel
    GuiControl, Ov:, CharLabel, % C_NAME[Mode]
    GuiControl, Ov:, CharSub,   % C_CHAR[Mode]
    GuiControl, Ov:, InputLabel, % C_INPUT[Mode]
    GuiControl, Ov:, DelayLabel, % BFDelay . " ms"

    if (Awakened) {
        Gui, Ov: Font, cFF4444 s13 Bold, Consolas
        GuiControl, Ov: Font, AwakenLabel
        GuiControl, Ov:, AwakenLabel, AWAKENED  (F1/F7/F10 OFF)
    } else {
        Gui, Ov: Font, c44FF66 s13 Bold, Consolas
        GuiControl, Ov: Font, AwakenLabel
        GuiControl, Ov:, AwakenLabel, BASE FORM
    }
}

SetStatus(txt, color := "44FF66") {
    Global
    Gui, Ov: Font, c%color% s12 Bold, Consolas
    GuiControl, Ov: Font, StatusDot
    GuiControl, Ov:, StatusDot, %txt%
}

FlashStatus() {
    SetStatus(">> BLACK FLASH <<", "FF4444")
    SetTimer, ResetStatus, -1000
}
ResetStatus:
    SetStatus("READY", "44FF66")
return

; ========================
;  SAVE / DRAG
; ========================
SaveConfig() {
    Global
    WinGetPos, sx, sy,,, JJS
    IniWrite, %Mode%,    %A_ScriptDir%\jjs.ini, cfg, mode
    IniWrite, %BFDelay%, %A_ScriptDir%\jjs.ini, cfg, delay
    if (sx != "")
        IniWrite, %sx%, %A_ScriptDir%\jjs.ini, cfg, x
    if (sy != "")
        IniWrite, %sy%, %A_ScriptDir%\jjs.ini, cfg, y
}

WM_LBUTTONDOWN(wParam, lParam, msg, hwnd) {
    PostMessage, 0xA1, 2,,, A
}

WM_LBUTTONUP(wParam, lParam, msg, hwnd) {
    SaveConfig()
}

; ========================
;  BLACK FLASH FUNCTIONS
; ========================

BF_Standard() {
    Global BFDelay
    Send {3}
    Sleep, %BFDelay%
    Send {3}
}

BF_Gojo() {
    Send {2}
    Sleep, 280
    Loop, 10 {
        Send {r}
        Sleep, 30
    }
}

BF_Todo() {
    Global BFDelay
    Send {3}
    Sleep, 900
    Send {r}
    Sleep, 150
    Send {2}
    Sleep, 700
    Send {2}
}

BF_Nanami() {
    Send {r}
    Sleep, 750
    Send {r}
}

ExecuteBlackFlash() {
    Global Mode
    Switch Mode {
        Case 0: BF_Standard()
        Case 1: BF_Gojo()
        Case 2: BF_Standard()
        Case 3: BF_Todo()
        Case 4: BF_Nanami()
    }
}

; ========================
;  PRO TECHS
; ========================

DoFeint() {
    Global Mode
    Switch Mode {
        Case 3:
            Send {1}
            Sleep, 150
            Send {r}
        Default:
            Send {3}
            Sleep, 80
            Send {r}
    }
}

DoRagdollCancel() {
    Send {a down}
    Sleep, 10
    Send {q}
    Sleep, 50
    Send {a up}
}

DoSlideWalk() {
    Send {w down}
    Sleep, 30
    Send {w}
    Sleep, 30
    Send {q}
    Sleep, 200
    Send {w up}
}

DoM1Burst() {
    Click
    Sleep, 175
    Click
    Sleep, 175
    Click
}

; ========================
;  HOTKEYS — ROBLOX ONLY
; ========================
#IfWinActive ahk_exe RobloxPlayerBeta.exe

F1::
    if (Awakened)
        return
    FlashStatus()
    ExecuteBlackFlash()
return

F2::
    Mode := Mod(Mode + 1, CharCount)
    RefreshUI()
    SaveConfig()
return

F3::
    Mode := Mode - 1
    if (Mode < 0)
        Mode := CharCount - 1
    RefreshUI()
    SaveConfig()
return

F4::
    Awakened := !Awakened
    RefreshUI()
    if (Awakened)
        SetStatus("AWAKENED — MACROS OFF", "FF4444")
    else
        SetStatus("READY", "44FF66")
return

F5::
    BFDelay := (BFDelay - 5 < 100) ? 100 : BFDelay - 5
    RefreshUI()
    SaveConfig()
return

F6::
    BFDelay := (BFDelay + 5 > 600) ? 600 : BFDelay + 5
    RefreshUI()
    SaveConfig()
return

F7::
    if (Awakened)
        return
    DoFeint()
return

F8::
    DoRagdollCancel()
return

F9::
    DoSlideWalk()
return

F10::
    if (Awakened)
        return
    DoM1Burst()
return

#IfWinActive

; ========================
;  GLOBAL HOTKEYS
; ========================
Global OvHidden := false
`::
    if (OvHidden) {
        Gui, Ov: Show, NoActivate
        OvHidden := false
    } else {
        SaveConfig()
        Gui, Ov: Hide
        OvHidden := true
    }
return

F12::
    SaveConfig()
    Gui, Ov: Destroy
    ExitApp
return
