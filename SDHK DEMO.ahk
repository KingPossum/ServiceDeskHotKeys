SetKeyDelay,0
#SingleInstance Force
ADHD.config_ignore_x64_warning()
; Declare the library
ADHD := New ADHDLib

; Configure the About box
ADHD.config_about({name: "SDHotKeys", version: 1.0, author: "Rasheed Peters | rasheedpeters@llu.edu"})
; The default application to limit hotkeys to.
; Starts disabled by default, so no danger setting to whatever you want

; GUI size
;ADHD.config_size(375,150)
; Defines your hotkeys - here we define a hotkey "Fire" that calls the label "Fire"
ADHD.config_hotkey_add({uiname: "Search ServiceNow", subroutine: "SnSearch"})
ADHD.config_hotkey_add({uiname: "Search Google", subroutine: "GSearch"})
ADHD.config_hotkey_add({uiname: "Open/Take Snip", subroutine: "SnippingTool"})
ADHD.config_hotkey_add({uiname: "Open cmd, ping", subroutine: "Ping"})
ADHD.config_hotkey_add({uiname: "Always ontop", subroutine: "AlwaysOntop"})
ADHD.config_hotkey_add({uiname: "Bckspc last word", subroutine: "BackSpaceWord"})
ADHD.config_hotkey_add({uiname: "Clipboard History", subroutine: "ClipboardHist"})



; End Setup section

hIcon := LoadPicture("Shell32", "w16 h-1 Icon44", IMAGE_ICON := 1)

GuiVar_Set(Var,Value)
{
	DetectHiddenWindows, % (Setting_A_DetectHiddenWindows := A_DetectHiddenWindows) ? "On" :
	if WinExist("GuiVar_" Var)
		ControlSetText,, %Value%, GuiVar_%Var%
	else
	{
		Gui, GuiVar_%Var%_GuiVar:Add, Text,, %Value%
		Gui, GuiVar_%Var%_GuiVar:Show, Hide, GuiVar_%Var%_GuiVar
	}
	DetectHiddenWindows, %Setting_A_DetectHiddenWindows%
	return
}

GuiVar_Get(Var)
{
	DetectHiddenWindows, % (Setting_A_DetectHiddenWindows := A_DetectHiddenWindows) ? "On" :
	ControlGetText, Value,, GuiVar_%Var%_GuiVar
	DetectHiddenWindows, %Setting_A_DetectHiddenWindows%
return Value
}


global twoh
global thankyou
global contactinfo
global attemptedcall
global attemptedcallvm
global servicedeskinfo
global custom1
global custom2
global custom3
global custom4
global custom5
global custom6
global custom7
global custom8

; ============================================================================================
; Start ADHD 
ADHD.config_size(400,380)
ADHD.init()
ADHD.create_gui()
TrayMinimizer.Init()
null = "]0 empty"
inputVar:= A_ScriptName
finScript := SubStr(inputVar,1,InStr(inputVar, .)-1)   
IniRead, CurrentProfile, %finScript%.ini, Settings, adhd_current_profile, % null
IniRead,twoh,%finScript%.ini,%CurrentProfile%, twoh, % null
IniRead,thankyou,%finScript%.ini,%CurrentProfile%, thankyou, % null
IniRead,contactinfo,%finScript%.ini,%CurrentProfile%, contactinfo, % null
IniRead,attemptedcall,%finScript%.ini,%CurrentProfile%, attemptedcall, % null
IniRead,attemptedcallvm,%finScript%.ini,%CurrentProfile%, attemptedcallvm, % null
IniRead,servicedeskinfo,%finScript%.ini,%CurrentProfile%, servicedeskinfo, % null
IniRead,custom1,%finScript%.ini,%CurrentProfile%, custom1, % null
IniRead,custom2,%finScript%.ini,%CurrentProfile%, custom2, % null
IniRead,custom3,%finScript%.ini,%CurrentProfile%, custom3, % null
IniRead,custom4,%finScript%.ini,%CurrentProfile%, custom4, % null
IniRead,custom5,%finScript%.ini,%CurrentProfile%, custom5, % null
IniRead,custom6,%finScript%.ini,%CurrentProfile%, custom6, % null
IniRead,custom7,%finScript%.ini,%CurrentProfile%, custom7, % null
IniRead,custom8,%finScript%.ini,%CurrentProfile%, custom8, % null


;MsgBox, %twoh%, %thankyou%,%contactinfo%,%attemptedcall%,%attemptedcallvm%,%servicedeskinfo%,%custom1%,%custom2%,%custom3%,%custom4%,%custom5%,%custom6%

