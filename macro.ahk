; functions for cave obby & auto resosunace
mouseXY(x,y)
{
DllCall("mouse_event",short,1,short,x,short,y,short,0,short,0)
}


close := "F4" ; dont change this, or SoliumLoader will be unable to kill this script upon pressing Exit Solium,








; code that reads config and loads the stuffin them
SetWorkingDir, %A_ScriptDir%
Hotkey, %close%, CloseApp  

ConfigFile := A_ScriptDir "\soliumconfig.ini"

IniRead, Navkey, %ConfigFile%, Settings, NavKey
IniRead, Aura, %ConfigFile%, Settings, Aura
IniRead, Obby, %ConfigFile%, Settings, Obby
IniRead, FishCount, %ConfigFile%, Settings, FishCount
IniRead, SellCount, %ConfigFile%, Settings, SellCount

IniRead, crafter, %ConfigFile%, Toggles, crafter
IniRead, autoad, %ConfigFile%, Toggles, autoad
IniRead, DoObby, %ConfigFile%, Toggles, DoObby
IniRead, caveobby, %ConfigFile%, Toggles, caveobby
IniRead, AutoReso, %ConfigFile%, Toggles, AutoReso
IniRead, DisableAutoRoll, %ConfigFile%, Toggles, DisableAutoRoll


crafter  := (crafter = "true")
autoad   := (autoad = "true")
DoObby   := (DoObby = "true")
caveobby := (caveobby = "true")
AutoReso := (AutoReso = "true")
DisableAutoRoll := (DisableAutoRoll = "true")


;msgbox, %AutoReso% %CaveObby% %DoObby% %AutoAd% %crafter%. %Aura%, %NavKey%, %autoroll%.. %fishcount% %sellcount% ; bug testing values. 1 = true 0 = false



; haiii :3 
SetMouseDelay, 2
SetKeyDelay, 1

Gui, +AlwaysOnTop -Caption +ToolWindow
Gui, Color, 0xa79aBa
Gui, Font, s15 cBlack
Gui, Add, Text, vStatusText, running set to falseeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee4597863459736459876345978634597863459876345987345iyhgedrtgiuyh
Gui, Show, x1580 y960 w340 h60, Status

GuiControl,, StatusText, running set to false
GuiControl,, StatusText, Loading Solium
WinActivate, ahk_exe RobloxPlayerBeta.exe

GuiControl,, StatusText, Current Task : nothing lol



; watch ad
if (autoad)
{
GuiControl,, StatusText, Current Task : watching jake's ad
WinActivate, ahk_exe RobloxPlayerBeta.exe
sleep 1000
sleep 5000
Send, {Esc down}
sleep 400
Send, {Esc up}
sleep 400
Send, {r down}
sleep 400
Send, {r up}
sleep 400
Send, {enter down}
sleep 400
Send, {enter up}
sleep 6000
;fail safe 1 : check if auto roll is off
PixelSearch, x, y, 804, 1017, 804, 1017, 0xFFFFFF, 1, RGB
if !ErrorLevel
{
Click, 804, 1017
}
sleep 500
; fail safe 2 : disable shift lock if its on (and reenable it)
Send, {esc down}
sleep 500
Send, {esc up}
sleep 500
Send, {tab down}
sleep 400
Send, {tab up}
sleep 300
Send, {right down}
sleep 100
Send, {right up}
sleep 300
Send, {right down}
sleep 100
Send, {right up}
sleep 300
Send, {esc down}
sleep 500
Send, {esc up}
sleep 500
;fail safe 3 : disables chat if its enabled
PixelSearch, x, y, 131, 28, 131, 28, 0xFFFFFF, 10, RGB
if !ErrorLevel
{
Click, 131, 28
}
sleep 500
MouseMove, 1459, 269
sleep 200
Click, 1459, 269
sleep 200
Click, 1413, 298
MouseMove, 29, 456
sleep 100
Click, 29, 456
sleep 500
Send, {%Navkey% down}
sleep 200
Send, {%Navkey% up}
sleep 200
Loop, 15
{
    Send, {w down}{w up}
}
sleep 200
Send, {enter down}
sleep 200
Send, {enter up}
sleep 300
Send, {%Navkey% down}
sleep 200
Send, {%Navkey% up}
sleep 2000
Send, {shift down}{s down}{d down}
sleep 1000
Send, {shift up}{d up}
sleep 4000
Send, {s up}
sleep, 1000
Send, {s down}{a down}
sleep 1000
Send, {s up}{a up}
sleep 500
Send, {w down}
sleep 150
Send, {w up}
sleep 200
Send, {s down}{space down}
sleep 200
Send, {Space up}
sleep 3000
Send, {s up}
sleep 200
Send, {a down}
sleep 2000
Send, {a up}
sleep 200
Send, {s down}
sleep 1500
Send, {s up}
sleep 400
Send, {shift down}
sleep 400
Send, {shift up}
sleep 900
Send, {e down}
sleep 400
Send, {e up}
sleep 900
MouseMove, 930, 811
sleep 100
Click, 930, 811
sleep 2000
MouseMove, 657, 947
sleep 100
Click, 657, 947
sleep 5000
GuiControl,, StatusText, Current Task : searching for ad
PixelSearch, x, y, 47, 894, 79, 894, 0x5EE6FF, 5, RGB
if !ErrorLevel
{
    Click, 267, 895
    sleep 10000

    Loop, 45
    {
        PixelSearch, x2, y2, 340, 270, 340, 270, 0xFFFFFF, 1, RGB

        if ErrorLevel
        {
            MouseMove, 1850, 181
            Sleep, 200
            Click, 1850, 181
            break
        }
        else
        {
            Sleep, 1000
            continue
        }
    }
}
sleep 500
GuiControl,, StatusText, Current Task : finished jake
Send, {Esc down}
sleep 400
Send, {Esc up}
sleep 400
Send, {r down}
sleep 400
Send, {r up}
sleep 400
Send, {enter down}
sleep 400
Send, {enter up}
}
;end of ad watch path

