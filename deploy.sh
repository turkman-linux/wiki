# install dependencies
ymp repo --update --ignore-gpg
ymp it make python3.11 python fontconfig --no-emerge
pydefault 3.11
python3.11 -m ensurepip
pip3.11 install sphinx
pip3.11 install rst2pdf
# install font
wget https://github.com/dejavu-fonts/dejavu-fonts/releases/download/version_2_37/dejavu-fonts-ttf-2.37.zip -O font.zip
unzip font.zip
mv dejavu-*/ttf /usr/share/fonts/
fc-cache -fv
# build
sh build.sh
mkdir /output -p
cp -r build/pdf/* /output
cp -r build/html/* /output
