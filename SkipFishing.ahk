#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%

/*

dont run this, this is just used for Solium.ahk 


*/
ConfigFile := A_ScriptDir "\soliumconfig.ini"
IniRead, Navkey, %ConfigFile%, Settings, NavKey
IniRead, FishCount, %ConfigFile%, Settings, FishCount
IniRead, SellCount, %ConfigFile%, Settings, SellCount

WinActivate, ahk_exe RobloxPlayerBeta.exe
sleep 600
sleep 600
Loop, %FishCount%
{
MouseMove, 851, 834
sleep 40
Click, 851, 834
sleep 100
MouseMove, 838, 974
sleep 300

Fish := 0
Fishtimer := A_TickCount
; check if minigame has started
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
        PixelGetColor, Fish, 935, 763, RGB
        break
    }
    sleep 10
}

; PixelSearch loop
Fishtimer := 0
sleep 100
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

; fish got away : FF4141. coords : 838, 360. trash : BABABA.... coords to see if fish caught gui is open. 781, 315
sleep 400
Loop, 15
{
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
sleep 500
Send, {Esc down}
sleep 500
Send, {Esc up}
sleep 500
Send, {r down}
sleep 500
Send, {r up}
sleep 500
Send, {enter down}
sleep 500
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
Send, {shift down}{e down}
sleep 400
Send, {shift up}{e up}
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
Loop, %SellCount%
{
PixelSearch, X, Y, 767, 450, 884, 449, 0xFFFFFF, 5, Fast RGB
    if !ErrorLevel
    {
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
Run, macro.ahk







/*
; test loop for potential webhook support that says if you caught a fish or not
Loop, 20
{
    PixelSearch, X, Y, 780, 318, 780, 318, 0xFFFFFF, 5, RGB
    if !ErrorLevel
    {
        break
    }
    Else
    {
    Sleep, 500
    Continue
    }
}
    sleep 600
    if !ErrorLevel
    {
    PixelSearch, X, Y, 852, 361, 852, 361 ,0xFFFFFF, 5, RGB
    if !ErrorLevel
    {
        msgbox, fish caught
    }
    Else
    {
    msgbox, checking red
    PixelSearch, X, Y, 852, 361, 852, 361, 0xFF4141, 5, RGB
    if !ErrorLevel
    {
        msgbox, fish got away
    }
    Else
    {
        msgbox, checking trash
        PixelSearch, X, Y, 852, 361, 852, 361, 0xBABABA, 5, RGB
        if !ErrorLevel
        {
            msgbox, fish caught
        }
    }
    }
    Return
}
Else
{
    msgbox, fish gui not found
}
*/
Return

F4::Exitapp