if (AutoReso)
{
GuiControl,, StatusText, Current Task : using resonance
WinActivate, ahk_exe RobloxPlayerBeta.exe
sleep 1000
Clipboard :=
sleep 400
Clipboard := Aura
ClipWait, 1
sleep 500
Send, {Esc down}
sleep 400
Send, {Esc up}
sleep 400
Send, {r down}
sleep 400
Send, {r up}
sleep 400
Send, {enter down}
sleep 400
Send, {enter up}
sleep 6000
;fail safe 1 : check if auto roll is off
PixelSearch, x, y, 804, 1017, 804, 1017, 0xFFFFFF, 1, RGB
if !ErrorLevel
{
Click, 804, 1017
}
sleep 500
; fail safe 2 : disable shift lock if its on (and reenable it)
Send, {esc down}
sleep 500
Send, {esc up}
sleep 500
Send, {tab down}
sleep 400
Send, {tab up}
sleep 300
Send, {right down}
sleep 100
Send, {right up}
sleep 300
Send, {right down}
sleep 100
Send, {right up}
sleep 300
Send, {esc down}
sleep 500
Send, {esc up}
sleep 500
;fail safe 3 : disables chat if its enabled
PixelSearch, x, y, 131, 28, 131, 28, 0xFFFFFF, 10, RGB
if !ErrorLevel
{
Click, 131, 28
}
sleep 500
Click, 1413, 298
MouseMove, 1459, 269
sleep 200
Click, 1459, 269
sleep 200
MouseMove, 29, 456
sleep 100
Click, 29, 456
sleep 500
Send, {%Navkey% down}
sleep 200
Send, {%Navkey% up}
sleep 200
Loop, 15
{
    Send, {w down}{w up}
}
sleep 200
Send, {enter down}
sleep 200
Send, {enter up}
sleep 300
Send, {%Navkey% down}
sleep 200
Send, {%Navkey% up}
sleep 1000

; path to cualdrin stars here
if (disableautoroll)
{
MouseMove, 755, 1003
sleep 200
Click, 755, 1003
}
Send, {click right down}
sleep 500
sleep 200
Send, {click right up}
sleep 500
Send, {shift down}
Send, {s down}
sleep 5000
Send, {s up}{shift up}
sleep 200
Send, {w down}
sleep 200
Send, {w up}
sleep 200
Send, {a down}
sleep 5000
Send, {a up}
sleep 200
Send, {w down}
sleep 150
Send, {w up}
sleep 200
Send, {s down}{space down}
sleep 200
Send, {space up}
sleep 4000
Send, {s up}
sleep 200
Send, {w down}
sleep 100
Send, {w up}
sleep 200
Send, {s down}{space down}
sleep 200
Send, {space up}
sleep 500
Send, {a down}
sleep 300
Send, {a up}
sleep 3000
Send, {s up}
sleep 200
Send, {w down}
sleep 200
Send, {w up}
sleep 200
Send, {a down}
sleep 3000
Send, {s down}
sleep 1500
Send, {s up}{a up}
sleep 200
Send, {d down}{shift down}
sleep 500
Send, {d up}{shift up}
sleep 200
Send, {s down}
sleep 1000
Send, {s up}
MouseMove, 32, 429
sleep 200
Click, 32, 429
sleep 200
MouseMove, 861, 364
sleep 200
Click, 861, 364
Send, {Ctrl Down}
sleep 200
Send, {v down}
sleep 200
Send, {Ctrl up}{v up}
sleep 500
SetKeyDelay, 1
MouseMove, 820, 438
sleep 500
Loop, 20
{
    Send, {Wheelup}
}
sleep 1000
Click, 820, 438
sleep 200
MouseMove, 627, 631
sleep 200
Click, 627, 631
sleep 200
MouseMove, 32, 429
sleep 200
Click, 32, 429
Sleep 700
Send, {s down}{space down}
sleep 400
Send, {x down}
sleep 200
Send, {x up}{s up}{space up}
sleep 200
Send, {shift down}
sleep 200
Send, {shift up}
sleep 200
Send, {s down}{space down}
sleep 3500
Send, {space up}{a down}
sleep 1000
Send, {s up}{a up}
sleep 200
; 2 start reso
GuiControl,, StatusText, Current Task : climbing moutain of resonance
Send, {w down}
sleep 500
sleep 500
Send, {w up}{shift up}
sleep 300
Send, {d down}
sleep 1500
Send, {d up}
sleep 200
Send, {s down}
sleep 500
Send, {s up}
sleep 200
Send, {s down}{space down}
sleep 300
Send, {s up}{space up}
Loop, 100
{
    mouseXY(10,0)
    sleep 1
}
sleep 4000
sleep 900
Send, {space down}
sleep 100
Send, {space up}
sleep 125
Send, {x down}
sleep 100
Send, {x up}
sleep 300
Send, {d down}{w down}
sleep 2500
Send, {d up}{w up}
; 3
sleep 600
Send, {a down}
sleep 300
Send, {a up}
sleep 200
Send, {d down}{space down}
sleep 100
Send, {space up}
sleep 300
Send, {w down}
sleep 400
Send, {w up}{d up}
sleep 400
Send, {s down}{a down}
sleep 10
Send, {space down}
sleep 200
Send, {s up}{space up}
sleep 400
Send, {a up}
sleep 300
Send, {space down}{a down}
sleep 100
Send, {space up}
sleep 300
Send, {a up}
sleep 300
Send, {w down}{space down}
sleep 100
Send, {space up}
sleep 100
Send, {space up}{w up}
sleep 400
Send, {space down}{w down}
sleep 100
Send, {space up}
sleep 100
sleep 1200
Send, {w up}
sleep 400
Send, {d down}
sleep 300
Send, {space down}
sleep 100
Send, {space up}
sleep 700
Send, {space down}
sleep 100
Send, {space up}
sleep 1500
Send, {w down}
sleep 400
Send, {d up}{w up}
sleep 400
Send, {s down}
sleep 300
Send, {s up}{d down}
sleep 500
Send, {w down}
sleep 400
Send, {w up}{d up}
sleep 600
; 4
Send, {w down}{space down}
sleep 300
Send, {space up}
sleep 400
Send, {w up}
sleep 400
Send, {w down}{space down}
sleep 300
Send, {space up}
sleep 50
Send, {w up}
sleep 300
Send, {d down}
sleep 10
Send, {w down}
sleep 400
Send, {d up}{w up}
sleep 300
Send, {space down}{d down}{w down}
sleep 100
Send, {space up}
sleep 250
Send, {d up}{w up}
sleep 300
Send, {space down}
sleep 100
Send, {space up}{w down}{d down}
sleep 400
Send, {w up}{d up}
sleep 400
Send, {space down}{d down}{w down}
sleep 100
Send, {space up}
sleep 450
Send, {d up}{w up}
; 5
Send, {a down}{space down}
sleep 250
Send, {w down}{d down}{a up}{space up}
sleep 400
Send, {w up}{d up}
sleep 400
Send, {s down}
sleep 10
Send, {d down}{space down}{s up}
sleep 350
Send, {d up}{space up}
sleep 500
Send, {w down}
sleep 150
Send, {d down}
sleep 450
Send, {w up}{d up}
sleep 400
Send, {a down}{space down}
sleep 200
Send, {a up}{space up}
sleep 400
Send, {d down}{space down}
sleep 100
Send, {space up}
sleep 500
Send, {d up}
sleep 300
Send, {w down}{a down}
sleep 150
Send, {a up}
sleep 400
Send, {w up}
sleep 400
Send, {space down}
sleep 100
Send, {space up}
sleep 50
Send, {w down}
sleep 300
Send, {w up}
sleep 300
sleep 300
Loop, 33
{
    mouseXY(10,0)
    sleep 1
}
sleep 400
Send, {d down}{space down}
sleep 200
Send, {x down}
sleep 400
Send, {x up}{space up}{d up}{w down}
sleep 400
Send, {w up}{a down}
sleep 600
Loop, 33
{
    mouseXY(-10,0)
    sleep 1
}
sleep 300
Send, {a up}{w down}
sleep 300
Send, {w up}
; 6
Send, {s down}
sleep 260
Send, {s up}{d down}
sleep 400
Send, {d up}
sleep 400
Send, {w down}{d down}
sleep 400
Send, {w up}{d up}
sleep 400
Send, {s down}
sleep 110
Send, {s up}
sleep 200
Send, {space down}{d down}
sleep 450
Send, {space up}
sleep 200
Send, {d up}
sleep 400
Send, {w down}
sleep 200
Send, {w up}
sleep 300
Send, {d down}
sleep 550
Send, {d up}{a down}{w down}
sleep 500
Send, {a up}{w up}
sleep 200
Send, {s down}
sleep 100
Send, {s up}{a down}
sleep 300
Send, {w down}
sleep 400
Send, {a up}{w up}
sleep 400
Send, {space down}{a down}
sleep 100
Send, {space up}
sleep 300
Send, {a up}
sleep 400
Send, {space down}{a down}
sleep 100
Send, {space up}
sleep 600
Send, {a up}{w down}
sleep 400
Send, {w up}
sleep 400
Send, {space down}{a down}
sleep 100
Send, {space up}
sleep 200
Send, {space down}
sleep 100
Send, {space up}
sleep 400
Send, {a up}
sleep 400
Send, {w down}{a down}
sleep 400
Send, {w up}{a up}
; 7
Send, {s down}
sleep 150
Send, {s up}
sleep 200
Send, {a down}
sleep 600
Send, {a up}
sleep 200
Send, {w down}
sleep 1100
Send, {w up}
Loop, 50
{
    mouseXY(10,0)
    sleep 1
}
sleep 500
Send, {space down}{w down}
sleep 50
Send, {space up}
sleep 2100
Send, {w up}
sleep 500
Send, {e down}
sleep 200
Send, {e up}
sleep 500
Send, {Esc down}
sleep 400
Send, {Esc up}
sleep 400
Send, {r down}
sleep 400
Send, {r up}
sleep 400
GuiControl,, StatusText, Current Task : finished
Send, {enter down}
sleep 400
Send, {enter up}
sleep 6000
Send, {shift down}
sleep 200
Send, {shift up}
; resoaunce end
}


