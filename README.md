# What is Unity Nodes App❔

#### UnityApp is a tool that offers a multitude of features for managing your server, including comprehensive control of Cosmos network nodes supported by our validator. It allows you to install monitoring with Node Exporter, Prometheus, and Grafana with just one click, as well as conveniently view, copy, and transfer backup files to a single directory for Cosmos projects—all without the need for constantly copying extraneous commands. You'll be greeted by a user-friendly interface that is easy to understand for everyone.

![image](https://github.com/UnityNodes/unityapp/assets/159138743/fc536d28-142f-4a6c-b5c6-5dfab6e5cafe)

 
### ◻️ Overview

```bash
bash <(curl -s https://raw.githubusercontent.com/UnityNodes/unityapp/main/unityapp.sh)
``` 

#### The script contains several sections, we will tell you more about each section below:

### 1️⃣ Commands for the server

#### After going to the server management menu, you will be offered the following commands:

![image](https://github.com/UnityNodes/unityapp/assets/159138743/9a04ad59-bbda-4f0a-9866-c5033a2b86cd)


1. **Set server name** - here you can change the name of your server, which will be displayed when entering any commands.

2. **Server update** - this section provides server updates, including packages and necessary programs commonly used when working with the terminal.

3. **Active processes on the server** - you can view all active processes on your server and detailed information about them.

4. **Open port** - often, we encounter the need to open a specific port for our own purposes. With this command, you only need to use this section and enter the necessary ports.

5. **Check RAM** - you can view general information about the RAM resources of your server (total/used/available).

6. **Check CPU** - view information about processes on your server and the amount of CPU resources they are using.

7. **Check SSD** - view general information about directories on your server and how many GB of memory they occupy.

8. **Install Go** - install the latest required programming language Go, widely used in Cosmos network projects.

9. **Removing Go** - you can remove the Go programming language from your server if needed (for example, if it was incorrectly installed, etc.).

10. **What takes SSD on the server** - finding the largest directories and files on your server.



### 2️⃣ Nodes Cosmos Network

#### After entering this menu, you need to select a project from the list of supported ones, and in each of them you can use the following commands:

![image](https://github.com/UnityNodes/unityapp/assets/159138743/029fcaef-e0bc-459f-88db-c1991d0d38fb)

1. **One-line codes (Install, Update, etc)** - one-line scripts that allow you to install / update / delete a node in 1 click.
   
2. **Service (start,stop,restart etc)** - node restart, status, log log and other useful commands.
   
3. **Wallet (balance, delegate etc)** - create a wallet, restore, view wallets, view balance, send tokens, delegation, redelegation, unbonding and all possible useful commands in 1 click.
   
4. **Validator (create, edit etc)** - create a validator, change validator details, jailbreak, your validator details.
   
5. **Maintenance (peers, sync info etc)** - validator information, synchronization status, obtaining node peer, obtaining current peers, setting minimum gas price, reset node data.
    
6. **Governance (vote, proposal etc)** - all possible teams for participating in voting, viewing active ones, creating.
    
7. **Ports (change etc)** - view of occupied ports, view of ports used by the selected node, replacement of ports with others.

### 3️⃣ Monitoring

#### Constant monitoring configured on the server is the key to your success, and it's all in 1 click.

![image](https://github.com/UnityNodes/unityapp/assets/159138743/6d2a1e35-5afe-4f78-88eb-da076ced4ca3)

For this section, we have created a separate guide, following which you will easily understand how to properly configure monitoring on the server.

1. **Node Exporter + Prometheus + Grafana** - you can install everything you need to quickly set up monitoring on your server.
We install everything at once on 1 server, if there is only one, or on the main one, which will be responsible for collecting metrics, and Node exporter will be enough for other servers.

2. **Node exporter** - a tool to collect the necessary metrics that will be displayed in Grafani. Usually, node exporter is installed separately on additional servers, from which metrics are transferred to the main one.

3. **Add server for monitoring** - if you have already set up monitoring of your servers, and want to add another one, you just need to install Node Exporter on it, and from the main server through this point, add the IP of the new server to make changes to the configuration.

### 4️⃣ Validator backup

#### This is an important point, because conditionally your private key is like ownership of your validator. With this key, the validator is able to sign and process transactions, so it is always important to store it in a safe place so that you can restore your validator in any case. For each project in the "Migrate validator" section there is a manual instruction on how to perform these actions, this script facilitates this work - all in a few clicks.

![image](https://github.com/UnityNodes/unityapp/assets/159138743/a67f6220-fd46-48ea-a7c2-3b8e368c629c)

1. **Backup nodes** - creates a folder in the main directory of the server - $HOME/BACKUP, where your private keys will be copied in the future, then you can always transfer them to a safe place, or reinstall the node and restore the work of the validator with your private key.

2. **Backup transfer** - transferring the previously copied private key from the $HOME/BACKUP/ directory to the directory of the reinstalled/migrated node.

3. **Open file priv_validator_key.json** - the private key is contained in priv_validator_json.key , it contains a value that you can view by selecting this option, after which we recommend that you save it in a safe place and replace it in the future if necessary.

### ◻️ Conclusion

#### The development of UnityApp is ongoing, so we will update from time to time about the changes made, so stay tuned for announcements from our team and enjoy your experience.
If necessary, you can always contact us through any social resource (mail/discord/telegram/twitter) and offer ideas for improving UnityApp.
Untiy Nodes team worked for you, happy to create something really convenient and useful for you.
