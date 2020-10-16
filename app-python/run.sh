#!/bin/sh

echo "EXICUTING JMETER"
echo ""

jmeter -p test/app-python/custom.properties -n -t test/app-python/testing.jmx