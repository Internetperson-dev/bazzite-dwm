sudo dnf install libX11-devel libXft-devel libXinerama-devel libXrandr-devel xorg-x11-xinit-session -- --allow-inactive
mkdir .local/src
cd ~/.local/src

## Install DWM ## 

git clone https://github.com/lukesmithxyz/dwm
cd dwm
curl -LO https://gist.githubusercontent.com/Internetperson-dev/5f47df13624e60cec0fa115d70569a70/raw/3ca4b1b10e3f45aede329b7ed2b2554eb378fb9a/config.h # This sucks....
sudo make install

## Install dmenu ##

cd .local/src
git clone https://github.com/lukesmithxyz/dmenu
cd dmenu
sudo make install


## Install ST ##

cd .local/src
git clone https://github.com/lukesmithxyz/st
cd st
sudo make install

## Install Pulsemixer ##

pip install pulsemixer

## Install scripts  ##

cd ~/
git clone https://github.com/Internetperson-dev/dots/
cd dots/.local/
mkdir -p ~/.local/bin
cp -r ~/dots/.local/bin/* ~/.local/bin/ # What am I even doing with my life?

## Install config ##

cd ~/
cd dots/.config/
cp -r ~/dots/.config* ~/.config 
rm -r dots

## Xinit ## 
cd ~/

cat << EOF > .xinitrc
xrandr --output DP-0 --mode 1920x1080 --rate 144 &
exec dwm
xrandr --output DP-0 --mode 1920x1080 --rate 144 &
EOF

chmod u+x .xinitrc
