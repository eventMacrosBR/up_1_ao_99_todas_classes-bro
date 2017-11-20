@echo off
DEL eventMacros.txt
for %%f in (*.event) do type "%%f" >> "eventMacros.txt"