CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
SetMouseDelay, -1

pauseAnime()
{
	if WinExist("ahk_exe PotPlayerMini64.exe")
	{
		WinActivate
		Send {Space}
	}
}	

F1::
Loop 
{
	OutputDebug, "Searching for Paladin."
	PixelSearch, outputX, outputY, -768, 211, -253, 549, 0xFFFF00, 0, Fast
	if (ErrorLevel = 0)
	{
		OutputDebug, "Found Paladin!"
		OutputDebug, "Clicking on Paladin"
		Click, %outputX%, %outputY%
		OutputDebug, "Check if coin pouch exists."
		PixelSearch, pouchX, pouchY, -210, 420, -40, 670, 0x2F434A, 0, Fast
		if (ErrorLevel = 0)
		{
			OutputDebug, "Coin pouch found. Clicking on it."
			Click, %pouchX%, %pouchY%
		}
		OutputDebug, "Check if hp is low."
		PixelGetColor, color, -224, 261
		if (color = "0x131313")
		{
			OutputDebug, "HP is low."
			OutputDebug, "Looking for wine."
			PixelSearch, wineX, wineY, -210, 420, -40, 670, 0x333BAB, 0, Fast
			if (ErrorLevel = 0)
			{
				OutputDebug, "Found wine."
				OutputDebug, "Clicking on wine in X:%wineX% Y:%wineY%"
				Click, %wineX%, %wineY%
			}
			else
			{
				pauseAnime()
				MsgBox, 4096, "Ran out of wine!"
			}
		}
	}
	Else
	{
		pauseAnime()
		MsgBox, 4096, "Paladin has moved or de-spawned."
	}
}

F2::
Reload