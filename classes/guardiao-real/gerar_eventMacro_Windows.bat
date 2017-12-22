@echo off
DEL eventMacros.txt
for %%f in (*.pm) do type "%%f" >> "eventMacros.txt"
for %%f in (..\..\comum\*.pm) do type "%%f" >> "eventMacros.txt"
echo eventMacros.txt gerado com sucesso