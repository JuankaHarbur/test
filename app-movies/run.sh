#!/bin/sh

echo "EXICUTING JMETER"
echo ""
timestamp="$(date +"%Y-%m-%d_%H-%M-%S")"
pathresult=result_$timestamp

jmeter -p test/app-movies/default.properties -J pathresult=$pathresult -n -t test/app-movies/test.jmx -j $pathresult/jmeter.log

jmeter -g $pathresult/reporthtml.csv -o $pathresult/html