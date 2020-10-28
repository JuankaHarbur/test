#!/bin/sh
echo "THIS INFO FOR EXECUTING JMETER"
echo ""
echo "Donwload tests files"
git clone https://github.com/JuankaHarbur/test.git
echo "End git clone"
echo ""
chmod 777 test/app-movies/run.sh
bash test/app-movies/run.sh