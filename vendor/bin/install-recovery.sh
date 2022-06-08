#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:0ec4eb78959c980a974095870db4d011e39b7896; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:a19106064ca9a652e1f4d6e607f8610a589bf399 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:0ec4eb78959c980a974095870db4d011e39b7896 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