ServiceString := "https://serviceportal.lluh.org/nav_to.do?uri=task.do?sysparm_query=number=" 
snipped := []


;reloads the script
relscript(){
Reload
return
}

newline := "!n"


Value := RegExMatch(thankyou, "^([^ ]*) (.*)", vartwo)
EndPos := InStr(thankyou, " ") -1
Start := SubStr(thankyou, 1, EndPos)
vartwo2 := StrReplace(vartwo2, newline, Chr(13))



Value := RegExMatch(contactinfo, "^([^ ]*) (.*)", varthree)
EndPos := InStr(contactinfo, " ") -1
Start := SubStr(contactinfo, 1, EndPos)
varthree2 := StrReplace(varthree2, newline, Chr(13))



Value := RegExMatch(attemptedcall, "^([^ ]*) (.*)", varfour)
EndPos := InStr(attemptedcall, " ") -1
Start := SubStr(attemptedcall, 1, EndPos)
varfour2 := StrReplace(varfour2, newline, Chr(13))



Value := RegExMatch(attemptedcallvm, "^([^ ]*) (.*)", varfive)
EndPos := InStr(attemptedcallvm, " ") -1
Start := SubStr(attemptedcallvm, 1, EndPos)
varfive2 := StrReplace(varfive2, newline, Chr(13))


Value := RegExMatch(servicedeskinfo, "^([^ ]*) (.*)", varsix)
EndPos := InStr(servicedeskinfo, " ") -1
Start := SubStr(servicedeskinfo, 1, EndPos)
varsix2 := StrReplace(varsix2, newline, Chr(13))


Value := RegExMatch(custom1, "^([^ ]*) (.*)", varseven)
EndPos := InStr(custom1, " ") -1
Start := SubStr(custom1, 1, EndPos)
varseven2 := StrReplace(varseven2, newline, Chr(13))


Value := RegExMatch(custom2, "^([^ ]*) (.*)", vareight)
EndPos := InStr(custom2, " ") -1
Start := SubStr(custom2, 1, EndPos)
vareight2 := StrReplace(vareight2, newline, Chr(13))



Value := RegExMatch(custom3, "^([^ ]*) (.*)", varnine)
EndPos := InStr(custom3, " ") -1
Start := SubStr(custom3, 1, EndPos)
varnine2 := StrReplace(varnine2, newline, Chr(13))




Value := RegExMatch(custom4, "^([^ ]*) (.*)", varten)
EndPos := InStr(custom4, " ") -1
Start := SubStr(custom4, 1, EndPos)
varten2 := StrReplace(varten2, newline, Chr(13))



Value := RegExMatch(custom5, "^([^ ]*) (.*)", vareleven)
EndPos := InStr(custom5, " ") -1
Start := SubStr(custom5, 1, EndPos)
vareleven2 := StrReplace(vareleven2, newline, Chr(13))



Value := RegExMatch(custom6, "^([^ ]*) (.*)", vartwelve)
EndPos := InStr(custom6, " ") -1
Start := SubStr(custom6, 1, EndPos)
vartwelve2 := StrReplace(vartwelve2, newline, Chr(13))


Value := RegExMatch(custom7, "^([^ ]*) (.*)", varthirteen)
EndPos := InStr(custom7, " ") -1
Start := SubStr(custom7, 1, EndPos)
varthirteen2 := StrReplace(varthirteen2, newline, Chr(13))


Value := RegExMatch(custom8, "^([^ ]*) (.*)", varfourteen)
EndPos := InStr(custom6, " ") -1
Start := SubStr(custom6, 1, EndPos)
varfourteen2 := StrReplace(varfourteen2, newline, Chr(13))


; The "Main" tab is tab 1
Gui, Tab, 1
; Create normal label
Gui,Add, Button, x5 y305 grelscript, Reload Hotstrings

Gui, Add, Text, x5 y40, Thank you
; Create Edit box that has state saved in INI
ADHD.gui_add("Edit", "thankyou", "xp+120 yp W260", "", "")
; Create tooltip by adding _TT to the end of the Variable Name of a control

Gui, Add, Text, x5 y60,Contact Info
; Create Edit box that has state saved in INI
ADHD.gui_add("Edit", "contactinfo", "xp+120 yp W260", "", "")
; Create tooltip by adding _TT to the end of the Variable Name of a control

Gui, Add, Text, x5 y80, Attempted call
; Create Edit box that has state saved in INI
ADHD.gui_add("Edit", "attemptedcall", "xp+120 yp W260", "", "")
; Create tooltip by adding _TT to the end of the Variable Name of a control
 
 Gui, Add, Text, x5 y100, Attempted call, VM
