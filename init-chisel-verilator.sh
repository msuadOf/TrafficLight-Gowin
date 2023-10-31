sudo apt-get install git make autoconf g++ flex bison -y
git clone https://github.com/verilator/verilator
git pull
git checkout v4.226
unset VERILATOR_ROOT # For bash, unsetenv for csh
autoconf # Create ./configure script
./configure
make
sudo make install