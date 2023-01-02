# Docker

Install Docker on Fedora.

## Installation

Install the dnf plugins which allow you to manage dnf repositories.

```sh
sudo dnf install dnf-plugins-core
```

Add the Docker repository to dnf.

```sh
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
```

Install the latest Docker engine.

```sh
sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

Enable and start the Docker service.

```sh
sudo systemctl enable --now docker
sudo systemctl enable --now containerd.service
```

Add the current user to the Docker group.

```sh
sudo groupadd docker
sudo usermod -aG docker $USER
```

Reboot the system.

## Portainer

Create the Portainer image.

```sh
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
```

Once finished, check the status of the image.

```sh
docker ps
```

Portainer will be available on <https://localhost:9443>. Create an account to login.
