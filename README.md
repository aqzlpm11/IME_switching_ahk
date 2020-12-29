# IME switching
使用ahk实现中英文切换

## 主要功能
- 左边shift：切换到英文
- 右边Shift：切换到中文
- 全局状态锁定：让输入法状态成为全局，即切换窗口，保持中英文状态一致不变。（原生特性，会根据窗口“智能”变化）

## 系统设置
- 只安装一个语言（中文），win10默认输入法
- 关闭所有中英文切换快捷键（Ctrl+Space，Shift和Ctrl）

## 运行方法
安装ahk，运行ime_lock.ahk

注意：当前配置为win10输入法。若非win10 默认输入法，则内部的code可能不同。可以使用query_ime_mode.ahk进行查询。