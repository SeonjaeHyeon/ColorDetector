#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

color := ""
flag := False
SetTimer, Control, 50

F1::
flag := !flag
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
    Gosub, ShowToolTip
}
Else
{
    Gui, Hide
    ToolTip
}
Return

ShowPreviewGui:
Gui, +AlwaysOnTop -SysMenu
Gui, Color, %color%
Gui, Show, w50 h50, Preview
Return

ShowToolTip:
MouseGetPos, posX, posY
PixelGetColor, color, % posX, posY, RGB
Gosub, ShowPreviewGui
color := Format("#{:X}", color)
ToolTip, % color, posX + 10, posY + 10
Return
