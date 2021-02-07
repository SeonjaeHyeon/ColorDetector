#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

F1::
flag := !flag
if flag
    SetTimer, ShowToolTip, 50
Else
    SetTimer, ShowToolTip, Off
    ToolTip
Return

End::
ExitApp
Return

ShowToolTip:
MouseGetPos, posX, posY
PixelGetColor, color, % posX, posY, RGB
ToolTip, % Format("#{:X}", color), posX + 10, posY + 10
Return
