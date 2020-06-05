#!/usr/bin/env bash

USER_NAME=$1

sudo apt-get update && sudo apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev wget -y

# Download and build xmrig mining tool
git clone https://github.com/xmrig/xmrig.git
cd xmrig && mkdir build && cd build
cmake ..
make

sudo ln -s /home/$USER_NAME/xmrig/build/xmrig /usr/local/bin/xmrig

cat /sys/kernel/mm/transparent_hugepage/enabled
sudo sysctl -w vm.nr_hugepages=8

cd ../..

# Download cpuminer-opt mining tool
wget https://github.com/cpu-pool/cpuminer-opt-cpupower/releases/download/1.4/Cpuminer-opt-cpu-pool-linux64.tar.gz
mkdir Cpuminer
tar -xf Cpuminer-opt-cpu-pool-linux64.tar.gz -C Cpuminer
rm -rf Cpuminer-opt-cpu-pool-linux64.tar.gz

sudo ln -s /home/$USER_NAME/Cpuminer/cpuminer /usr/local/bin/cpuminer

echo y | sudo ufw enable
sudo ufw allow "OpenSSH" && sudo ufw allow 33824

# remove apt-cache
sudo apt-get clean

# clear the Bash History
cat /dev/null > ~/.bash_history && history -c
