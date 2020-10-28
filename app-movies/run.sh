#!/bin/sh

echo "EXICUTING JMETER"
echo ""
timestamp="$(date +"%Y-%m-%d_%H-%M-%S")"
pathresult=/result/result_$timestamp

jmeter -p test/app-movies/default.properties -J pathresult=$pathresult -n -t test/app-movies/test.jmx -j $pathresult/jmeter.log

jmeter -g $pathresult/reporthtml.csv -o $pathresult/html
echo "<tr><td><a href='$pathresult/html/index.html'>$pathresult</a></td></tr>" >> /result/pathindex.txt

if [ -f /result/index.html ];
then
rm -r /result/index.html
fi
echo "<!doctype html>" > /result/index.html
echo "<html lang='es'>" >> /result/index.html
echo "<head>" >> /result/index.html
echo "<title>Result test Page</title>" >> /result/index.html
echo "</head>" >> /result/index.html
echo "<body>" >> /result/index.html
echo "<div class='container'>" >> /result/index.html
echo "<div class='row'>" >> /result/index.html
echo "<div class='col 4'>" >> /result/index.html
echo "<h1>Resultados:</h1>" >> /result/index.html
echo "<table class='table'>" >> /result/index.html
echo "<thead>" >> /result/index.html
echo "<tr>" >> /result/index.html
echo "<th scope='col'>Name</th>" >> /result/index.html
echo "</tr>" >> /result/index.html
echo "</thead>" >> /result/index.html
echo "<tbody>" >> /result/index.html
if [ -f /result/pathindex.txt ];
then
while read linea; do
	echo -e "$linea" >> /result/index.html
done < /result/pathindex.txt
fi
echo "</tbody>" >> /result/index.html
echo "</div>" >> /result/index.html
echo "</div>" >> /result/index.html
echo "</div>" >> /result/index.html
echo "</html>" >> /result/index.html