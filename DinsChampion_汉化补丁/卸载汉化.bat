@echo off
REM ============================================================
REM 《Din's Champion》汉化补丁一键卸载程序
REM ============================================================
setlocal enabledelayedexpansion
chcp 65001 >nul 2>&1
title 《Din's Champion》汉化补丁一键卸载程序

echo ============================================================
echo            《Din's Champion》汉化补丁卸载还原程序
echo ============================================================
echo.

set "GAME_DIR=%~dp0"
if not exist "%GAME_DIR%DinsChampion.exe" (
    echo [警告] 未在当前目录找到 DinsChampion.exe！
    echo 请将本【卸载汉化.bat】复制到《Din's Champion》游戏安装根目录下运行。
    echo.
    pause
    exit /b 1
)

echo 正在安全移除汉化补丁文件，还原纯净官方游戏...
echo.

if exist "%GAME_DIR%dinput8.dll" del /f /q "%GAME_DIR%dinput8.dll"
if exist "%GAME_DIR%dc_dict.bin" del /f /q "%GAME_DIR%dc_dict.bin"
if exist "%GAME_DIR%dc_cjk.ini" del /f /q "%GAME_DIR%dc_cjk.ini"
if exist "%GAME_DIR%dc_diag.log" del /f /q "%GAME_DIR%dc_diag.log"
if exist "%GAME_DIR%dc_cjk_map.txt" del /f /q "%GAME_DIR%dc_cjk_map.txt"
if exist "%GAME_DIR%freetype.dll" del /f /q "%GAME_DIR%freetype.dll"
if exist "%GAME_DIR%bz2.dll" del /f /q "%GAME_DIR%bz2.dll"
if exist "%GAME_DIR%libpng16.dll" del /f /q "%GAME_DIR%libpng16.dll"
if exist "%GAME_DIR%z.dll" del /f /q "%GAME_DIR%z.dll"
if exist "%GAME_DIR%brotlicommon.dll" del /f /q "%GAME_DIR%brotlicommon.dll"
if exist "%GAME_DIR%Assets\assets999_zh.zip" del /f /q "%GAME_DIR%Assets\assets999_zh.zip"
if exist "%GAME_DIR%Assets\assets006_zh.zip" del /f /q "%GAME_DIR%Assets\assets006_zh.zip"
if exist "%GAME_DIR%Assets\mod_zh_smoke.zip" del /f /q "%GAME_DIR%Assets\mod_zh_smoke.zip"
if exist "%GAME_DIR%Loc\English\Stories\Monsters" rmdir /s /q "%GAME_DIR%Loc\English\Stories\Monsters"

echo ============================================================
echo [√] 汉化补丁已成功卸载！游戏已完整恢复官方英文原版状态。
echo 官方资源（assets001~005.zip 及存档）完好无损。
echo ============================================================
echo.
pause
exit /b 0