; Create Edit box that has state saved in INI
ADHD.gui_add("Edit", "attemptedcallvm", "xp+120 yp W260", "", "")

 Gui, Add, Text, x5 y120, ServiceDesk line & ext.
; Create Edit box that has state saved in INI
ADHD.gui_add("Edit", "servicedeskinfo", "xp+120 yp W260", "", "")

 Gui, Add, Text, x5 y140, User Custom #1.
; Create Edit box that has state saved in INI
ADHD.gui_add("Edit", "custom1", "xp+120 yp W260", "", "")

 Gui, Add, Text, x5 y160, User Custom #2
; Create Edit box that has state saved in INI
ADHD.gui_add("Edit", "custom2", "xp+120 yp W260", "", "")

 Gui, Add, Text, x5 y180, User Custom #3
; Create Edit box that has state saved in INI
ADHD.gui_add("Edit", "custom3", "xp+120 yp W260", "", "")

 Gui, Add, Text, x5 y200, User Custom #4
; Create Edit box that has state saved in INI
ADHD.gui_add("Edit", "custom4", "xp+120 yp W260", "", "")

 Gui, Add, Text, x5 y220, User Custom #5
; Create Edit box that has state saved in INI
ADHD.gui_add("Edit", "custom5", "xp+120 yp W260", "", "")

 Gui, Add, Text, x5 y240, User Custom #6
; Create Edit box that has state saved in INI
ADHD.gui_add("Edit", "custom6", "xp+120 yp W260", "", "")

 Gui, Add, Text, x5 y260, User Custom #7
; Create Edit box that has state saved in INI
ADHD.gui_add("Edit", "custom7", "xp+120 yp W260", "", "")

 Gui, Add, Text, x5 y280, User Custom #8
; Create Edit box that has state saved in INI
ADHD.gui_add("Edit", "custom8", "xp+120 yp W260", "", "")

;HOTSTRINGS
  
ADHD.finish_startup()

ADHD.Hotstring(vartwo1, vartwo2)
ADHD.Hotstring(varthree1, varthree2)
ADHD.Hotstring(varfour1, varfour2)
ADHD.Hotstring(varfive1, varfive2)
ADHD.Hotstring(varsix1, varsix2)
ADHD.Hotstring(varseven1, varseven2)
ADHD.Hotstring(vareight1, vareight2)
ADHD.Hotstring(varnine1, varnine2)
ADHD.Hotstring(varten1, varten2)
ADHD.Hotstring(vareleven1, vareleven2)
ADHD.Hotstring(vartwelve1, vartwelve2)
ADHD.Hotstring(varthirteen1, varthirteen2)
ADHD.Hotstring(varfourteen1, varfourteen2)

return


; ==========================================================================================
; HOTKEYS SECTION

; This is where you define labels that the various bindings trigger

hIcon := LoadPicture("Shell32", "w16 h-1 Icon44", IMAGE_ICON := 1)

ToggleOnTop(hIcon) {
   static winArr := {}, WS_EX_TOPMOST := 0x8
        , GCLP_HICON := -14, GCLP_HICONSM := -34
        , WM_SETICON := 0x80, WM_GETICON := 0x7F
        , ICON_SMALL := 0, ICON_BIG := 1
        , GetClassLong := "GetClassLong" . (A_PtrSize = 4 ? "" : "Ptr")
        
   hWnd := WinExist("A")
   if !winArr.HasKey(hWnd) {
      SendMessage, WM_GETICON, ICON_SMALL
      hSmallIcon := ErrorLevel
      SendMessage, WM_GETICON, ICON_BIG
      hBigIcon := ErrorLevel
      if !hSmallIcon {
         hBigIcon   := DllCall(GetClassLong, "Ptr", hWnd, "Int", GCLP_HICON  , "Ptr")
         hSmallIcon := DllCall(GetClassLong, "Ptr", hWnd, "Int", GCLP_HICONSM, "Ptr")
      }
      winArr[hWnd] := { big: hBigIcon, small: hSmallIcon }
   }
   WinSet, AlwaysOnTop
   WinGet, styles, ExStyle
   if (styles & WS_EX_TOPMOST)
      SendMessage, WM_SETICON, ICON_SMALL, hIcon
   else {
      SendMessage, WM_SETICON, ICON_SMALL, winArr[hWnd, "small"]
      SendMessage, WM_SETICON, ICON_BIG  , winArr[hWnd, "big"]
   }
}

SnSearch:
	Clipboard=
	send, ^c
	;clipWait
	run https://serviceportal.lluh.org/nav_to.do?uri=task.do?sysparm_query=number=%clipboard%
	return
	

