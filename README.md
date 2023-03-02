# Windows Ports for FiveM and TxAdmin

➤ How to open ports for FXServer:
    
    1. Open Windows Defender Firewall and click on advanced settings.

    2. Open Inbound Rules.

    3. Create a new rule with the following options: Port, TCP, Specific Local Ports: 30120, Allow the connection, Domain, Private, and Public, and create a name that you can remember (ex. FiveM-30120-TCP/UDP)

    4. Repeat step 3, but select UDP as the port protocol. Do not change anything else.

    5. Create a new rule with the following options: Port, TCP, Specific Local Ports: 40120, Allow the connection, Domain, Private, and Public, and create a name that you can remember (ex. TxAdmin-40120-TCP/UDP)

    6. Repeat step 5, but select UDP as the port protocol. Do not change anything else.


***
➤ For a VPS/dedicated server, do the following:

    6. Check the documentation of your hosting service or contact their support team and find the firewall for the VPS, you will have to open the same ports as you did on Windows Defender. The firewall is commonly found on the dashboard of your host.
***

➤ For localhosted/home hosted servers, do the following aswell:

 ## <font color="red"> This is not recommended and is unsafe!</font>

    7. Look up your router model and how to open ports with it (this site can help you https://portforward.com/router.htm).

 ***


<font color="green">If you are lazy u can download a bat file that installs the Ports in your Windows Firewall by it selfs (FiveM Port 30120 and TxAdmin port 40120)</font>
[Ports .bat by Moth](https://github.com/Moth1335/usefull.git)
