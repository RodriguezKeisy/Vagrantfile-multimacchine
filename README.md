### Autore
 Nome: **Keisy Rodriguez** -
 Email: <keisy.rodrguez@samtrevano.ch>

# Vagrantfile multi-macchina

## Descrizione
Questo progetto utilizza Vagrant per creare due macchine virtuali (VM) usando la box **ubuntu/jammy64**. 

1. La VM ***web.m340*** fa da server web con un framework di backend (**PHP**) e un gestore di database (**Adminer**).
2. La VM ***db.m340*** fa da database MySQL.

Il progetto include una rete interna e una rete "host-only". L'applicazione web si connette al database tramite un utente non root (**userDB**), mentre una cartella condivisa per le pagine del sito (**website**) viene montata automaticamente.

## Requisiti
- **Vagrant 2.x**
- **VirtualBox**

## Configurazione

### Variabili di configurazione
Le seguenti variabili possono essere personalizzate nel `Vagrantfile`:
- **HO_NETWORK**: Rete "host-only" per consentire l'accesso alla VM web dall'host. (`192.168.56`)
- **INT_NETWORK**: Rete interna per la comunicazione tra le macchine virtuali. (`10.10.20`)
- **BOX_IMAGE**: Immagine Vagrant da utilizzare (predefinita:  `ubuntu/jammy64`)

### Indirizzi IP delle VM
- VM **web.m340**: 
  - Rete host-only: `192.168.56.10`
  - Rete interna: `10.10.20.10`
- VM **db.m340**:
  - Rete interna: `10.10.20.11`

## Provisioning
- VM **web.m340**: 
    - Installare un server web e un framework backend (**PHP**) nella VM **web**.
    - Installare e configurare **Adminer** per gestire il database tramite un'interfaccia web.
- VM **db.m340**:
    - Installare **MySQL** sulla VM **db**.
    - Creare un utente diverso da root (**userDB**) per la connessione al database (**utente**).
    - Impostare la connessione tra l'applicazione web e il database.

## Mount automatico della cartella contenente le pagine del sito
La cartella che ospita il codice del nostro sito (**website**) viene montata automaticamente all'interno della VM ***web.m340*** nella path: `/var/www/html`.  
 Le modifiche apportate ai file locali verranno sincronizzate automaticamente con la macchina virtuale.

## Installazione


1. Clonare il repository:

   ```bash
   git clone https://github.com/RodriguezKeisy/Vagrantfile.git
   cd Vagrantfile
   ```

2. Modificare, se necessario, le variabili di configurazione nel `Vagrantfile`.

3. Avviare le macchine virtuali:

   ```bash
   vagrant up
   ```

4. Accedere alla VM ***web.m340*** tramite SSH:

   ```bash
   vagrant ssh web
   exit
   ```

5. Accedere alla VM ***db.m340*** tramite SSH:

   ```bash
   vagrant ssh db
   exit
   ```

6. L'applicazione web sarà disponibile all'indirizzo:

   ```
   http://192.168.56.10
   ```

7. Credenziali di Adminer
    - Sistema: **MySQL**
    - Server: **10.10.20.11**
    - Utente: **userDB**
    - Password: **Password&1**
    - Database: **Utente**

8. Log in Adminer \
  Una volta dentro cliccare sulla tabella utenti e le informazioni saranno visibili.


