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

	*

EOF
for sayfa in c-dersi bash-dersi vala-dersi python-dersi makefile-dersi git-kullanimi docker-kullanimi ; do
    curl https://gitlab.com/sulincix/sayfalar/-/raw/master/rst/$sayfa.rst > source/99-kodlama/$sayfa.rst
done
make html pdf

rm build/html/index.html
ln -s main.html build/html/index.html
exit

pip3 install -r requirements.txt
