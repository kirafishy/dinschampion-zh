# 《Din's Champion》简体中文汉化补丁

适用游戏版本：**1.005**（以游戏目录 `changes.txt` 顶部的版本号为准）。

## 下载

从 [Releases](https://github.com/kirafishy/dinschampion-zh/releases/latest) 下载 `DinsChampion-zh-v1.005.zip`。解压后的内容和上面的 `DinsChampion_汉化补丁` 文件夹相同。

不方便下压缩包时，直接使用上面的 `DinsChampion_汉化补丁` 文件夹即可，里面就是解压后的同一套文件。

## 安装

先完全退出游戏。

1. 在 Steam 库中右键《Din's Champion》→ **管理** → **浏览本地文件**，打开含有 `DinsChampion.exe` 的游戏根目录。
2. 把补丁**里面**的文件和文件夹复制到游戏根目录。不要把 `DinsChampion_汉化补丁` 这个文件夹再套一层放进去。
   - 用压缩包时：解压后应直接看到 `dinput8.dll`、`dc_dict.bin`、`安装汉化.bat`、`Assets` 和 `Loc`。
   - 用本仓库文件夹时：复制 `DinsChampion_汉化补丁` 里面的这些内容。
3. 从 **Steam** 启动游戏。不要直接双击 `DinsChampion.exe`，否则可能被 Steam 以退出码 53 拦住。

也可以进入 `DinsChampion_汉化补丁`，双击 `安装汉化.bat`。脚本会尝试寻找常见的 Steam 游戏目录并复制文件；找不到时，按上面的步骤手动复制。

## 卸载

在游戏根目录双击 `卸载汉化.bat`。它只删除本补丁复制进去的文件，不删除官方 `assets001.zip`–`assets005.zip`，也不删除存档。

## 常见问题

**启动提示缺少 SteamAppId，或退出码 53。**
请从 Steam 客户端点「开始游戏」。

**杀毒软件拦截 `dinput8.dll`。**
这是 DirectInput 8 代理，游戏启动时用它加载中文字体和词条。请把它加入白名单。补丁不修改游戏本体。

**画面没有中文，或弹出「汉化不可用」。**
先确认游戏版本仍是 1.005，并且补丁文件在游戏根目录，而不是套在子文件夹里。游戏更新后如果对不上，等待补丁更新；反复覆盖同一个 `dinput8.dll` 不能解决版本不匹配。

字形渲染使用 [FreeType](https://freetype.org/)（FTL / GPL 双许可）。