SnippingTool:
	SetTitleMatchMode, % (Setting_A_TitleMatchMode := A_TitleMatchMode) ? "RegEx" :
	if WinExist("ahk_class Microsoft-Windows-.*SnipperToolbar")
	{
		WinGet, State, MinMax
		if (State = -1)
		{	
			WinRestore
			Sleep 200
			Send, ^n
		}
		else if WinActive()
			WinMinimize
		else
		{
			WinActivate
			Sleep 200
			Send, ^n
		}
	}
	else if WinExist("ahk_class Microsoft-Windows-.*SnipperEditor")
	{
		WinGet, State, MinMax
		if (State = -1)
		{
			WinRestore
		}
		else if WinActive()
			WinMinimize
		
		else
			WinActivate
					Sleep 200
			Send, ^n
	}
	else
	{
		Run, snippingtool.exe
		if (SubStr(A_OSVersion,1,2)=10)
		{
			WinWait, ahk_class Microsoft-Windows-.*SnipperToolbar,,3
			Sleep 200
			Send, ^n
		}
	}
	SetTitleMatchMode, %Setting_A_TitleMatchMode%
	return
	


AlwaysOnTop:
ToggleOnTop(hIcon)
return

GSearch:
Clipboard=
send, ^c
clipWait
url := "https://www.google.com/search?q="
;is_it_an_url := SubStr(clipboard, 1 , 8)
;if (is_it_an_url = "https://") {   ; if it starts with "https://" go to, rather than search in google search
;run %url%%clipboard%
;}
;else { ;search using google search
	joined_url = %url%%clipboard%
	run, %joined_url%
	;}
clipboard := clip ;put the last copied thing back in the clipboard
return

Ping:

Clipboard=
send, ^c
clipWait
clipb := Clipboard
pingCommand := "ping " . clipb

	SetTitleMatchMode, % (Setting_A_TitleMatchMode := A_TitleMatchMode) ? "RegEx" :
	if WinExist("ahk_class ConsoleWindowClass")
	{
		WinGet, State, MinMax
		if (State = -1)
		{	
			WinRestore
			sleep, 200
			send,  %pingCommand%
			Send, {Enter}

		}
		else if WinActive(){
			WinMinimize
		sleep, 200
		send, %pingCommand%
		Send, {Enter}
	}else
		{
			WinActivate
			Sleep,200
			send, %pingCommand%
			Send, {Enter}
		}
	}else
	{
		Run, cmd
		Sleep, 200
		send, %pingCommand%
		Send, {Enter}
	}
	SetTitleMatchMode, %Setting_A_TitleMatchMode%
	return
	

BackSpaceWord:
Send ^+{Left}{Del}
return

ClipboardHist:
;Flush the old menu
Menu, ClipboardHistory, Add
Menu, ClipboardHistory, DeleteAll
;Create the menu items
Loop 10 {
	;Translate this loop iteration into a bucket number based upon decrementing circular bucket from CurBucket
	ThisIndexBucketNum := CurBucket - A_Index + 1
	If (ThisIndexBucketNum < 1)
		ThisIndexBucketNum := ThisIndexBucketNum + 10
	; Make 10 Display as 0 for correct keyboard shortcut
	ThisMenuItemNumber := A_Index
	If (ThisMenuItemNumber = 11)
		ThisMenuItemNumber := 0
	;Create Short Display of this Item
	StringReplace, ThisItemShortDisplay, ClipBucket%ThisIndexBucketNum%, `n, |, All ;show | for newline in menu preview
	ThisItemShortDisplay := RegExReplace(ThisItemShortDisplay, "[[:blank:]]+", " ") ;remove double spaces
	StringLeft, ThisItemShortDisplay, ThisItemShortDisplay, 64
	;Add into the menu
	Menu, ClipboardHistory, Add, % "&" . ThisMenuItemNumber . " " . ThisItemShortDisplay, PasteClipFromMenu
}
Menu, ClipboardHistory, Show
Return

PasteClipFromMenu:
ThisSelectionBucketNum := CurBucket - A_ThisMenuItemPos + 1
If (ThisSelectionBucketNum < 1)
	ThisSelectionBucketNum := ThisSelectionBucketNum + 10
SendRaw % ClipBucket%ThisSelectionBucketNum%
Return

OnClipboardChange:
ClipWait
If (A_EventInfo = 1) {
	CurBucket++	; on first copy this will become 1
	If (CurBucket > 10)
		CurBucket := 1
	StringReplace, ClipBucket%CurBucket%, Clipboard, `r`n, `n, All ;Fix for SendInput sending Windows linebreaks 
}
Return

#Include adhdlib.ahk
#include trayminimizer.ahk


