all:
        sudo apt-get update
        sudo apt-get install -y acpica-tools gcc-aarch64-linux-gnu python3-distutils uuid-dev
        git submodule update --init --recursive
        patch --binary -d edk2 -p1 -i ../0001-MdeModulePkg-UefiBootManagerLib-Signal-ReadyToBoot-o.patch
        sh ./build_firmware.sh
        echo "DEBUG RPi4 UEFI Firmware: 'Build/RPi4/DEBUG_GCC5/FV/RPI_EFI.fd'"
        echo "RELEASE RPi4 UEFI Firmware: 'Build/RPi4/RELEASE_GCC5/FV/RPI_EFI.fd'"
