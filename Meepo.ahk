DELAY := 1.00
BLINK_DAGGER_KEY := "1"
POOF_KEY := "w"
EARTHBIND_KEY := "q"
NEXT_MEEPO_KEY := "Tab"

MEEPO_COUNT := 1

XButton1::
	Send {%BLINK_DAGGER_KEY%}
	Sleep, Round(10 * DELAY)
	Send {%EARTHBIND_KEY%}
	Sleep, Round(10 * DELAY)
	Send {%POOF_KEY%}
	POOF_COUNT := MEEPO_COUNT - 1
	Loop %POOF_COUNT% {
		Sleep, Round(15 * DELAY)
		Send {%NEXT_MEEPO_KEY%}
		Sleep, Round(10 * DELAY)
		Send {%POOF_KEY%}
	}
	Sleep, Round(15 * DELAY)
	Send {%NEXT_MEEPO_KEY%}
Return

XButton2::
	Send {%EARTHBIND_KEY%}
	Sleep, Round(10 * DELAY)
	Send {%NEXT_MEEPO_KEY%}
Return

NumpadAdd::
	MEEPO_COUNT := MEEPO_COUNT + 1
	;Gosub, ShowOverlay
	;SetTimer, HideOverlay, 1000
Return

NumpadSub::
	MEEPO_COUNT := MEEPO_COUNT - 1
	;Gosub, ShowOverlay
	;SetTimer, HideOverlay, 1000
Return

ShowOverlay:
	Gui, GUI_Overlay:New, +ToolWindow  +LastFound +AlwaysOnTop -Caption +hwndGUI_Overlay_hwnd
	WinGet, WinHND, ID, A
	Gui,Vol:+0x40000000 -0x80000000 +Owner%WinHND%
	Gui, Margin, 0, 8
	Gui, Font, s10 q0, Segoe UI
	Gui, Add, Text, w160 Center cWhite,Number of Meepos: %MEEPO_COUNT%

	Gui, Color, 000000
	WinSet, Transparent, 200
	Gui, Show, Hide, Overlay

	WinMove, A_ScreenWidth - 160 - 8, 8
	Gui, GUI_Overlay:Show
Return

HideOverlay:
	SetTimer, HideOverlay, Off
	Gui, GUI_Overlay:Destroy
Return