; 来源: https://www.zhihu.com/question/41446565
; 进行了一定改编
; 左Shift强制切换到英文输入法，右Shift强制切换到中文输入法

#SingleInstance force
#UseHook
#include lib/IME.ahk

global timeInterval := 300 ; 300ms 犹豫时间
global ime_mode := 0 ; 0: english. 1: chinese
SetTimer, updateIMEMode, 50 ; 锁定IME状态，不要跟着窗口变

; 锁定输入法状态
updateIMEMode() {
    ; Lock IME mode
    getIME := IME_GetConvMode("A")	
    if (getIME != ime_mode) {
        IME_SetConvMode(ime_mode, A)
    }
}

; 英文模式
~$LShift::
    KeyWait LShift ; 等待释放
	if (A_TimeSinceThisHotkey < timeInterval && A_Priorkey = "LShift") {
		ime_mode := 0
	}
return 

;中文模式
~$RShift::
    KeyWait RShift ; 等待释放
	if (A_TimeSinceThisHotkey < timeInterval && A_Priorkey = "RShift" ) {
        ime_mode := 1
	}
return