build: torcx.tgz torcx.squashfs


kube-node.tar.gz:
	wget -q https://dl.k8s.io/v1.20.2/kubernetes-node-linux-amd64.tar.gz -O kube-node.tar.gz

kube-node: kube-node.tar.gz
	tar -xzf kube-node.tar.gz


torcx: kube-node
	mkdir -p rootfs/bin
	cp -ar kubernetes/node/bin/* rootfs/bin/

torcx.tgz: torcx
	tar -C rootfs -czf torcx.tgz .

torcx.squashfs: torcx
	mksquashfs rootfs torcx.squashfs
