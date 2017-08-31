#Persistent
#SingleInstance

CoordMode, Mouse, Screen
CoordMode, Window, Screen	
SetTitleMatchMode, 3

return

^+1::
	WinSet, ExStyle, +0x20, A
	WinSet, AlwaysOnTop, On, A

	WinGet, WinTrans, Transparent, A

	if (WinTrans = "" || WinTrans = 255) {
		WinSet, Transparent, 99, A
	}
return

^+2::
	MouseGetPos, MouseX, MouseY, MouseWin
	
	WinGet windows, List
	Loop %windows%
	{
		id := windows%A_Index%
		WinGetTitle WinTitle, ahk_id %id%

		WinGetPos, WinX, WinY, WinW, WinH, % WinTitle
		
		if (MouseX > WinX && MouseX < WinX + WinW && MouseY > WinY && MouseY < WinY + WinH) 
		{
			WinGet, ExStyle, ExStyle, % WinTitle
			if (ExStyle & 0x8) 
			{
				WinGet, WinTrans, Transparent, % WinTitle

				WinSet, ExStyle, -0x20, % WinTitle
	 			WinSet, AlwaysOnTop, Off, % WinTitle
			
				if (WinTrans = 99) {
					WinSet, Transparent, 255, % WinTitle
				}
				
				return
			}
		}
	}

return