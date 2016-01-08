resource "digitalocean_ssh_key" "hyperion-nomad-ssh-key" {
   name = "${var.cluster_name}-ssh-key"
   public_key = "${file("${var.do_pub_key}")}"
}

resource "digitalocean_droplet" "hyperion-nomad-nodes" {
  count = "${var.nb_nodes}"
  name = "${var.cluster_name}-node-${count.index}" // => `hyperion-node-{0,1,...}`
  region = "${var.do_region}"
  image = "${var.do_image}"
  size = "${var.do_size_master}"
  private_networking = true
  ssh_keys = ["${var.do_ssh_fingerprint}"]
  depends_on = [ "digitalocean_ssh_key.hyperion-nomad-ssh-key" ]

  connection {
    key_file = "${var.do_pvt_key}"
    agent = false
  }

  provisioner "remote-exec" {
    inline = [
      "sudo service docker start",
      "sudo service ssh start",
      "sudo docker start rancher-server"
    ]
  }


}
