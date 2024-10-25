# Aggiorna la lista dei pacchetti disponibili e installa gli aggiornamenti per i pacchetti installati
apt-get update -y
apt-get upgrade -y

# Installa Apache2 (server web)
apt-get install -y apache2

# Installa PHP e il modulo PHP per Apache, insieme a PHP MySQL per l'interazione con i database MySQL
apt-get install -y php libapache2-mod-php php-mysql

# Riavvia Apache2 per applicare le modifiche e rendere Adminer disponibile
systemctl restart apache2
