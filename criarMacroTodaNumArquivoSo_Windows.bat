@echo off
DEL eventMacros.txt
for %%f in (*.pm) do type "%%f" >> "eventMacros.txt"
