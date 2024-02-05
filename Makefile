build: sysext.raw


cni.tar.gz:
	wget -q https://github.com/containernetworking/plugins/releases/download/v0.9.0/cni-plugins-linux-amd64-v0.9.0.tgz -O cni.tar.gz

cni: cni.tar.gz
	mkdir -p rootfs/opt/cni/bin
	tar -zxf cni.tar.gz -C rootfs/opt/cni/bin/


kube-node.tar.gz:
	wget -q https://dl.k8s.io/v1.20.2/kubernetes-node-linux-amd64.tar.gz -O kube-node.tar.gz

kube-node: kube-node.tar.gz
	tar -xzf kube-node.tar.gz


helm.tar.gz:
	wget -q https://get.helm.sh/helm-v3.5.0-linux-amd64.tar.gz -O helm.tar.gz

helm: helm.tar.gz
	tar -xzf helm.tar.gz


sysext: cni kube-node helm
	mkdir -p rootfs/usr/bin
	cp -ar kubernetes/node/bin/* rootfs/usr/bin/
	cp -a linux-amd64/helm rootfs/usr/bin/

sysext.raw: sysext
	mksquashfs rootfs sysext.raw -all-root
