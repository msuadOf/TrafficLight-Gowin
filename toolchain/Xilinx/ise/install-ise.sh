# libncurses.so.5
sudo apt install apt-file -y
sudo apt-file update -y
sudo apt-file find libncurses.so.5 
sudo apt install libncurses5 -y

sudo apt install libncurses* -y

# libSM.so.6:
sudo apt install libsm6 libxi6 libxrender1 libxrandr2 -y

sudo apt install axel -y

axel -n 10 -o ISE.tar 'https://xilinx-ax-dl.entitlenow.com/dl/ul/2013/10/18/R209855202/Xilinx_ISE_DS_Lin_14.7_1015_1.tar?hash=SajHYUuCbim890ztvFU1Jw&expires=1698681552&filename=Xilinx_ISE_DS_Lin_14.7_1015_1.tar' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6' \
  -H 'Connection: keep-alive' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?10' \
  -H 'Upgrade-Insecure-Requests: 10' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76' \

tar -xvf ISE.tar
sudo chmod -R 777 /opt/
./ISE/xsetup

# Xilinx Cable Driver
sudo apt install gitk git-gui libusb-dev build-essential libc6-dev fxload -y

cd ~
sudo git clone git://git.zerfleddert.de/usb-driver Xilinx-Cable-Driver
cd Xilinx-Cable-Driver
sudo apt install libusb-dev -y
sudo make
./setup_pcusb /opt/Xilinx/14.7/ISE_DS/ISE/

sudo su

echo ""\
"[Desktop Entry]
Version=1.0
Name=ISE
Exec=/opt/Xilinx/14.7/ISE_DS/ise
Terminal=false
Icon=/opt/Xilinx/14.7/ISE_DS/ISE/data/images/pn-ise.png
Type=Application
Categories=Development" > /usr/share/applications/ISE.desktop

echo '
#!/bin/bash
export LD_PRELOAD=/opt/Xilinx/usb-driver/libusb-driver.so
ISE_DS_DIR=/opt/Xilinx/14.7/ISE_DS
unset LD_PRELOAD
export gmake=/usr/bin/make

cd "$ISE_DS_DIR"
source "$ISE_DS_DIR"/settings64.sh

export LANG=''  # reset locale to English to fix decimal/comma seperation

"$ISE_DS_DIR"/ISE/bin/lin64/ise

' > /opt/Xilinx/14.7/ISE_DS/ise
sudo chmod a+x /opt/Xilinx/14.7/ISE_DS/ise
exit

