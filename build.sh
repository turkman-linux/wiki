#!/bin/sh
# temizlik
set -ex
rm -rf build
rm -rf source/99-kodlama
# sayfalar dokümanı dizini
mkdir -p source/99-kodlama
cat > source/99-kodlama/index.rst <<EOF
Programlama
===========
.. toctree::
	:glob:

	*-dersi

EOF
for sayfa in c-dersi bash-dersi vala-dersi python-dersi makefile-dersi git-kullanimi docker-kullanimi ; do
    curl https://gitlab.com/sulincix/sayfalar/-/raw/master/rst/$sayfa.rst > source/99-kodlama/$sayfa.rst
done
make html pdf
find build/html -type f -iname *.html -exec sed -i "s/.*src=\".*\.js\".*//g" {} \;
find build/html -type f -iname *.js -exec rm -rf {} \;
rm -rf build/html/_static/css build/html/{search,genindex}.html

rm build/html/index.html
ln -s main.html build/html/index.html
exit

pip3 install -r requirements.txt
