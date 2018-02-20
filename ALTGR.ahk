;bunch of scripts that does keyboard shortcut things
;they're all using the ALTGR keyboard modifier
;pls try to make sure they're able to be pressed with one hand, e.g. "ALTGR+O"

;existing shortcuts are
;ALTGR + o (BROWSER - firefox.exe)
;ALTGR + p (CLI -powershell)
;ALTGR + i (WINDOWS SNIPPING TOOL) why would i use this when i've got onenote?
;ALTGR + k (TEXT EDITOR - visual studio code)
;ALTGR + a (TURNING OFF MONITOR) - you actually need two hands for this, but its ok since turning off monitor is a concious actiono

;		ADDED 2018-01-29
;ALTGR + v (SETTING VOLUME TO 10% OR BACK TO 50%)

<^>!o:: ; ALTGR+O opens new firefox instance, or switches to active window

	if WinActive("ahk_class MozillaWindowClass")			;if window is active this will minimize it
	{
	 	WinMinimize
	}

	else if WinExist("ahk_class MozillaWindowClass")		;if the window is not active (e.g. minimized) it'll activate the window and maximize
	{
		WinActivate
		WinMaximize
	}
	
	else 													;or if the window doesn't exist at all it will default to running the executable
    	Run firefox.exe
	return

<^>!p:: ;open or switch to powershell NOT ADMIN

	if WinActive("ahk_class ConsoleWindowClass")
	{ 
		WinMinimize
	}
	
	else if WinExist("ahk_class ConsoleWindowClass")
	{
		WinActivate
	}
	else
    	Run powershell.exe
	return

<^>!i:: ;open or switch to snipping tool

	if WinActive("ahk_class Microsoft-Windows-SnipperToolbar")
	{
		WinMinimize
	}

	else if WinExist("ahk_class Microsoft-Windows-SnipperToolbar")
	{
		WinActivate
	}
	else
    	Run SnippingTool.exe
	return

<^>!k:: ;open or switch to vscode 

	if WinActive("ahk_class Chrome_WidgetWin_1")
	{
		WinMinimize
	}

	else if WinExist("ahk_class Chrome_WidgetWin_1")
	{
		WinActivate
	}
	else
    	Run "C:\Program Files\Microsoft VS Code\Code.exe"
	return	

<^>!a::  ; Win+O hotkey that turns off the monitor.

	Sleep 250 							; Give user a chance to release keys (in case their release would wake up the monitor again).

	SendMessage, 0x112, 0xF170, 2,, Program Manager  ; 0x112 is WM_SYSCOMMAND, 0xF170 is SC_MONITORPOWER. Turning Monitor Off:
												 ; Note for the above: Use -1 in place of 2 to turn the monitor on.
												 ; Use 1 in place of 2 to activate the monitor's low-power mode.
	return

<^>!v:: ; Should change volume to a tenth of full

	
	
	SoundGet, currentVolume , master, volume, 1 ; Stores current value in the var currentVolume

	if currentVolume < 10 ; if volume is 10
	{
		SoundSet, 50	  ; set volume to 50
	}
	else SoundSet, 10     ; else volume is 10
	return

	;SoundGet, newVolume , master, volume, 1 ;holds value of new volume
	;MsgBox, Volume is %newVolume% ; displays msgbox with new volumeEnter
	
<^>!m:: ; visual studio 2017 SO IT DOESNT EXIT AFTER PROGRAM IS DONE

	if WinExist("ahk_class Chrome_WidgetWin_1") ;class for Visual Studio Code
	{
		send, ^!n
	}
	else 
    	send, ^{F5}
		return

	


	

	