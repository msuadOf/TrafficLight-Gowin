sudo apt install axel -y
axel -n 10 -o Gowin.tar.gz http://cdn.gowinsemi.com.cn/Gowin_V1.9.9Beta-5_linux.tar.gz
axel -n 10 -o Programmer.tar.gz 'http://cdn.gowinsemi.com.cn/programmer1.9.9b5(build30925).Linux.x86.tar.gz'
mkdir -p Gowin
tar -zxvf Gowin.tar.gz -C Gowin
mkdir -p Programmer
tar -zxvf Programmer.tar.gz
rm -rf Gowin/Programmer
mv Programmer Gowin/
sudo chmod -R 777 /opt/ 
mv Gowin /opt/

echo 'export PATH=$PATH:/opt/Gowin/IDE/bin' >> ~/.bashrc

# sudo touch /opt/Gowin/IDE/bin/gwlicense.ini
# sudo chmod 777 /opt/Gowin/IDE/bin/gwlicense.ini

echo '
[license]
lic="43.128.7.128:10559"
' > /opt/Gowin/IDE/bin/gwlicense.ini
cd Gowin


#libftd2xx-x86_64 driver
axel -n 10 -o libftd2xx-x86_64.tgz https://ftdichip.com/wp-content/uploads/2022/07/libftd2xx-x86_64-1.4.27.tgz
tar -zxvf libftd2xx-x86_64.tgz -C .
mv release libftd2xx-x86_64

sudo cp libftd2xx-x86_64/build/libftd2xx.* /usr/local/lib
sudo chmod 0755 /usr/local/lib/libftd2xx.so.1.4.27
sudo ln -sf /usr/local/lib/libftd2xx.so.1.4.27 /usr/local/lib/libftd2xx.so

sudo cp libftd2xx-x86_64/ftd2xx.h  /usr/local/include
sudo cp libftd2xx-x86_64/WinTypes.h  /usr/local/include

sudo ldconfig -v


sudo su
echo 'export PATH=$PATH:/opt/Gowin/IDE/bin/' >> /etc/profile

cd /opt/Gowin/Programmer/Driver
sudo make
sudo bash Gowin_USB_Cable_Installer.sh 

