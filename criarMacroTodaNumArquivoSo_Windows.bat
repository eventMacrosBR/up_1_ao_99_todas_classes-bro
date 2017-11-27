@echo off
DEL eventMacros.txt
for %%f in (*.event.pm) do type "%%f" >> "eventMacros.txt"
