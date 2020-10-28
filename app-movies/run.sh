#!/bin/sh

echo "EXICUTING JMETER"
echo ""
timestamp="$(date +"%Y-%m-%d_%H-%M-%S")"
pathresult=/result/result_$timestamp

jmeter -p test/app-movies/default.properties -J pathresult=$pathresult -n -t test/app-movies/test.jmx -j $pathresult/jmeter.log

jmeter -g $pathresult/reporthtml.csv -o $pathresult/html
echo "<tr><td><a href='$path/html/index.html'>$path</a></td></tr>" >> pathindex.txt

if [ -f index.html ];
then
rm -r index.html
fi
echo "<!doctype html>" > index.html
echo "<html lang='es'>" >> index.html
echo "<head>" >> index.html
echo "<title>Result test Page</title>" >> index.html
echo "</head>" >> index.html
echo "<body>" >> index.html
echo "<div class='container'>" >> index.html
echo "<div class='row'>" >> index.html
echo "<div class='col 4'>" >> index.html
echo "<h1>Resultados:</h1>" >> index.html
echo "<table class='table'>" >> index.html
echo "<thead>" >> index.html
echo "<tr>" >> index.html
echo "<th scope='col'>Name</th>" >> index.html
echo "</tr>" >> index.html
echo "</thead>" >> index.html
echo "<tbody>" >> index.html
if [ -f pathindex.txt ];
then
while read linea; do
	echo -e "$linea" >> index.html
done < pathindex.txt
fi
echo "</tbody>" >> index.html
echo "</div>" >> index.html
echo "</div>" >> index.html
echo "</div>" >> index.html
echo "</html>" >> index.html