; start of obby

if (DoObby)
{
GuiControl,, StatusText, Current Task : doing normal obby
Clipboard :=
sleep 500
Clipboard := Obby
sleep 500
Send, {Esc down}
sleep 400
Send, {Esc up}
sleep 400
Send, {r down}
sleep 400
Send, {r up}
sleep 400
Send, {enter down}
sleep 400
Send, {enter up}
sleep 6000
;fail safe 1 : check if auto roll is off
PixelSearch, x, y, 804, 1017, 804, 1017, 0xFFFFFF, 1, RGB
if !ErrorLevel
{
Click, 804, 1017
}
sleep 500
; fail safe 2 : disable shift lock if its on (and reenable it)
Send, {esc down}
sleep 500
Send, {esc up}
sleep 500
Send, {tab down}
sleep 400
Send, {tab up}
sleep 300
Send, {right down}
sleep 100
Send, {right up}
sleep 300
Send, {right down}
sleep 100
Send, {right up}
sleep 300
Send, {esc down}
sleep 500
Send, {esc up}
sleep 500
;fail safe 3 : disables chat if its enabled
PixelSearch, x, y, 131, 28, 131, 28, 0xFFFFFF, 10, RGB
if !ErrorLevel
{
Click, 131, 28
}
sleep 500
Click, 1413, 298
MouseMove, 1459, 269
sleep 200
Click, 1459, 269
sleep 200
MouseMove, 29, 456
sleep 100
Click, 29, 456
sleep 500
Send, {%Navkey% down}
sleep 500
Send, {%Navkey% up}
sleep 200
Loop, 15
{
    Send, {w down}{w up}
}
sleep 200
Send, {enter down}
sleep 200
Send, {enter up}
sleep 300
Send, {%Navkey% down}
sleep 500
Send, {%Navkey% up}
sleep 1000
MouseMove, 32, 429
sleep 200
Click, 32, 429
sleep 200
MouseMove, 861, 364
sleep 200
Click, 861, 364
Send, {Ctrl Down}
sleep 200
Send, {v down}
sleep 200
Send, {Ctrl up}{v up}
sleep 500
MouseMove, 820, 438
sleep 500
Loop, 20
{
    Send, {Wheelup}
}
sleep 1000
MouseMove, 820, 438
sleep 200
Click, 820, 438
sleep 300
MouseMove, 630, 635 
sleep 200
Click, 630, 635
sleep 200
MouseMove, 32, 429
sleep 200
Click, 32, 429
sleep 200
Send, {w down}{shift down}
sleep 300
Send, {w up}{shift up}
sleep 200
Send, {d down}
sleep 6000
Send, {d up}
sleep 200
Send, {s down}
sleep 500
Send, {d down}
sleep 2000
Send, {s up}{d up}
sleep 200
Send, {w down}
sleep 1000
Send, {d down}
sleep 300
Send, {d up}
sleep 200
Send, {w down}{d down}
sleep 15000
Send, {w up}{d up}
sleep 400
Send, {s down}{a down}
sleep 200
Send, {s up}{a up}
sleep 300
Send, {w down}{d down}{space down}
sleep 400
Send, {space up}
sleep 1000
Send, {w up}
sleep 4000
Send, {w down}
sleep 1500
Send, {w up}{s up}
Send, {a down}
sleep 300
Send, {a up}
sleep 200
Send, {space down}{w down}
sleep 400
Send, {space up}
sleep 400
Send, {d down}
sleep 700
Send, {d up}{w up}
sleep 300
Send, {a down}
sleep 200
Send, {a up}
sleep 200
Send, {space down}{d down}
sleep 400
Send, {space up}{d up}
sleep 400
Send, {s down}
sleep 200
Send, {s up}
sleep 200
Send, {w down}{space down}
sleep 500
Send, {space up}
sleep 1000
Send, {d down}
sleep 700
Send, {d up}{w up}
sleep 500
Send, {s down}{a down}
sleep 300
Send, {s up}{a up}
sleep 400
Send, {w down}{space down}
sleep 500
Send, {w up}{space up}
sleep 400
Send, {d down}
sleep 950
Send, {d up}
sleep 400
Send, {w down}
sleep 300
Send, {a down}
sleep 700
Send, {w up}{a up}
sleep 400
Send, {d down}{s down}
sleep 150
Send, {d up}{s up}
sleep 400
Send, {w down}{space down}
sleep 800
Send, {w up}{space up}
sleep 500
Send, {s down}{a down}
sleep 500
Send, {s up}
sleep 1000
Send, {a up}
sleep 400
Send, {shift down}
sleep 300
Send, {shift up}
sleep 500
sleep 3000
MouseMove, 32, 429
sleep 200
Click, 32, 429
sleep 200
MouseMove, 861, 364
sleep 200
Click, 861, 364
Send, {Ctrl Down}
sleep 200
Send, {v down}
sleep 200
Send, {Ctrl up}{v up}
sleep 500
MouseMove, 820, 438
sleep 500
Loop, 20
{
    Send, {Wheelup}
}
sleep 1000
MouseMove, 820, 438
sleep 200
Click, 820, 438
sleep 300
MouseMove, 630, 635 
sleep 200
Click, 630, 635
sleep 400
MouseMove, 1413, 297 
sleep 400
Click, 1413, 297
GuiControl,, StatusText, Current Task : finished
sleep 400
Send, {Esc down}
sleep 400
Send, {Esc up}
sleep 400
Send, {r down}
sleep 400
Send, {r up}
sleep 400
Send, {enter down}
sleep 400
Send, {enter up}
sleep 6000
}

