wget https://github.com/DGideas/xilinx-usb-driver/archive/master.zip
unzip master
cd xilinx-usb-driver-master
sudo apt-get install fxload libusb-dev -y
sudo make
sudo cp libusb-driver.so libusb-driver-DEBUG.so /usr/local/lib

sudo chmod -R 777 /etc/bash.bashrc
echo 'export LD_PRELOAD=/usr/local/lib/libusb-driver.so' >> /etc/bash.bashrc

sudo cp /opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/xusbdfwu.rules /etc/udev/rules.d/50-xusbdfwu.rules
sudo sed -i -e 's/TEMPNODE/tempnode/' -e 's/SYSFS/ATTRS/g' -e 's/BUS/SUBSYSTEMS/' /etc/udev/rules.d/50-xusbdfwu.rules

sudo cp /opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/xusb*.hex /usr/share/
sudo chmod 644 /usr/share/xusb*.hex
sudo sed -i -e 's/#!\/bin\/sh/#!\/bin\/bash/' /opt/Xilinx/14.7/ISE_DS/PlanAhead/bin/planAhead
sudo sed -i -e 's/#!\/bin\/sh/#!\/bin\/bash/' /opt/Xilinx/14.7/ISE_DS/PlanAhead/bin/loader