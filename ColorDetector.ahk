#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

color := ""
flag := False

Gui, +AlwaysOnTop -SysMenu
Gui, Show, w50 h50 Hide, Preview

SetTimer, Control, 50
Return

F1::
If (flag := !flag)
{
    Gui, Show
}
Return

F3::
if flag
{
    Clipboard := color
}
Return

End::
ExitApp
Return

Control:
If (flag)
{
    Gosub, ShowColor
}
Else
{
    Gui, Hide
    ToolTip
}
Return

ShowColor:
MouseGetPos, posX, posY
PixelGetColor, color, % posX, posY, RGB
Gui, Color, %color%
color := Format("#{:X}", color)
ToolTip, % color, posX + 10, posY + 10
Return
