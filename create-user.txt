export USER=homelab
export GROUP=homelab

sudo groupadd ${GROUP} --gid 1400
sudo useradd ${USER} --uid 1400 --gid 1400 --create-home
mkdir /home/${USER}/.ssh

ssh-keygen -t ed25519 -a 100 -P "" -f /home/${USER}/.ssh/id_ed25519 -C "${USER}:${GROUP} ssh key"
touch /home/${USER}/.ssh/authorized_keys
cat /home/${USER}/.ssh/id_ed25519.pub >> /home/${USER}/.ssh/authorized_keys

chown -R ${USER}:${GROUP} /home/${USER}/.ssh
chmod 700 /home/${USER}/.ssh && chmod 600 /home/${USER}/.ssh/authorized_keys
