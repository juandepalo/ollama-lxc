# ollama-lxc
pct create 101 /var/lib/vz/template/cache/ubuntu-22.04-standard_*.tar.zst \
  --hostname llama-lab \
  --storage local-lvm \
  --cores 2 \
  --memory 8192 \
  --net0 name=eth0,bridge=vmbr0,ip=dhcp \
  --rootfs local-lvm:20 \
  --ostype ubuntu \
  --password tu_contraseña_segura \
  --features nesting=1 \
  --unprivileged 0 \
  --ciuser root \
  --cicustom "user=local:snippets/cloud-init-userdata.yaml"
