#!/bin/bash
rm eventMacros.txt
for i in *.event.p; do cat $i >> eventMacros.txt; done
