@echo off
DEL eventMacros.txt

for %%f in (comum\*.pm) do type "%%f" >> "eventMacros.txt"
echo DIGITE A CLASSE DESEJADA PARA GERAR O SCRIPT:
DIR /B classes
set /p CLASSE=
for %%f in (classes\%CLASSE%\*.pm) do type "%%f" >> "eventMacros.txt"
