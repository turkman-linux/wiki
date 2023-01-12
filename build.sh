#!/bin/sh
# temizlik
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
for sayfa in bash-dersi vala-dersi python-dersi makefile-dersi git-kullanimi docker-kullanimi ; do
    curl https://gitlab.com/sulincix/sayfalar/-/raw/master/rst/$sayfa.rst > source/99-kodlama/$sayfa-dersi.rst
done
make html
find build/html -type f -iname *.html -exec sed -i "s/.*src=\".*\.js\".*//g" {} \;
find build/html -type f -iname *.js -exec rm -rf {} \;
rm -rf build/html/_static/css build/html/{search,genindex}.html
