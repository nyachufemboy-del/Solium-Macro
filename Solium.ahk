#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%

/*
a good chunk of the gui was vibe coded. not all of it dont slaughter me.

all of the macro and paths and other stuff are not vibecoded at all. only some parts of the gui are
*/

config := "soliumconfig.ini"
iconFilePath := A_ScriptDir "\icon\melon.ico"
if (FileExist(iconFilePath)) {
    Menu, Tray, Icon, %iconFilePath%
}


; =========================
; DEFAULT VALUES
; =========================
default_NavKey := "\"
default_Aura := "Arcane : Dark"
default_Obby := "Sailor"

default_crafter := "false"
default_autoad := "true"
default_DoObby := "true"
default_caveobby := "true"
default_AutoReso := "true"
default_AutoRoll := "false"

default_FishCount := 55
default_SellCount := 40

; =========================
; CREATE CONFIG IF MISSING
; =========================
IfNotExist, %config%
{
    IniWrite, %default_NavKey%, %config%, Settings, NavKey
    IniWrite, %default_Aura%, %config%, Settings, Aura
    IniWrite, %default_Obby%, %config%, Settings, Obby
    IniWrite, %default_FishCount%, %config%, Settings, FishCount
    IniWrite, %default_SellCount%, %config%, Settings, SellCount

    IniWrite, %default_crafter%, %config%, Toggles, crafter
    IniWrite, %default_autoad%, %config%, Toggles, autoad
    IniWrite, %default_DoObby%, %config%, Toggles, DoObby
    IniWrite, %default_caveobby%, %config%, Toggles, caveobby
    IniWrite, %default_AutoReso%, %config%, Toggles, AutoReso
    IniWrite, %default_AutoRoll%, %config%, Toggles, DisableAutoRoll
}

; =========================
; LOAD CONFIG
; =========================
IniRead, NavKey, %config%, Settings, NavKey, %default_NavKey%
IniRead, Aura, %config%, Settings, Aura, %default_Aura%
IniRead, Obby, %config%, Settings, Obby, %default_Obby%
IniRead, SellCount, %config%, Settings, SellCount, %default_SellCount%
IniRead, FishCount, %config%, Settings, FishCount, %default_FishCount%

IniRead, crafter, %config%, Toggles, crafter, %default_crafter%
IniRead, autoad, %config%, Toggles, autoad, %default_autoad%
IniRead, DoObby, %config%, Toggles, DoObby, %default_DoObby%
IniRead, caveobby, %config%, Toggles, caveobby, %default_caveobby%
IniRead, AutoReso, %config%, Toggles, AutoReso, %default_AutoReso%
IniRead, DisableAutoRoll, %config%, Toggles, DisableAutoRoll, %default_AutoRoll%



; =========================
; GUI
; =========================
Gui, Font, s10, Segoe UI
Gui, Color, 202020
Gui, Add, Text, x20 y20 cWhite, Navigation Key
Gui, Add, Edit, x180 y18 w180 vNavKey gSaveInputs, %NavKey%
Gui, Add, Text, x20 y55 cWhite, Teleporter Aura
Gui, Add, Edit, x180 y53 w180 vAura gSaveInputs, %Aura%
Gui, Add, Text, x20 y90 cWhite, WaterWalking Aura
Gui, Add, Edit, x180 y88 w180 vObby gSaveInputs, %Obby%

Gui, Add, Text, x20 y125 cWhite, Fish Count
Gui, Add, Text, x180 y123 w30 h23 +Border +Center gInfoFish cFFFFFF, ?
Gui, Add, Edit, x215 y123 w145 vFishCount Number gSaveInputs, %FishCount%

Gui, Add, Text, x20 y160 cWhite, Sell Count
Gui, Add, Text, x180 y158 w30 h23 +Border +Center gInfoSell cFFFFFF, ?
Gui, Add, Edit, x215 y158 w145 vSellCount Number gSaveInputs, %SellCount%

; =========================
; TOGGLES
; =========================
Gui, Add, Button, x20 y200 w140 gToggleCrafter vBtnCrafter, Crafter: %crafter%
Gui, Add, Text, x170 y200 w30 h23 +Border +Center gInfoCrafter c00FF00, ?
Gui, Add, Button, x20 y240 w140 gToggleAutoAd vBtnAutoAd, AutoAd: %autoad%
Gui, Add, Text, x170 y240 w30 h23 +Border +Center gInfoAutoAd c00FF00, ?
Gui, Add, Button, x20 y280 w140 gToggleDoObby vBtnDoObby, DoObby: %DoObby%
Gui, Add, Text, x170 y280 w30 h23 +Border +Center gInfoDoObby c00FF00, ?
Gui, Add, Button, x20 y320 w140 gToggleCaveObby vBtnCaveObby, CaveObby: %caveobby%
Gui, Add, Text, x170 y320 w30 h23 +Border +Center gInfoCaveObby cFFFF00, ?
Gui, Add, Button, x20 y360 w140 gToggleAutoReso vBtnAutoReso, AutoReso: %AutoReso%
Gui, Add, Text, x170 y360 w30 h23 +Border +Center gInfoAutoReso cFF0000, ?
Gui, Add, Button, x20 y400 w140 gToggleAutoRoll vBtnAutoRoll, DisableAutoRoll: %DisableAutoRoll%
Gui, Add, Text, x170 y400 w30 h23 +Border +Center gInfoAutoRoll cFFFFFF, ?
Gui, Add, Text, x220 y355 cWhite, made by kev, discord : 41ht

