#!/bin/bash
#cloning git repository of wt
git clone https://github.com/emweb/wt.git
cd wt
#checkout to the choosen version
git checkout tags/$wtVersion

#generate html files of documentation and export it to apache folder
( cat Doxyfile ; echo "GENERATE_HTML=YES"; echo "OUTPUT_DIRECTORY=/var/www/localhost/htdocs" ) | doxygen -

cd ..

rm -r wt

/usr/sbin/httpd -D FOREGROUND

