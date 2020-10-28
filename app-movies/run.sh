#!/bin/sh

echo "EXICUTING JMETER"
echo ""
timestamp="$(date +"%Y-%m-%d_%H-%M-%S")"
pathresult=/usr/share/nginx/html/result_$timestamp

jmeter -p test/app-movies/default.properties -J pathresult=$pathresult -n -t test/app-movies/test.jmx -j $pathresult/jmeter.log

jmeter -g $pathresult/reporthtml.csv -o $pathresult/html
echo "<tr><td><a href='$pathresult/html/index.html'>$pathresult</a></td></tr>" >> /usr/share/nginx/html/pathindex.txt

if [ -f /usr/share/nginx/html/index.html ];
then
rm -r /usr/share/nginx/html/index.html
fi
echo "<!doctype html>" > /usr/share/nginx/html/index.html
echo "<html lang='es'>" >> /usr/share/nginx/html/index.html
echo "<head>" >> /usr/share/nginx/html/index.html
echo "<title>Result test Page</title>" >> /usr/share/nginx/html/index.html
echo "</head>" >> /usr/share/nginx/html/index.html
echo "<body>" >> /usr/share/nginx/html/index.html
echo "<div class='container'>" >> /usr/share/nginx/html/index.html
echo "<div class='row'>" >> /usr/share/nginx/html/index.html
echo "<div class='col 4'>" >> /usr/share/nginx/html/index.html
echo "<h1>Resultados:</h1>" >> /usr/share/nginx/html/index.html
echo "<table class='table'>" >> /usr/share/nginx/html/index.html
echo "<thead>" >> /usr/share/nginx/html/index.html
echo "<tr>" >> /usr/share/nginx/html/index.html
echo "<th scope='col'>Name</th>" >> /usr/share/nginx/html/index.html
echo "</tr>" >> /usr/share/nginx/html/index.html
echo "</thead>" >> /usr/share/nginx/html/index.html
echo "<tbody>" >> /usr/share/nginx/html/index.html
if [ -f /usr/share/nginx/html/pathindex.txt ];
then
while read linea; do
	echo -e "$linea" >> /usr/share/nginx/html/index.html
done < /usr/share/nginx/html/pathindex.txt
fi
echo "</tbody>" >> /usr/share/nginx/html/index.html
echo "</div>" >> /usr/share/nginx/html/index.html
echo "</div>" >> /usr/share/nginx/html/index.html
echo "</div>" >> /usr/share/nginx/html/index.html
echo "</html>" >> /usr/share/nginx/html/index.html