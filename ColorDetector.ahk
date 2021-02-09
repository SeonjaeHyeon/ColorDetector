#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

color := ""
flag := False

F1::
flag := !flag
if flag
    SetTimer, ShowToolTip, 50
Else
{
    SetTimer, ShowToolTip, Off
    Gui, Hide
    ToolTip
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
