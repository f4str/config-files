# CUDA or ROCm

Install CUDA or ROCm on Fedora.

Full instructions here:

* CUDA: <https://rpmfusion.org/Howto/CUDA>
* ROCm: <https://fedoraproject.org/wiki/SIGs/HC>

## CUDA

Enable the RPM fusion repos.

```sh
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

Add the CUDA repo.

```sh
sudo dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/fedora35/x86_64/cuda-fedora35.repo
```

Disable the standard NVIDIA drivers.

```sh
sudo dnf clean all
sudo dnf module disable nvidia-driver
```

Install the CUDA drivers using `dnf`.

```sh
sudo dnf install cuda
```

Reboot the system and verify using nvidia-smi.

```sh
nvidia-smi
```

## ROCm

To add the current user to the video group.

```sh
sudo usermod -a -G video $LOGNAME
```

Install and run rocminfo to check for ROCm support.

```sh
sudo dnf install rocminfo
rocminfo
```

Install ROCm with OpenCL.

```sh
sudo dnf install rocm-opencl
```

Install and run rocm-clinfo to verify everything is working.

```sh
sudo dnf install rocm-clinfo
rocm-clinfo
```

Install rocm-smi.

```sh
sudo dnf install rocm-smi
```

Add the following line to the `~/.bashrc` or `~/.zshrc`.

```sh
export HSA_OVERRIDE_GFX_VERSION="10.3.0"
```

Reboot the system and verify using rocm-smi.

```sh
rocm-smi
```
