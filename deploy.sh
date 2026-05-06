# install dependencies
set -ex
ymp repo --update --ignore-gpg
ymp it make python3.14 python fontconfig py3-cairo brotli dejavu --upgrade --no-emerge --ignore-quarantine --jobs=1
pydefault 3.14
python3.14 -m ensurepip
pip3.14 install sphinx
pip3.14 install rst2pdf
pip3.14 install simple-sphinx-xml-sitemap
# build
sh build.sh
mkdir /output -p
cp -r build/pdf/* /output
cp -r build/html/* /output
cp robots.txt /output
