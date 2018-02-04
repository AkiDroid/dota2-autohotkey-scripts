DELAY := 1.00

QUAS_KEY := "q"
WEX_KEY := "w"
EXORT_KEY := "e"
INVOKE_KEY := "r"
FIRST_SPELL_KEY := "d"
SECOND_SPELL_KEY := "f"

; Quas spells
~z & q::
	Gosub, CastQuas
	Gosub, CastQuas
	Gosub, CastQuas
	Gosub, CastInvoke
Return
~z & w::
	Gosub, CastQuas
	Gosub, CastQuas
	Gosub, CastWex
	Gosub, CastInvoke
Return
~z & e::
	Gosub, CastQuas
	Gosub, CastQuas
	Gosub, CastExort
	Gosub, CastInvoke
Return

; Wex spells
~x & w::
	Gosub, CastWex
	Gosub, CastWex
	Gosub, CastWex
	Gosub, CastInvoke
Return
~x & q::
	Gosub, CastWex
	Gosub, CastWex
	Gosub, CastQuas
	Gosub, CastInvoke
Return
~x & e::
	Gosub, CastWex
	Gosub, CastWex
	Gosub, CastExort
	Gosub, CastInvoke
Return

; Exort spells
~c & e::
	Gosub, CastExort
	Gosub, CastExort
	Gosub, CastExort
	Gosub, CastInvoke
Return
~c & q::
	Gosub, CastExort
	Gosub, CastExort
	Gosub, CastQuas
	Gosub, CastInvoke
Return
~c & w::
	Gosub, CastExort
	Gosub, CastExort
	Gosub, CastWex
	Gosub, CastInvoke
Return

; First and seconds spells
XButton1::
	Gosub, CastFirstSpell
Return

XButton2::
	Gosub, CastSecondSpell
Return

CastQuas:
	Send {%QUAS_KEY%}
	Sleep, Round(10 * DELAY)
Return

CastWex:
	Send {%WEX_KEY%}
	Sleep, Round(10 * DELAY)
Return

CastExort:
	Send {%EXORT_KEY%}
	Sleep, Round(10 * DELAY)
Return

CastFirstSpell:
	Sleep, Round(10 * DELAY)
	Send {%FIRST_SPELL_KEY%}
Return

CastSecondSpell:
	Sleep, Round(10 * DELAY)
	Send {%Second_SPELL_KEY%}
Return

CastInvoke:
	Send {%INVOKE_KEY%}
	Sleep, Round(10 * DELAY)
Return