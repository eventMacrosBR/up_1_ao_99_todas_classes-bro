@if (@CodeSection == @Batch) @then


@echo off
setlocal EnableDelayedExpansion
set var=1


rem Multi-line menu with options selection via DOSKEY
rem Antonio Perez Ayala

rem Define the options
set numOpts=0
for /f %%a in ('dir /b /a:d classes') do (
   set /A numOpts+=1
   set "option[!numOpts!]=%%a"
)
set /A numOpts+=1
set "option[!numOpts!]=sair"

rem Clear previous doskey history
doskey /REINSTALL
rem Fill doskey history with menu options
cscript //nologo /E:JScript "%~F0" EnterOpts
for /L %%i in (1,1,%numOpts%) do set /P "var="

:nextOpt
cls
echo Gerador de eventMacro.txt
echo/



rem Send a F7 key to open the selection menu
cscript //nologo /E:JScript "%~F0"
set /P var=
echo/


DEL eventMacros.txt
if "%var%" equ "sair" goto :EOF
for %%f in (classes\%var%\*.pm) do type "%%f" >> "eventMacros.txt"
for %%f in (comum\*.pm) do type "%%f" >> "eventMacros.txt"
echo Criado evenMacros.txt para %var%
pause
goto :EOF


@end

var wshShell = WScript.CreateObject("WScript.Shell"),
    envVar = wshShell.Environment("Process"),
    numOpts = parseInt(envVar("numOpts"));

if ( WScript.Arguments.Length ) {
   // Enter menu options
   for ( var i=1; i <= numOpts; i++ ) {
      wshShell.SendKeys(envVar("option["+i+"]")+"{ENTER}");
   }
} else {
   // Enter a F7 to open the menu
   wshShell.SendKeys("{F7}");
}