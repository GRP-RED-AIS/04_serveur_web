

resource "null_resource" "build_site3" {
    connection {
		type	=	"ssh"
		user	=	var.ssh_user
		host	=	var.ssh_host_site3
		private_key = file(var.ssh_key)
    }


 provisioner "file" {
	 source	=	"conf/finatops.html"
	 destination = "/tmp/index.html"
    }

 provisioner "file" {
         source =       "sh/install_nginx.sh"
         destination = "/tmp/install_nginx.sh"
         }

 provisioner "remote-exec" {
      inline= [
     "sudo cp /tmp/install_nginx.sh . ",
     "sudo chown administrateur install_nginx.sh",
     "sudo chmod +x install_nginx.sh",
     "./install_nginx.sh"  
      ]
  }
depends_on = [null_resource.build_site2] 
}

	   
       
