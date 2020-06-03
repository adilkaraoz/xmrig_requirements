BOX_NAME=xmrig_requirements

set -e

vagrant up
vagrant package --output $BOX_NAME.box
