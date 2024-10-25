# Aggiorna la lista dei pacchetti disponibili e installa gli aggiornamenti per i pacchetti installati
apt-get update -y
apt-get upgrade -y

# Imposta la variabile per evitare prompt interattivi durante l'installazione
export DEBIAN_FRONTEND=noninteractive 

# Installa MySQL Server
apt-get install -y mysql-server

# Crea un nuovo utente MySQL 'userDB' accessibile da qualsiasi host con una password
mysql -e "CREATE USER 'userDB'@'%' IDENTIFIED BY 'Password&1';"

# Concede tutti i privilegi all'utente 'userDB' su tutti i database e tabelle
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'userDB'@'%';"

# Aggiorna i privilegi per rendere effettive le modifiche
mysql -e "FLUSH PRIVILEGES;"

# Crea un database di test chiamato 'utente'
mysql -e "CREATE DATABASE utente;"

# Crea una tabella 'utenti' nel database 'utente' e popola con dati di esempio
mysql -D utente -e "
CREATE TABLE utenti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(50)
);
INSERT INTO utenti (nome, email) VALUES
('Mario Rossi', 'mario.rossi@example.com'),
('Luisa Bianchi', 'luisa.bianchi@example.com'),
('Giovanni Verdi', 'giovanni.verdi@example.com');
"

# Modifica la configurazione di MySQL per permettere connessioni da qualsiasi IP (0.0.0.0)
sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Riavvia il servizio MySQL per applicare le modifiche
systemctl restart mysql
