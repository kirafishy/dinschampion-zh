@echo off
REM ============================================================
REM 《Din's Champion》汉化补丁一键安装程序 (方案1内存拦截版)
REM ============================================================
setlocal enabledelayedexpansion
chcp 65001 >nul 2>&1
title 《Din's Champion》一键汉化补丁安装程序

echo ============================================================
echo      《Din's Champion》简中全量汉化补丁 (免环境即装即用)
echo ============================================================
echo.

set "SOURCE_DIR=%~dp0"
set "TARGET_DIR="

REM 1. 优先检测当前目录是否直接就是游戏根目录
if exist "%SOURCE_DIR%DinsChampion.exe" (
    set "TARGET_DIR=%SOURCE_DIR%"
    echo [OK] 检测到本补丁已直接放置在游戏根目录！
    goto do_install_here
)

REM 2. 尝试探测常见的 Steam 安装路径
set "STEAM_PATH1=N:\SteamLibrary\steamapps\common\Din's Champion"
set "STEAM_PATH2=C:\Program Files (x86)\Steam\steamapps\common\Din's Champion"
set "STEAM_PATH3=D:\SteamLibrary\steamapps\common\Din's Champion"
set "STEAM_PATH4=E:\SteamLibrary\steamapps\common\Din's Champion"

if exist "%STEAM_PATH1%\DinsChampion.exe" set "TARGET_DIR=%STEAM_PATH1%"
if not defined TARGET_DIR (if exist "%STEAM_PATH2%\DinsChampion.exe" set "TARGET_DIR=%STEAM_PATH2%")
if not defined TARGET_DIR (if exist "%STEAM_PATH3%\DinsChampion.exe" set "TARGET_DIR=%STEAM_PATH3%")
if not defined TARGET_DIR (if exist "%STEAM_PATH4%\DinsChampion.exe" set "TARGET_DIR=%STEAM_PATH4%")

if defined TARGET_DIR (
    echo [OK] 自动探测到游戏目录: "!TARGET_DIR!"
    echo.
    echo 正在安装汉化补丁到该目录...
    goto copy_files
)

echo [提示] 未能在常见路径中自动找到游戏，请按以下步骤操作：
echo.
echo 步骤 1: 打开 Steam 库，右键点击《Din's Champion》；
echo 步骤 2: 选择【管理】 -^> 【浏览本地文件】；
echo 步骤 3: 将本补丁文件夹内的所有文件及 Assets 文件夹全部复制到该游戏目录下即可！
echo.
echo 复制完成后，直接从 Steam 启动游戏即可享受中文！
echo.
pause
exit /b 0

:do_install_here
echo 补丁文件已在游戏目录中生效。
echo 请确保 Assets\mod_zh_smoke.zip 已在 Assets 目录下。
if exist "%SOURCE_DIR%mod_zh_smoke.zip" (
    if not exist "%SOURCE_DIR%Assets" mkdir "%SOURCE_DIR%Assets"
    copy /y "%SOURCE_DIR%mod_zh_smoke.zip" "%SOURCE_DIR%Assets\mod_zh_smoke.zip" >nul
)
goto install_success

:copy_files
copy /y "%SOURCE_DIR%dinput8.dll" "%TARGET_DIR%\" >nul
copy /y "%SOURCE_DIR%dc_dict.bin" "%TARGET_DIR%\" >nul
copy /y "%SOURCE_DIR%dc_cjk.ini" "%TARGET_DIR%\" >nul
copy /y "%SOURCE_DIR%freetype.dll" "%TARGET_DIR%\" >nul
copy /y "%SOURCE_DIR%bz2.dll" "%TARGET_DIR%\" >nul
copy /y "%SOURCE_DIR%libpng16.dll" "%TARGET_DIR%\" >nul
copy /y "%SOURCE_DIR%z.dll" "%TARGET_DIR%\" >nul
copy /y "%SOURCE_DIR%brotlicommon.dll" "%TARGET_DIR%\" >nul
copy /y "%SOURCE_DIR%brotlidec.dll" "%TARGET_DIR%\" >nul
copy /y "%SOURCE_DIR%卸载汉化.bat" "%TARGET_DIR%\" >nul

if not exist "%TARGET_DIR%\Assets" mkdir "%TARGET_DIR%\Assets"
if exist "%SOURCE_DIR%Assets\assets006_zh.zip" (
    copy /y "%SOURCE_DIR%Assets\assets006_zh.zip" "%TARGET_DIR%\Assets\assets006_zh.zip" >nul
) else if exist "%SOURCE_DIR%assets006_zh.zip" (
    copy /y "%SOURCE_DIR%assets006_zh.zip" "%TARGET_DIR%\Assets\assets006_zh.zip" >nul
)
if exist "%SOURCE_DIR%Assets\mod_zh_smoke.zip" (
    copy /y "%SOURCE_DIR%Assets\mod_zh_smoke.zip" "%TARGET_DIR%\Assets\mod_zh_smoke.zip" >nul
)
if exist "%TARGET_DIR%\Assets\assets999_zh.zip" del /f /q "%TARGET_DIR%\Assets\assets999_zh.zip" >nul

if exist "%SOURCE_DIR%Loc" (
    xcopy /e /y "%SOURCE_DIR%Loc" "%TARGET_DIR%\Loc\" >nul
)

:install_success
echo.
echo ============================================================
echo [√] 汉化补丁安装成功！
echo.
echo 使用须知：
echo 1. 必须通过 Steam 启动游戏（直接双击 EXE 会被 Steam 拦截）。
echo 2. 游戏内如需卸载汉化，运行游戏目录下的【卸载汉化.bat】即可。
echo ============================================================
echo.
pause
exit /b 0
