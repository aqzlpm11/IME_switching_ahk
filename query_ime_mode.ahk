#include lib/IME.ahk

; Ctrl + q
^q::
    getIME := IME_GetConvMode("A")	
    MsgBox, %getIME% ; 获取当前IME_MODE
return