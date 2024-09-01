{ ... }:
{
  # fcitx5 config
  xdg.configFile."fcitx5/config".text = ''
    [Hotkey]
    # 反复按切换键时进行轮换
    EnumerateWithTriggerKeys=True
    # 向前切换输入法
    EnumerateForwardKeys=
    # 向后切换输入法
    EnumerateBackwardKeys=
    # 轮换输入法时跳过第一个输入法
    EnumerateSkipFirst=False

    [Hotkey/TriggerKeys]
    0=Control+space

    [Hotkey/AltTriggerKeys]
    0=Control+Control_L

    [Hotkey/PrevPage]
    0=Up

    [Hotkey/NextPage]
    0=Down

    [Hotkey/PrevCandidate]
    0=Shift+Tab

    [Hotkey/NextCandidate]
    0=Tab

    [Hotkey/TogglePreedit]
    0=Control+Alt+P

    [Behavior]
    # 默认状态为激活
    ActiveByDefault=False
    # 重新聚焦时重置状态
    resetStateWhenFocusIn=No
    # 共享输入状态
    ShareInputState=No
    # 在程序中显示预编辑文本
    PreeditEnabledByDefault=True
    # 切换输入法时显示输入法信息
    ShowInputMethodInformation=True
    # 在焦点更改时显示输入法信息
    showInputMethodInformationWhenFocusIn=False
    # 显示紧凑的输入法信息
    CompactInputMethodInformation=True
    # 显示第一个输入法的信息
    ShowFirstInputMethodInformation=True
    # 默认页大小
    DefaultPageSize=5
    # 覆盖 Xkb 选项
    OverrideXkbOption=False
    # 自定义 Xkb 选项
    CustomXkbOption=
    # Force Enabled Addons
    EnabledAddons=
    # Force Disabled Addons
    DisabledAddons=
    # Preload input method to be used by default
    PreloadInputMethod=True
    # 允许在密码框中使用输入法
    AllowInputMethodForPassword=False
    # 输入密码时显示预编辑文本
    ShowPreeditForPassword=False
    # 保存用户数据的时间间隔（以分钟为单位）
    AutoSavePeriod=30
  '';

  xdg.configFile."fcitx5/conf/classicui.conf".text = ''
    # 垂直候选列表
    Vertical Candidate List=False
    # 使用鼠标滚轮翻页
    WheelForPaging=True
    # 字体
    Font="Sans 10"
    # 菜单字体
    MenuFont="Sans 10"
    # 托盘字体
    TrayFont="Sans Bold 10"
    # 托盘标签轮廓颜色
    TrayOutlineColor=#000000
    # 托盘标签文本颜色
    TrayTextColor=#ffffff
    # 优先使用文字图标
    PreferTextIcon=False
    # 在图标中显示布局名称
    ShowLayoutNameInIcon=True
    # 使用输入法的语言来显示文字
    UseInputMethodLanguageToDisplayText=True
    # 主题
    Theme=catppuccin-mocha
    # 深色主题
    DarkTheme=catppuccin-mocha
    # 跟随系统浅色/深色设置
    UseDarkTheme=True
    # 当被主题和桌面支持时使用系统的重点色
    UseAccentColor=True
    # 在 X11 上针对不同屏幕使用单独的 DPI
    PerScreenDPI=False
    # 固定 Wayland 的字体 DPI
    ForceWaylandDPI=0
    # 在 Wayland 下启用分数缩放
    EnableFractionalScale=True
  '';

  # fcitx5-rime custom config
  # TODO: remove all the other files under ~/.local/share/fcitx5/rime, if rime did not correctly build.
  home.file.".local/share/fcitx5/rime/default.custom.yaml".text = ''
    patch:
      schema_list:
        - schema: "rime_ice"
      ascii_composer/good_old_caps_lock: true
      ascii_composer/switch_key:
        Caps_Lock: clear
        Control_L: noop
        Control_R: noop
        Shift_L: commit_code
        Shift_R: commit_code
      menu/page_size: 10
  '';
}
