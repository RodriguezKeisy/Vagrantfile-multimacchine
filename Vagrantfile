# -*- mode: ruby -*-
# vi: set ft=ruby :

# Configura l'ambiente Vagrant con la versione 2
Vagrant.configure("2") do |config|
  # Definisce i prefissi di rete per Host-Only e rete Interna
  HO_NETWORK = "192.168.56" 
  INT_NETWORK = "10.10.20"
  BOX_IMAGE = "ubuntu/jammy64"



  # Definisce la macchina virtuale "web"
  config.vm.define "web", primary: true do |web|
    # Utilizza Ubuntu Jammy Jellyfish 64-bit come box base per la VM
    web.vm.box = BOX_IMAGE

    # Imposta il nome host per la VM "web"
    web.vm.hostname = "web.m340"

    # Configura due reti private:
    # 1. Rete Host-Only per connessione esterna
    web.vm.network "private_network", ip: "#{HO_NETWORK}.10", 
      name: "VirtualBox Host-Only Ethernet Adapter"
    
    # 2. Rete Interna per la comunicazione tra VM
    web.vm.network "private_network", ip: "#{INT_NETWORK}.10", netmask: 24,
      virtualbox__intnet: "intnet"
      
    # Provisioning della VM "web" tramite l'esecuzione di uno script shell
    web.vm.provision "shell", path: "scripts/web_provisioning.sh"
    
    # Sincronizza la cartella locale "website" con "/var/www/html" nella VM
    config.vm.synced_folder "./website", "/var/www/html"

    # Configura le impostazioni VirtualBox per la VM "web"
    web.vm.provider "virtualbox" do |vb|
      vb.name = "web.m340"      # Imposta il nome della VM in VirtualBox
      vb.memory = "2048"        # Assegna 2048 MB di memoria
      vb.cpus = 2               # Assegna 2 CPU
    end
  end

  # Definisce la macchina virtuale "db"
  config.vm.define "db" do |db|
    # Utilizza Ubuntu Jammy Jellyfish 64-bit come box base per la VM
    db.vm.box = BOX_IMAGE

    # Imposta il nome host per la VM "db"
    db.vm.hostname = "db.m340"
    
    # Configura una rete Interna per la comunicazione tra VM
    db.vm.network "private_network", ip: "#{INT_NETWORK}.11", netmask: 24,
      virtualbox__intnet: "intnet"

    # Provisioning della VM "db" tramite l'esecuzione di uno script shell
    db.vm.provision "shell", path: "scripts/db_provisioning.sh"
    
    # Configura le impostazioni VirtualBox per la VM "db"
    db.vm.provider "virtualbox" do |vb|
      vb.name = "db.m340"       # Imposta il nome della VM in VirtualBox
      vb.memory = "2048"        # Assegna 2048 MB di memoria
      vb.cpus = 2               # Assegna 2 CPU
    end
  end
end
