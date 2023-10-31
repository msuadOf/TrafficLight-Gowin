
# https://github.com/chipsalliance/chisel/blob/main/SETUP.md
sudo apt-get install default-jdk -y

echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | sudo tee /etc/apt/sources.list.d/sbt.list
echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | sudo tee /etc/apt/sources.list.d/sbt_old.list
sudo apt  install curl -y
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add
sudo apt-get update
sudo apt-get install sbt -y

#sudo sh -c "curl -L https://raw.githubusercontent.com/lefou/millw/0.4.10/millw > /usr/local/bin/mill && chmod +x /usr/local/bin/mill"
sudo sh -c "curl -L https://github.com/com-lihaoyi/mill/releases/download/0.10.0-M4/0.10.0-M4 > /usr/local/bin/mill && chmod +x /usr/local/bin/mill"

wget -q -O - https://github.com/llvm/circt/releases/download/firtool-1.38.0/firrtl-bin-ubuntu-20.04.tar.gz | tar -zx
sudo mv firtool-1.38.0/bin/firtool /usr/local/bin/