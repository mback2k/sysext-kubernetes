# Setup

Steps to install and ensure automatic updates using systemd-sysupdate:

```
curl -L https://github.com/mback2k/sysext-kubernetes/releases/latest/download/sysupdate-noop.conf --create-dirs -o /etc/sysupdate.d/noop.conf
curl -L https://github.com/mback2k/sysext-kubernetes/releases/latest/download/sysupdate-kubernetes.conf --create-dirs -o /etc/sysupdate.kubernetes.d/kubernetes.conf
curl -L https://github.com/mback2k/sysext-kubernetes/releases/latest/download/systemd-kubernetes.conf --create-dirs -o /etc/systemd/system/systemd-sysupdate.service.d/kubernetes.conf
curl -L https://github.com/mback2k/sysext-kubernetes/releases/latest/download/systemd-sysext.conf --create-dirs -o /etc/systemd/system/systemd-sysupdate.service.d/sysext.conf
systemctl daemon-reload
systemctl enable systemd-sysupdate.timer
systemctl start systemd-sysupdate.service
```