if (caveobby)
{
; go to stella
GuiControl,, StatusText, Current Task : doing cave obby
WinActivate, ahk_exe RobloxPlayerBeta.exe
sleep 400
Clipboard :=
sleep 400
Clipboard := Aura
ClipWait, 1
sleep 500
Send, {Esc down}
sleep 400
Send, {Esc up}
sleep 400
Send, {r down}
sleep 400
Send, {r up}
sleep 400
Send, {enter down}
sleep 400
Send, {enter up}
sleep 6000
;fail safe 1 : check if auto roll is off
PixelSearch, x, y, 804, 1017, 804, 1017, 0xFFFFFF, 1, RGB
if !ErrorLevel
{
Click, 804, 1017
}
sleep 500
; fail safe 2 : disable shift lock if its on (and reenable it)
Send, {esc down}
sleep 500
Send, {esc up}
sleep 500
Send, {tab down}
sleep 400
Send, {tab up}
sleep 300
Send, {right down}
sleep 100
Send, {right up}
sleep 300
Send, {right down}
sleep 100
Send, {right up}
sleep 300
Send, {esc down}
sleep 500
Send, {esc up}
sleep 500
;fail safe 3 : disables chat if its enabled
PixelSearch, x, y, 131, 28, 131, 28, 0xFFFFFF, 10, RGB
if !ErrorLevel
{
Click, 131, 28
}
sleep 500
Click, 1413, 298
MouseMove, 1459, 269
sleep 200
Click, 1459, 269
sleep 200
MouseMove, 29, 456
sleep 100
Click, 29, 456
sleep 500
Send, {%Navkey% down}
sleep 200
Send, {%Navkey% up}
sleep 200
Loop, 15
{
    Send, {w down}{w up}
}
sleep 200
Send, {enter down}
sleep 200
Send, {enter up}
sleep 300
Send, {%Navkey% down}
sleep 200
Send, {%Navkey% up}
sleep 1000

; path to cualdrin stars here
Send, {click right down}
sleep 500
sleep 200
Send, {click right up}
sleep 500
if (disableautoroll)
{
MouseMove, 755, 1003
sleep 200
Click, 755, 1003
}
sleep 300
sleep 1000
Send, {shift down}
Send, {s down}
sleep 5000
Send, {s up}{shift up}
sleep 200
Send, {w down}
sleep 200
Send, {w up}
sleep 200
Send, {a down}
sleep 5000
Send, {a up}
sleep 200
Send, {w down}
sleep 150
Send, {w up}
sleep 200
Send, {s down}{space down}
sleep 200
Send, {space up}
sleep 4000
Send, {s up}
sleep 200
Send, {w down}
sleep 100
Send, {w up}
sleep 200
Send, {s down}{space down}
sleep 200
Send, {space up}
sleep 500
Send, {a down}
sleep 300
Send, {a up}
sleep 3000
Send, {s up}
sleep 200
Send, {w down}
sleep 200
Send, {w up}
sleep 200
Send, {a down}
sleep 3000
Send, {s down}
sleep 1500
Send, {s up}{a up}
sleep 200
Send, {d down}{shift down}
sleep 500
Send, {d up}{shift up}
sleep 200
Send, {s down}
sleep 1000
Send, {s up}
MouseMove, 32, 429
sleep 200
Click, 32, 429
sleep 200
MouseMove, 861, 364
sleep 200
Click, 861, 364
Send, {Ctrl Down}
sleep 200
Send, {v down}
sleep 200
Send, {Ctrl up}{v up}
sleep 500
SetKeyDelay, 1
MouseMove, 820, 438
sleep 500
Loop, 20
{
    Send, {Wheelup}
}
sleep 1000
Click, 820, 438
sleep 200
MouseMove, 627, 631
sleep 200
Click, 627, 631
sleep 200
MouseMove, 32, 429
sleep 200
Click, 32, 429
Sleep 700
Send, {s down}{space down}
sleep 400
Send, {x down}
sleep 200
Send, {x up}{s up}{space up}
sleep 200
Send, {shift down}
sleep 200
Send, {shift up}
sleep 200
Send, {s down}{space down}
sleep 3500
Send, {space up}{a down}
sleep 1000
Send, {s up}{a up}
sleep 200
Send, {w down}
sleep 700
Send, {w up}
sleep 200
Send, {a down}
sleep, 1300
Send, {a up}{s down}
sleep 1500
Send, {s up}
sleep 5000
Sleep 200
    ;start cave
    GuiControl,, StatusText, Current Task : pathing to cave
Send, {d down}
sleep 400
sleep 5000
Send, {s down}
sleep 600
Send, {s up}{d up}
sleep 400
Send, {s down}{a down}
sleep 2000
Send, {space down}
sleep 200
Send, {space up}
sleep 2000
Send, {s up}{a up}
sleep 500
Send, {w down}
sleep 300
Send, {a down}
sleep 400
Send, {w up}{a up}
sleep 500
Send, {s down}{d down}
sleep 500
Send, {a down}{s up}{d up}
sleep 3000
Send, {a up}
sleep 600
Send, {w down}{a down}
sleep 2500
Send, {w up}{a up}
sleep 500
Send, {w down}{a down}{space down}
sleep 900
Send, {space up}
sleep 1300
Send, {w up}{a up}
sleep 300
Send, {d down}
sleep 1500
Send, {d up}
sleep 400
Send, {a down}
sleep 400
Send, {a up}
sleep 400
Send, {w down}
sleep 2000
Send, {a down}
sleep 200
Send, {a up}
sleep 800
Send, {w up}
sleep 500
Send, {w down}
sleep 3000
Send, {w up}
sleep 300
Send, {s down}
sleep 600
Send, {space down}
sleep 500
Send, {space up}
sleep 3000
Send, {s up}{d down}
sleep 600
Send, {d up}
sleep 300
Send, {s down}{space down}
sleep 200
Send, {space up}
sleep 2000
Send, {s up}{a down}
sleep 300
Send, {s down}{space down}{a up}
sleep 300
Send, {space up}
sleep 1500
Send, {s up}{a down}
sleep 500
Send, {a up}
sleep 500
Send, {w down}
sleep 200
Send, {w up}
sleep 500
Send, {a down}
sleep 900
Send, {a up}{s down}
sleep 1200
Send, {s up}{d down}
sleep 100
Send, {w down}
sleep 500
Send, {w up}{d up}
sleep 300
Send, {s down}
sleep 800
Send, {space down}
sleep 200
Send, {space up}
sleep 600
Send, {d down}
sleep 200
Send, {d up}{s up}
sleep 500
Send, {a down}
sleep 200
Send, {a up}{s down}
sleep 800
Send, {s up}
sleep 600
Send, {d down}
sleep 600
Send, {w down}
sleep 300
Send, {d up}{w up}
sleep 400
Send, {s down}
sleep 1300
Send, {s up}{w down}{d down}
sleep 700
Send, {w up}{d up}
sleep 400
Send, {s down}
sleep 5000
Send, {s up}
sleep 300
Send, {w down}{d down}
sleep 600
Send, {w up}{d up}
sleep 500
Send, {space down}{w down}
sleep 200
Send, {space up}
sleep 300
Send, {w up}
sleep 400
Send, {space down}{s down}{d down}
sleep 100
Send, {space up}
sleep 400
Send, {s up}{d up}
sleep 400
Send, {space down}
sleep 10
Send, {w down}
sleep 300
Send, {w up}{space up}
sleep 500
Send, {space down}{s down}
sleep 300
Send, {space up}
sleep 200
Send, {s up}
sleep 500
mouseXY(0, 1)
Loop, 137
{
mouseXY(10, 0)
sleep 1
}
sleep 500
Send, {a down}
sleep 200
Send, {a up}
sleep 200
Send, {w down}
sleep 250
Send, {w up}
Send, {space down}
sleep 100
Send, {w down}{x down}
sleep 400
Send, {w up} {x up}{a down}
sleep 2000
Send, {a up}
Loop, 10
{
mouseXY(0, 1)
}
sleep 200
Loop, 37
{
mouseXY(-10, 0)
sleep 5
}
sleep 500
Send, {d down}
sleep 550
Send, {d up}{a down}{w down}
sleep 1000
Send, {a up}{w up}
sleep 500
Send, {w down}
sleep 500
Send, {w up}{a down}{s down}
sleep 1000
Send, {a up}{s up}
sleep 400
Send, {d down}
sleep 200
Send, {d up}
sleep 300
Send, {a down}
sleep 200
Send, {s down}
sleep 300
Send, {w down}{a up}{s up}
sleep 200
Send, {w up}
sleep 200
Send, {space down}{a down}
sleep 300
Send, {space up}{a up}
sleep 400
Send, {w down}
sleep 400
Send, {space down}
sleep 200
Send, {x down}
sleep 200
Send, {x up}{space up}
sleep 2000
Send, {a down}
sleep 1000
Send, {a up}{w up}
sleep 300
Send, {w down}{space down}
sleep 200
Send, {space up}
sleep 1000
Send, {w up}{s down}
sleep 150
Send, {s up}{d down}
sleep 400
Send, {w down}
sleep 500
Send, {w up}
sleep 4000
Send, {d up}
sleep 500
GuiControl,, StatusText, Current Task : finished
Send, {esc down}
sleep 500
Send, {esc up}
sleep 500
Send, {r down}
sleep 500
Send, {r up}
sleep 500
Send, {enter down}
sleep 500
Send, {enter up}
sleep 6000
Send, {shift down}
sleep 500
Send, {shift up}
sleep 500
if (disableautoroll)
{
MouseMove, 755, 1003
Click, 755, 1003
}
;unequip aura
MouseMove, 32, 429
sleep 200
Click, 32, 429
sleep 200
MouseMove, 861, 364
sleep 200
Click, 861, 364
Send, {Ctrl Down}
sleep 200
Send, {v down}
sleep 200
Send, {Ctrl up}{v up}
sleep 500
MouseMove, 820, 438
sleep 500
Loop, 20
{
    Send, {Wheelup}
}
sleep 1000
MouseMove, 820, 438
sleep 200
Click, 820, 438
sleep 300
MouseMove, 630, 635 
sleep 200
Click, 630, 635
sleep 200
MouseMove, 32, 429
sleep 200
Click, 32, 429
sleep 200
}






