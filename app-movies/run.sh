#!/bin/sh

echo "EXICUTING JMETER"
echo ""

jmeter -p test/app-movies/default.properties -n -t test/app-movies/test.jmx