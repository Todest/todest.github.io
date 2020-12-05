---
title: 解决WinForm DPI问题
date: 2020-04-08 16:08:24
categories:
  - 编程语言
  - C#
tags:
  - GUI
  - 'C#'
  - WinForm
abbrlink: cc74b154
---
更改 Form 的 AutoScaleMode 属性值为 Dpi ，并修改 Program.cs 为以下内容。
```csharp
class Program
{
    [STAThread]
    static void Main()
    {
        if (Environment.OSVersion.Version.Major >= 6)
            SetProcessDPIAware();

        Application.EnableVisualStyles();
        Application.SetCompatibleTextRenderingDefault(false);
        Application.Run(new Form1());
    }

    [System.Runtime.InteropServices.DllImport("user32.dll")]
    private static extern bool SetProcessDPIAware();
}
```