#! source inital.sh

sudo apt install python3-pip python3-venv -y

python3 -m venv venv
source venv/bin/activate

pip install requests migen
