build: torcx.tgz torcx.squashfs


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


torcx: cni kube-node helm
	mkdir -p rootfs/bin
	cp -ar kubernetes/node/bin/* rootfs/bin/
	cp -a linux-amd64/helm rootfs/bin/

torcx.tgz: torcx
	tar -C rootfs -czf torcx.tgz .

torcx.squashfs: torcx
	mksquashfs rootfs torcx.squashfs