; =========================
; BOTTOM BUTTONS
; =========================
Gui, Add, Button, x20 y440 w120 gRunSolium, Run Solium
Gui, Add, Button, x150 y440 w120 gExitSolium, Exit Solium
Gui, Add, Button, x300 y440 w80 gShowHelp, Help

; ===== NEW SKIP TO FISHING BUTTON =====
Gui, Add, Button, x20 y495 w120 gSkipFishing, Skip to Fishing
Gui, Add, Text, x150 y495 w30 h23 +Border +Center gInfoSkipFishing cFFFFFF, ?

Gui, Show,, Solium
return

; =========================
; SAVE INPUTS
; =========================
SaveInputs:
Gui, Submit, NoHide
IniWrite, %NavKey%, %config%, Settings, NavKey
IniWrite, %Aura%, %config%, Settings, Aura
IniWrite, %Obby%, %config%, Settings, Obby
IniWrite, %FishCount%, %config%, Settings, FishCount
IniWrite, %SellCount%, %config%, Settings, SellCount
return

; =========================
; TOGGLE FUNCTIONS
; =========================
ToggleCrafter:
if (crafter = "true")
    crafter := "false"
else
    crafter := "true"
IniWrite, %crafter%, %config%, Toggles, crafter
GuiControl,, BtnCrafter, Crafter: %crafter%
return

ToggleAutoAd:
if (autoad = "true")
    autoad := "false"
else
    autoad := "true"
IniWrite, %autoad%, %config%, Toggles, autoad
GuiControl,, BtnAutoAd, AutoAd: %autoad%
return

ToggleDoObby:
if (DoObby = "true")
    DoObby := "false"
else
    DoObby := "true"
IniWrite, %DoObby%, %config%, Toggles, DoObby
GuiControl,, BtnDoObby, DoObby: %DoObby%
return

ToggleCaveObby:
if (caveobby = "true")
    caveobby := "false"
else
    caveobby := "true"
IniWrite, %caveobby%, %config%, Toggles, caveobby
GuiControl,, BtnCaveObby, CaveObby: %caveobby%
return

ToggleAutoReso:
if (AutoReso = "true")
    AutoReso := "false"
else
    AutoReso := "true"
IniWrite, %AutoReso%, %config%, Toggles, AutoReso
GuiControl,, BtnAutoReso, AutoReso: %AutoReso%
return

ToggleAutoRoll:
if (DisableAutoRoll = "true")
    DisableAutoRoll := "false"
else
    DisableAutoRoll := "true"
IniWrite, %DisableAutoRoll%, %config%, Toggles, DisableAutoRoll
GuiControl,, BtnAutoRoll, DisableAutoRoll: %DisableAutoRoll%
return

; =========================
; INFO BUTTONS
; =========================
InfoCrafter:
MsgBox Auto crafting is stable, REQUIRES ARCANE : DARK. (Automatically goes to stella's culdrin and crafts Bound & Heavenly potions. other potions arent supported yet)
return

InfoAutoAd:
MsgBox, Auto watch ad is stable, requires nothing to use, (Automatically goes to jake and watches the ad)
return

InfoDoObby:
MsgBox, Auto normal obby is stable, REQUIRES ANY MUTATION OF "Sailor" (Automatically grabs basic blessing from the obby)
return

InfoCaveObby:
MsgBox, WARNING : CaveObby is semi-stable, it may fail sometimes. REQUIRES ARCANE DARK & 0.36 ROBLOX SENSITIVTY (Automatically goes to the cave obby and grabs Torch Blessing)
return

InfoAutoReso:
MsgBox, WARNING : AutoReso is super unstable and will most likely fail to use Resonance alot. REQUIRES ARCANE DARK & 0.36 ROBLOX SENSITIVTY  (Automatically goes to and uses the Resonance)
return

InfoAutoRoll:
MsgBox, Changes if the macro will disable Auto roll to prevent auto equip from breaking patterns. (TRUE = DISABLES AUTO ROLL)
return

InfoSkipFishing:
msgbox, starts Soium and starts fishing, MAKE SURE YOURE IN THE FISHING SPOT ALREADY
return

InfoFish:
MsgBox, how many fish Soium will catch before selling then running Solium
return

InfoSell:
MsgBox, how many times Soium will click sell all. (set to 999 for it to sell every fish untill none are left to sell)
return

; =========================
; SKIP BUTTON
; =========================
SkipFishing:
Run, SkipFishing.ahk
return

; =========================
; RUN / EXIT SOLIUM
; =========================
RunSolium:
Run, macro.ahk
return

ExitSolium:
Send, {f4 down}
sleep 500
Send, {f4 up}
sleep 500
Return

; =========================
; HELP MESSAGE
; =========================
ShowHelp:
MsgBox,
(

==============================================
auras needed : any Sailor varient for DoObby
arcane darkness/legacy for AutoReso & CaveObby
0.36 roblox sens required for CaveObby & AutoReso
-----
ROBLOX MUST BE FULL SCREEN, AND RESOLTUION MUST BE 1920 X 1080P AND YOU MUST HAVE VIP
have atleast 30 fps and decent ping ( 0 - 100 )

keep in mind macroing for too long (10+ hours) will cause roblox to memory leak which will bring ur fps down which will sometimes cause paths to break

my discord : 41ht
my roblox : lapsisawesome
==============================================
PRESS F4 THEN F3 TO FULLY STOP THE MACRO
)
return

GuiClose:
ExitApp