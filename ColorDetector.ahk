#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

color := ""
flag := False
flag2 := True

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

F4::
If (flag)
{
    Gui, % (flag2 := !flag2) ? "Show" : "Hide"
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