;start of stella path end of obby
if (crafter)
{
    GuiControl,, StatusText, Current Task : crafting potions
WinActivate, ahk_exe RobloxPlayerBeta.exe
sleep 1000
Clipboard :=
sleep 400
Clipboard := Aura
ClipWait, 1
sleep 500
Send, {Esc down}
sleep 400
Send, {Esc up}
sleep 400
Send, {r down}
sleep 400
Send, {r up}
sleep 400
Send, {enter down}
sleep 400
Send, {enter up}
sleep 6000
;fail safe 1 : check if auto roll is off
PixelSearch, x, y, 804, 1017, 804, 1017, 0xFFFFFF, 1, RGB
if !ErrorLevel
{
Click, 804, 1017
}
sleep 500
; fail safe 2 : disable shift lock if its on (and reenable it)
Send, {esc down}
sleep 500
Send, {esc up}
sleep 500
Send, {tab down}
sleep 400
Send, {tab up}
sleep 300
Send, {right down}
sleep 100
Send, {right up}
sleep 300
Send, {right down}
sleep 100
Send, {right up}
sleep 300
Send, {esc down}
sleep 500
Send, {esc up}
sleep 500
;fail safe 3 : disables chat if its enabled
PixelSearch, x, y, 131, 28, 131, 28, 0xFFFFFF, 10, RGB
if !ErrorLevel
{
Click, 131, 28
}
sleep 500
Click, 1413, 298
MouseMove, 1459, 269
sleep 200
Click, 1459, 269
sleep 200
MouseMove, 29, 456
sleep 100
Click, 29, 456
sleep 500
Send, {%Navkey% down}
sleep 200
Send, {%Navkey% up}
sleep 200
Loop, 15
{
    Send, {w down}{w up}
}
sleep 200
Send, {enter down}
sleep 200
Send, {enter up}
sleep 300
Send, {%Navkey% down}
sleep 200
Send, {%Navkey% up}
sleep 1000

; path to cualdrin stars here
Send, {click right down}
sleep 500
sleep 200
Send, {click right up}
sleep 500
Send, {shift down}
Send, {s down}
sleep 5000
Send, {s up}{shift up}
sleep 200
Send, {w down}
sleep 200
Send, {w up}
sleep 200
Send, {a down}
sleep 5000
Send, {a up}
sleep 200
Send, {w down}
sleep 150
Send, {w up}
sleep 200
Send, {s down}{space down}
sleep 200
Send, {space up}
sleep 4000
Send, {s up}
sleep 200
Send, {w down}
sleep 100
Send, {w up}
sleep 200
Send, {s down}{space down}
sleep 200
Send, {space up}
sleep 500
Send, {a down}
sleep 300
Send, {a up}
sleep 3000
Send, {s up}
sleep 200
Send, {w down}
sleep 200
Send, {w up}
sleep 200
Send, {a down}
sleep 3000
Send, {s down}
sleep 1500
Send, {s up}{a up}
sleep 200
Send, {d down}{shift down}
sleep 500
Send, {d up}{shift up}
sleep 200
Send, {s down}
sleep 1000
Send, {s up}
MouseMove, 32, 429
sleep 200
Click, 32, 429
sleep 200
MouseMove, 861, 364
sleep 200
Click, 861, 364
Send, {Ctrl Down}
sleep 200
Send, {v down}
sleep 200
Send, {Ctrl up}{v up}
sleep 500
SetKeyDelay, 1
MouseMove, 820, 438
sleep 500
Loop, 20
{
    Send, {Wheelup}
}
sleep 1000
Click, 820, 438
sleep 200
MouseMove, 627, 631
sleep 200
Click, 627, 631
sleep 200
MouseMove, 32, 429
sleep 200
Click, 32, 429
Sleep 700
Send, {s down}{space down}
sleep 400
Send, {x down}
sleep 200
Send, {x up}{s up}{space up}
sleep 200
Send, {shift down}
sleep 200
Send, {shift up}
sleep 200
Send, {s down}{space down}
sleep 3500
Send, {space up}{a down}
sleep 1000
Send, {s up}{a up}
sleep 200
Send, {w down}
sleep 700
Send, {w up}
sleep 200
Send, {a down}
sleep, 1300
Send, {a up}{s down}
sleep 1500
Send, {s up}
sleep 5000
Send, {shift down}
sleep 200
Send, {shift up}
sleep 500
MouseMove, 32, 429
sleep 200
Click, 32, 429
sleep 200
MouseMove, 861, 364
sleep 200
Click, 861, 364
SetKeyDelay, 10
Send, {Ctrl Down}
sleep 200
Send, {v down}
sleep 200
Send, {Ctrl up}{v up}
SetKeyDelay, 1
sleep 500
MouseMove, 820, 438
sleep 200
Click, 820, 438
sleep 200
MouseMove, 627, 631
sleep 200
Click, 627, 631
sleep 200
MouseMove, 32, 429
sleep 200
Click, 32, 429
Sleep 200
Send, {a down}
sleep 1000
Send, {a up}
sleep 500
Send, {f down}
sleep 500
Send, {f up}
sleep 2000
; CRAFTING TIME BITCH!!
MouseMove, 1620, 459
sleep 500
Loop, 40
{
    Send, {WheelDown}
}
sleep 500
Loop, 4
{
    Send, {WheelUp}
    sleep 500
}
sleep 1000
MouseMove, 1618, 319 ; POTION OF BOUND
GuiControl,, StatusText, Current Task : crafting potion of bound
sleep 200
Click, 1618, 319 ; ALSO POTION OF BOUND
sleep 200
MouseMove, 257, 824 ; view recipie
sleep 200
Click, 257, 824 ; view recipe
sleep 200
Loop, 5
{
MouseMove, 837, 684 ; ad all
sleep 200
Click, 837, 684 ; add all
sleep 200
MouseMove, 1094, 682 ; craft all
sleep 200
Click, 1094, 682 ; craft all
sleep, 200
MouseMove, 837, 684 ; ad all
sleep 200
Click, 837, 684 ; add all
sleep 200
}
MouseMove, 1618, 425 ; POTION OF HEAVEN SHIT
GuiControl,, StatusText, Current Task : crafting potion of heavenly
sleep 200
Click, 1618, 425 ; ALSO POTION OF HEAVEN
sleep 200
; paste this below brick to add another potion dude 
MouseMove, 257, 824 ; RECIPIE
sleep 200
Click, 257, 824 ; recipie
sleep 200
Loop, 5
{
MouseMove, 837, 684 ; ad all
sleep 200
Click, 837, 684 ; add all
sleep 200
MouseMove, 1094, 682 ; craft all
sleep 200
Click, 1094, 682 ; craft all
sleep, 200
MouseMove, 837, 684 ; ad all
sleep 200
Click, 837, 684 ; add all
sleep 200
}
sleep 200
MouseMove, 1094, 682
sleep 200
Click, 1094, 682
; paste the brick above for another ptoiion dude ^ make sure its on the screen after scrolling to the very bottom then scrolling up exactly 4 times or else the macro will miss it
sleep, 200
MouseMove, 1850, 180 ; THE SIGMA EXIT BUTTON
sleep 200
Click, 1850, 180 ; also exit sigma button you know the drill
GuiControl,, StatusText, Current Task : finished
sleep 500
}
; CLEAN UP / END OF MACRO TO GO BACK TO DEH FISHING!!!!!!!!!
GuiControl,, StatusText, Current Task : pathing to fishing spot
sleep 500
Send, {Esc down}
sleep 200
Send, {Esc up}
sleep 200
Send, {r down}
sleep 200
Send, {r up}
sleep 200
Send, {enter down}
sleep 200
Send, {enter up}
sleep 6000
Send, {click right down}
sleep 500
sleep 200
Send, {click right up}
sleep 500
MouseMove, 1459, 269
sleep 200
Click, 1459, 269
sleep 200
Click, 1413, 298
MouseMove, 29, 456
sleep 100
Click, 29, 456
sleep 500
Send, {%Navkey% down}
sleep 200
Send, {%Navkey% up}
sleep 200
Loop, 15
{
    Send, {w down}{w up}
}
sleep 200
Send, {enter down}
sleep 200
Send, {enter up}
sleep 300
Send, {%Navkey% down}
sleep 200
Send, {%Navkey% up}
sleep 2000
; GO BACK TO FISHING SPOT AND START FISHING
Send, {a down}{shift down}
sleep 200
Send, {shift up}
sleep 5800
Send, {a up}
sleep 200
Send, {d down}
sleep 400
Send, {d up}
sleep 200
Send, {w down}
sleep 700
Send, {a down}
sleep 1500
Send, {w up}{a up}
sleep 300
Send, {s down}{d down}
sleep 400
Send, {s up}{d up}
sleep 500
Send, {a down}{space down}
sleep 300
Send, {space up}
sleep 2000
Send, {s down}
sleep 600
Send, {s up}{a up}
sleep 200
Send, {d down}
sleep 300
Send, {d up}
sleep 200
Send, {a down}{space down}
sleep 300
Send, {space up}
sleep 3000
Send, {a up}{shift down}
sleep 200
Send, {shift up}
sleep 1500
; this holds W for a random amount of time incase theres someone already in the fishing spot
Random, WLENGTH, 200, 1500
Send, {w down}
sleep %WLENGTH%
Send, {w up}
sleep 500
; FISHING LOOP
GuiControl,, StatusText, Current Task :catching %fishcount% fish
Loop, %fishcount% {
MouseMove, 851, 834
sleep 40
GuiControl,, StatusText, Current Task : casting..
Click, 851, 834
sleep 100
MouseMove, 838, 974
sleep 300

Fish := 0

; check if minigame has started
Fishtimer := A_TickCount

Loop
{
    if (A_TickCount - Fishtimer > 20000)
    {
        Click, 860, 836
        sleep 400
        Send, {esc down}
        sleep 400
        Send {esc up}
        sleep 400
        Send, {r down}
        sleep 400
        Send, {r up}
        sleep 400
        Send, {enter down}
        sleep 400
        Send, {enter up}
        sleep 500
        Click, 860, 836
        sleep 400
        Send, {esc down}
        sleep 400
        Send, {esc up}
        sleep 400
        Send, {r down}
        sleep 400
        Send, {r up}
        sleep 400
        Send, {enter down}
        sleep 400
        Send, {enter up}
        sleep 500
        Reload
    }

    PixelGetColor, gui, 712, 718, RGB
    if (gui = 0xFFFFFF)
    {
        Sleep 70
        GuiControl,, StatusText, Current Task : minigame started!
        PixelGetColor, Fish, 935, 763, RGB
        break
    }
    sleep 10
}

; time to fisch.. wrong game
Fishtimer := 0
Fishtimer := A_TickCount

Loop
{
    if (A_TickCount - Fishtimer > 9000)
        break

    ; fishing minigame
    PixelSearch, X, Y, 757, 780, 1161, 757, Fish, 5, Fast RGB

    if (ErrorLevel != 0)
    {
        Send, {click down}
        sleep 2
        Send, {click up}
        sleep 10
        PixelSearch, X, Y, 716, 718, 716, 718, 0xFFFFFF, 1, RGB
        if ErrorLevel
        {
            break
        }
        Else
        {
            continue
        }
Return
    }

    sleep 10
}
sleep 400
Loop,
{
GuiControl,, StatusText, Current Task : closing fish gui
PixelSearch, X, Y, 1113, 341, 1113, 341, 0xEEEEED, 30, Fast RGB
if !ErrorLevel
{
    Click, 1113, 341
    break
}
Else
{
    sleep 500
    Continue
}
}
sleep 600
}
;END OF FISH LOOP START OF SELL LOOP
GuiControl,, StatusText, Current Task : selling %sellcount% fish
Send, {Esc down}
sleep 400
Send, {Esc up}
sleep 400
Send, {r down}
sleep 400
Send, {r up}
sleep 400
Send, {enter down}
sleep 400
Send, {enter up}
sleep 6000
;fail safe 1 : check if auto roll is off
PixelSearch, x, y, 804, 1017, 804, 1017, 0xFFFFFF, 1, RGB
if !ErrorLevel
{
Click, 804, 1017
}
sleep 500
; fail safe 2 : disable shift lock if its on (and reenable it)
Send, {esc down}
sleep 500
Send, {esc up}
sleep 500
Send, {tab down}
sleep 400
Send, {tab up}
sleep 300
Send, {right down}
sleep 100
Send, {right up}
sleep 300
Send, {right down}
sleep 100
Send, {right up}
sleep 300
Send, {esc down}
sleep 500
Send, {esc up}
sleep 500
;fail safe 3 : disables chat if its enabled
PixelSearch, x, y, 131, 28, 131, 28, 0xFFFFFF, 10, RGB
if !ErrorLevel
{
Click, 131, 28
}
sleep 500
MouseMove, 1459, 269
sleep 200
Click, 1459, 269
sleep 200
Click, 1413, 298
MouseMove, 29, 456
sleep 100
Click, 29, 456
sleep 500
Send, {%Navkey% down}
sleep 200
Send, {%Navkey% up}
sleep 200
Loop, 15
{
    Send, {w down}{w up}
}
sleep 200
Send, {enter down}
sleep 200
Send, {enter up}
sleep 300
Send, {%Navkey% down}
sleep 200
Send, {%Navkey% up}
sleep 2000
Send, {shift down}{a down}{w down}
sleep 100
Send, {shift up}
sleep 5000
Send, {a up}{w up}{d down}
sleep 600
Send, {d up}{a down}{w down}
sleep 1500
Send, {a up}{w up}
sleep 500
loop, 3
{
Send, {s down}
sleep 200
Send, {s up}
sleep 300
Send, {space down}{w down}
sleep 100
Send, {space up}
sleep 800
Send, {w up}
sleep 400
}
sleep 500
Send, {shift down}
sleep 600
Send, {shift up}
sleep 400
Send, {e down}
sleep 300
Send, {e up}
sleep 400
MouseMove, 986, 817 
sleep 300
Send, {click down}
sleep 100
Send, {Click up}
sleep 1000
MouseMove, 968, 945
sleep 300
Click, 968, 945
sleep 3000
; sell loop
GuiControl,, StatusText, Current Task : selling
Loop, %SellCount%
{
GuiControl,, StatusText, Current Task : checking if fish
PixelSearch, X, Y, 767, 450, 884, 449, 0xFFFFFF, 5, Fast RGB
    if !ErrorLevel
    {
        GuiControl,, StatusText, Current Task : found fish, selling it
        Click, 830, 405
        sleep 50
        Click, 671, 805
        sleep 50
        Click, 818, 625
        sleep 500
    }
    Else
    {
        break
    }
}
GuiControl,, StatusText, Current Task : cleaning up..
Click, 1459, 268
sleep 400
Send, {Esc down}
sleep 400
Send, {Esc up}
sleep 400
Send, {r down}
sleep 400
Send, {r up}
sleep 400
Send, {enter down}
sleep 400
Send, {enter up}
sleep 6000
Reload
Return


close := "F4"

Hotkey, %close%, CloseApp  

CloseApp:
ExitApp
Return