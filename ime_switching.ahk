; 来源: https://www.zhihu.com/question/41446565
; 进行了一定改编
; 左Shift强制切换到英文输入法，右Shift强制切换到中文输入法

#SingleInstance force
#UseHook
#include lib/ime.ahk

global timeInterval := 300 ; 300ms 犹豫时间
SetTimer, ReloadSelf, -600000 ; 10分钟重启一下（运行久了，会不灵敏，原因未知）

global IME_MODE_CHINESE := 1025 ; 可使用另一个脚本查询你当前输入法的mode
global IME_MODE_ENGLISH := 0
global ime_mode := 0
SetTimer, UpdateIMEMode, 200 ; 锁定IME状态，不要跟着窗口变

ReloadSelf() {
    Reload
}

; 更新输入法状态
UpdateIMEMode() {
    getIME := IME_GetConvMode("A")	
    if (getIME != ime_mode) {
        IME_SetConvMode(ime_mode, A)
    }
}

; 英文模式
~$LShift::
; MsgBox, "aaa"
    KeyWait LShift ; 等待释放
	if (A_TimeSinceThisHotkey < timeInterval && A_Priorkey = "LShift") {
		ime_mode := IME_MODE_ENGLISH
        UpdateIMEMode()
	} 
    ; else {
    ;     MsgBox, %A_TimeSinceThisHotkey% %A_Priorkey%
    ; }
return 


; 中文模式
~$RShift::
    KeyWait RShift ; 等待释放
	if (A_TimeSinceThisHotkey < timeInterval && A_Priorkey = "RShift" ) {
        ime_mode := IME_MODE_CHINESE
        UpdateIMEMode()
	}
return