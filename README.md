# Server health check

[![made-for-VSCode](https://img.shields.io/badge/Made%20for-Powershell-1f425f.svg)](https://code.visualstudio.com/)

## How to use this script

The powershell script to launch is 'windowsscript.ps1'.
Either right click it and select 'launch with powershell' or use the command line to go to the scripts location and launch the script by typing ".\windowsscript.ps1".
For some functions it is necessary to launch the script with elevated permissions.
You can select menu option 11 'Open current directory with elevated permissions' to do exactly that, and launch the script from there.

## Menu

Once you launched ".\windowsscript.ps1" you wil be greeted by this menu.
Select  the function you want to use by typing the number next to it and hitting 'return'.

```bash
================ Powershell health check ================
1: Healthcheck (full) with HTML output
2: Check CPU-usage
3: Check RAM-usage
4: Check Disk-usage
5: Show Event Logs
6: Show Installed Programs
7: Show Live Processes
8: Show Users
9: Show Shares
10: Show Services
11: Open current directory with elevated permissions
Q: Quit
Please make a selection:
```

## CPU-usage

Shows the user, the total used CPU usage.

```bash
------------------------------------------------------
                Checking 'CPU Usage WORKING'
------------------------------------------------------

Live processor ussage: 41%

InstanceName CPU   
------------ ---   
teams        16.70%
code         15.92%
code         4.47% 
dwm          3.88% 
teams        3.30% 
teams        2.52% 
chrome       1.36% 
audiodg      1.36% 
code         1.16% 
skype        0.78% 
```

## RAM-usage

Shows the user, the total used RAM usage and used memory.

```bash
------------------------------------------------------
                Checking 'RAM Usage WORKING'
------------------------------------------------------

Live RAM-Usage: 76.18%

Used Memory(Mb) ProcessName
--------------- -----------
            358 vmmem
            278 Memory Compression
            266 Teams
            245 Teams
            198 Dropbox
            169 Code
            166 chrome
            161 Code
            155 Teams
            154 Teams
            150 chrome
            146 cmdagent
            135 cavwp
            117 Teams
            107 explorer
```

## Disk-usage

Shows the user, the total used disk usage and their free/used space.

```bash
------------------------------------------------------
                Checking 'Disk Usage WORKING'
------------------------------------------------------


Name                                              Total Capacity (GB) Free Space (GB) Free (%)
----                                              ------------------- --------------- --------
\\?\Volume{32ba77f2-94ec-4a00-a8ed-715750ad131c}\                0,25            0,17       69
D:\                                                            914,89          553,37       60
\\?\Volume{63a8daee-1846-4218-84cd-9ee54c69206a}\                0,96            0,29       30
E:\                                                             16,62            1,96       12
C:\                                                            118,01            6,82        6

```

## Event logs

Shows the user, the logs of events happened on the system and counts them by id. Eg. User logins

```bash
------------------------------------------------------
                CHECKING SECURITY LOG
------------------------------------------------------

EventId Count Info
------- ----- ----
   5379 26814 Credential Manager credentials were read
   4798  1769 A user's local group membership was enumerated.
   5038  1448 Code integrity determined that the image hash of a file is not valid
   4907  1082 Auditing settings on object were changed
   4624   816 An account was successfully logged on
   4672   757 Special privileges assigned to new logon
   5061   340 Cryptographic operation
   5059   101 Key migration operation
   4634    96 An account was logged off
   4648    84 A logon was attempted using explicit credentials
   5382    80 Vault credentials were read
   4797    76 An attempt was made to query the existence of a blank password for an account
   4799    64 A security-enabled local group membership was enumerated
   4688    52 A new process has been created
   5058    42 Key file operation
   4738    35 A user account was changed
   4647    16 User initiated logoff
   5381    15 Vault credentials were read
   4608     4 Windows is starting up
   4826     4 Boot Configuration Data loaded
   1100     4 The event logging service has shut down
   4696     4 A primary token was assigned to process
   5024     4 The Windows Firewall Service has started successfully
   5033     4 The Windows Firewall Driver has started successfully
   4902     4 The Per-user audit policy table was created
   4625     2 An account failed to log on
   6281     2 Code Integrity determined that the page hashes of an image file are not valid...
   4616     1 The system time was changed.

------------------------------------------------------
                 CHECKING SYSTEM LOG
------------------------------------------------------

EventId Count Info
------- ----- ----
      0   233 No description
  10016   143 No description
     37    40 No description
  10010    38 The server did not register with DCOM within the required timeout.
    219    18 No description
   1014    14 No description
   7000    10 No description
      3     6 No description
     11     6 No description
      6     6 No description
    157     6 No description
  10002     5 No description
   1538     5 No description
   7009     4 No description
   5007     2 No description
   7011     2 No description
  10028     1 No description
  10400     1 No description


------------------------------------------------------
             CHECKING APPLICATION LOG
------------------------------------------------------

EventId Count Info
------- ----- ----
   2002    16 No description
     64    15 No description
    100    13 Het systeem kan de opgegeven omgevingsoptie niet vinden.
  10010    12 No description
    902     5 Software Protection Service has started/is starting.
    903     4 Software Protection Service has stopped.
     13     4 No description
   8193     4 No description
   1020     3 No description
   1008     3 No description
   1032     2 No description
   2004     1 No description
   6004     1 No description
   1002     1 No description


------------------------------------------------------
                    Saving Logs
------------------------------------------------------
Log saved: ./logs/logfile-system-17-11-2020.txt
Log saved: ./logs/logfile-security-17-11-2020.txt
Log saved: ./logs/logfile-application-17-11-2020.txt

------------------------------------------------------
                    Comparing Logs
------------------------------------------------------
========> No Security log to compare with
========> No System log to compare with
========> No Application log to compare with
```

## Installed programs

Shows the user, the first ten installed programs on the system along with the necessary info. And checks if it changed from the last time checked.
Beware, if you want to compair you must to change the $saveid= , number 1 if for the reference (befor) and number 2 is the difference object (after).

```bash
------------------------------------------------------
                Checking Installed Programs
------------------------------------------------------


    Directory: D:\VIVES\Vakken\Windows2\windows2-script\logs


Mode          LastWriteTime Length Name
----          ------------- ------ ----
-a---- 23/11/2020     13:32      0 logfile-system-23-11-2020.txt
-a---- 23/11/2020     13:32      0 logfile-security-23-11-2020.txt
-a---- 23/11/2020     13:32      0 logfile-application-23-11-2020.txt



DisplayName                    DisplayVersion  Publisher                  InstallDate
-----------                    --------------  ---------                  -----------
Visual Studio Community 2019   16.5.30011.22   Microsoft Corporation      20200511
Adobe Digital Editions 4.5     4.5.11          Adobe Systems Incorporated
Arduino                        1.8.9           Arduino LLC
Audacity 2.3.3                 2.3.3           Audacity Team              20200423
Battle.net                                     Blizzard Entertainment

Visual Studio Build Tools 2017 15.9.28307.1300 Microsoft Corporation      20201113
DB Browser for SQLite          3.10.1          DB Browser for SQLite Team
Digilent Software              1.5.8           Digilent, Inc.
Dream Aquarium



saved in: ./logs/inst-prog-11-11-2020-2.txt

------------------------------------------------------
                difference's
------------------------------------------------------

Dropbox                                                                       110.4.458              Dropbox, Inc.
GeoGebra 5                                                                    5.0.438.0              International GeoGebra Ins...
Google Chrome                                                                 87.0.4280.66           Google LLC
Microsoft Edge                                                                87.0.664.41            Microsoft Corporation
Origin                                                                        10.5.88.45577          Electronic Arts, Inc.
Wireshark 3.2.1 64-bit                                                        3.2.1                  The Wireshark developer co...
Adobe Acrobat Reader DC - Nederlands                                          20.013.20066           Adobe Systems Incorporated
```

## Live Processes

Shows the user, the current live processes on the system.
Beware, if you want to compair you must to change the $saveid= , number 1 if for the reference (befor) and number 2 is the difference object (after).

```bash
------------------------------------------------------
                Checking 'All live processes working'
------------------------------------------------------


Handles  NPM(K)    PM(K)      WS(K)     CPU(s)     Id  SI ProcessName
-------  ------    -----      -----     ------     --  -- -----------
   7558       0      192        104   9.886,05      4   0 System
    879      21    28760      33268   4.712,13  16076   0 audiodg
      0       0     2396     110584   1.542,06   3032   0 Memory Compression
    276      46    91892      32696   1.143,31  17844   0 cavwp
    953      37    56620     214808   1.113,05   2384   0 cmdagent
    469      20    12628       8396     754,13   1408   0 svchost
   1511      65   175032     111220     669,11  15948  12 Teams
    176      13    63460      66240     467,22  15452  12 software_reporter_tool
    936      32   174660     108680     441,05  25256  12 Teams
    323      17     8128       4408     413,25   6140   0 vmware-authd



saved in: ./logs/proc-11-11-2020-2.txt

------------------------------------------------------
                difference's
------------------------------------------------------

GameBar
GameBarFTServer
hpqwmiex
LockApp
Microsoft.Photos
MicrosoftEdgeUpdate
RemindersServer
rundll32
software_reporter_tool
software_reporter_tool
software_reporter_tool
software_reporter_tool
usocoreworker
```

## Users

Shows the user, the users on the system along with the necessary info. And checks if it changed from the last time checked.

```bash
------------------------------------------------------
                Checking Users
------------------------------------------------------


    Directory: D:\VIVES\Vakken\Windows2\windows2-script\logs


Mode          LastWriteTime Length Name
----          ------------- ------ ----
-a---- 23/11/2020     13:33      0 inst-prog-11-11-2020-2.txt
-a---- 23/11/2020     13:35      0 proc-11-11-2020-2.txt



Name                PrincipalSource LastLogon           PasswordChangeableDate PasswordLastSet     Description
----                --------------- ---------           ---------------------- ---------------     -----------
WDAGUtilityAccount            Local                     16/09/2018 21:37:06    16/09/2018 21:37:06 Een gebruikersaccount dat wordt beheerd en gebruikt door het systeem voor Windows Defender Application Guard-scenario's.
Gast                          Local                                                                Ingebouwd account voor gasttoegang op de computer of het domein
Tjoep                         Local 16/03/2020 13:01:38 16/03/2020 13:00:10    16/03/2020 13:00:10
Administrator                 Local 6/12/2017 1:37:21                          18/03/2017 4:53:19  Ingebouwd account voor beheer van de computer of het domein
DefaultAccount                Local                                                                Een gebruikersaccount dat wordt beheerd door het systeem.
dhond              MicrosoftAccount                     16/03/2020 12:58:42    16/03/2020 12:58:42
benja              MicrosoftAccount                     14/09/2018 19:21:13    14/09/2018 19:21:13
mamam              MicrosoftAccount                     16/03/2020 12:58:42    16/03/2020 12:58:42


maandag 11/23/2020 13:36 +01:00

Number of Local accounts:  5
Number of Microsoft accounts:  3

Files are different
PasswordChangeableDate : 16/09/2018 21:37:06
PasswordLastSet        : 16/09/2018 21:37:06
Description            : Een gebruikersaccount dat wordt beheerd en gebruikt door het systeem voor Windows Defender Application Guard-scenario's.
Name                   : Gast
Description            : Ingebouwd account voor gasttoegang op de computer of het domein
Name                   : Tjoep
LastLogon              : 16/03/2020 13:01:38
PasswordChangeableDate : 16/03/2020 13:00:10
PasswordLastSet        : 16/03/2020 13:00:10
Description            :
LastLogon              : 6/12/2017 1:37:21
PasswordLastSet        : 18/03/2017 4:53:19
Description            : Ingebouwd account voor beheer van de computer of het domein
Description            : Een gebruikersaccount dat wordt beheerd door het systeem.
Name                   : dhond
PrincipalSource        : MicrosoftAccount
PasswordChangeableDate : 16/03/2020 12:58:42
PasswordLastSet        : 16/03/2020 12:58:42
Description            :
Name                   : benja
PrincipalSource        : MicrosoftAccount
PasswordChangeableDate : 14/09/2018 19:21:13
PasswordLastSet        : 14/09/2018 19:21:13
Description            :
Name                   : mamam
PrincipalSource        : MicrosoftAccount
PasswordChangeableDate : 16/03/2020 12:58:42
PasswordLastSet        : 16/03/2020 12:58:42
Description            :
```

## Shares

Shows the user, the shares on the system and makes a backup.
Beware, if you want to compair you must to change the $saveid= , number 1 if for the reference (befor) and number 2 is the difference object (after).

```bash
------------------------------------------------------
                Checking 'All shares'
------------------------------------------------------


Name     Path        Description
----     ----        -----------
ADMIN$   C:\WINDOWS  Extern beheer
C$       C:\         Standaardshare
D$       D:\         Standaardshare
E$       E:\         Standaardshare
IPC$                 Externe IPC
SERVERS! D:\SERVERS!



saved in: ./logs/shares-11-11-2020-2.txt

------------------------------------------------------
                difference's
------------------------------------------------------
```

## Services

Show the user, the running or stopped services on the system. Also show the differences from last time, a backup is made afterwards.

```bash
------------------------------------------------------      
                Checking Services
------------------------------------------------------      


Status  Name                                                   DisplayName
------  ----                                                   -----------
Stopped RpcLocator                                             Remote Procedure Call (RPC) Locator
Stopped rpcapd                                                 Remote Packet Capture Protocol v.0 (experimental)
Stopped RetailDemo                                             Retaildemoservice
Stopped SCPolicySvc                                            Smart Card Removal Policy
Stopped ScDeviceEnum                                           Smart Card Device Enumeration Service
Stopped SCardSvr                                               Smart Card
Stopped RemoteRegistry                                         Remote Registry
Stopped PrintWorkflowUserSvc_19108e9                           PrintWorkflow_19108e9
Stopped PrintNotify                                            Printer Extensions and Notifications
Stopped PNRPsvc                                                Peer Name Resolution Protocol
Stopped RemoteAccess                                           Routing and Remote Access
Stopped RasAuto                                                Remote Access Auto Connection Manager
Stopped PushToInstall                                          Windows PushToInstall-service
Stopped SDRSVC                                                 Windows Back-up
Stopped SmsRouter                                              Microsoft Windows SMS Router-service.
Stopped smphost                                                Microsoft Storage Spaces SMP
Stopped shpamsvc                                               Shared PC Account Manager
Stopped sppsvc                                                 Software Protection
Stopped spectrum                                               Windows Perception Service
Stopped SNMPTRAP                                               SNMP Trap
Stopped SharedRealitySvc                                       Spatial Data Service
Stopped SensorService                                          Sensor Service
Stopped SensorDataService                                      Sensor Data Service
Stopped seclogon                                               Secondary Logon
Stopped SgrmBroker                                             System Guard Runtime Monitor Broker
Stopped SessionEnv                                             Remote Desktop Configuration
Stopped SensrSvc                                               Sensor Monitoring Service
Stopped PNRPAutoReg                                            PNRP Machine Name Publication Service
Stopped MixedRealityOpenXRSvc                                  Windows Mixed Reality OpenXR Service
Stopped MicrosoftEdgeElevationService                          Microsoft Edge Elevation Service
Stopped MessagingService_19108e9                               MessagingService_19108e9
Stopped msiserver                                              Windows Installer
Stopped MSiSCSI                                                Microsoft iSCSI Initiator Service
Stopped MSDTC                                                  Distributed Transaction Coordinator
Stopped MapsBroker                                             Downloaded Maps Manager
Stopped KtmRm                                                  KtmRm for Distributed Transaction Coordinator
Stopped IpxlatCfgSvc                                           Configuratieservice voor IP-vertaling
Stopped Intel(R) TPM Provisioning Service                      Intel(R) TPM Provisioning Service
Stopped LxssManagerUser_19108e9                                LxssManagerUser_19108e9
Stopped LxpSvc                                                 Service Language Experience
Stopped lltdsvc                                                Link-Layer Topology Discovery Mapper
Stopped MyWiFiDHCPDNS                                          Wireless PAN DHCP Server
Stopped perceptionsimulation                                   Windows Perception Simulation Service
Stopped p2psvc                                                 Peer Networking Grouping
Stopped p2pimsvc                                               Peer Networking Identity Manager
Stopped pla                                                    Performance Logs & Alerts
Stopped PhoneSvc                                               Phone Service
Stopped PerfHost                                               Performance Counter DLL Host
Stopped ose                                                    Office  Source Engine
Stopped Netlogon                                               Netlogon
Stopped NcaSvc                                                 Network Connectivity Assistant
Stopped NaturalAuthentication                                  Natuurlijke authenticatie
Stopped Origin Client Service                                  Origin Client Service
Stopped NetTcpPortSharing                                      Net.Tcp Port Sharing Service
Stopped NetSetupSvc                                            Network Setup Service
Stopped ssh-agent                                              OpenSSH Authentication Agent
Stopped WFDSConMgrSvc                                          Wi-Fi Direct Services Connection Manager-service
Stopped WerSvc                                                 Windows Error Reporting Service
Stopped wercplsupport                                          Problem Reports and Solutions Control Panel Support
Stopped WinRM                                                  Windows Remote Management (WS-Management)
Stopped WinDefend                                              Windows Defender Antivirus Service
Stopped WiaRpc                                                 Still Image Acquisition Events
Stopped WEPHOSTSVC                                             Windows Encryption Provider Host Service
Stopped wcncsvc                                                Windows Connect Now - Config Registrar
Stopped WbioSrvc                                               Windows Biometric Service
Stopped wbengine                                               Block Level Backup Engine Service
Stopped Wecsvc                                                 Windows Event Collector
Stopped WebClient                                              WebClient
Stopped WdNisSvc                                               Windows Defender Antivirus Network Inspection Service
Stopped wisvc                                                  Windows Insider-service
Stopped XblAuthManager                                         Xbox Live-verificatiebeheer
Stopped WsDrvInst                                              Wondershare Driver Install Service
Stopped WPDBusEnum                                             Portable Device Enumerator Service
Stopped XboxNetApiSvc                                          Netwerkservice van Xbox Live
Stopped XboxGipSvc                                             Xbox Accessory Management Service
Stopped XblGameSave                                            Games opslaan op Xbox Live
Stopped WpcMonSvc                                              Ouderlijk toezicht
Stopped WManSvc                                                Windows Management Service
Stopped wlpasvc                                                Lokale profielassistentservice
Stopped wlidsvc                                                Microsoft Account Sign-in Assistant
Stopped workfolderssvc                                         Work Folders
Stopped WMPNetworkSvc                                          Windows Media Player Network Sharing Service
Stopped wmiApSrv                                               WMI Performance Adapter
Stopped WAS                                                    Windows Process Activation Service
Stopped VacSvc                                                 Volumetric Audio Compositor-service
Stopped upnphost                                               UPnP Device Host
Stopped UmRdpService                                           Remote Desktop Services UserMode Port Redirector
Stopped vmicguestinterface                                     Hyper-V Guest Service Interface
Stopped vds                                                    Virtual Disk
Stopped VBoxSDS                                                VirtualBox system service
Stopped uhssvc                                                 Microsoft Update Health Service
Stopped TieringEngineService                                   Storage Tiers Management
Stopped swprv                                                  Microsoft Software Shadow Copy Provider
Stopped svsvc                                                  Spot Verifier
Stopped tzautoupdate                                           Updater van automatische tijdzone
Stopped TrustedInstaller                                       Windows Modules Installer
Stopped TroubleshootingSvc                                     Aanbevolen Troubleshooting Service
Stopped vmicheartbeat                                          Hyper-V Heartbeat Service
Stopped w3logsvc                                               W3C-logboekregistratieservice
Stopped W32Time                                                Windows Time
Stopped VSStandardCollectorService150                          Visual Studio Standard Collector Service 150
Stopped WarpJITSvc                                             WarpJITSvc
Stopped WalletService                                          WalletService
Stopped WaaSMedicSvc                                           Windows Update Medic Service
Stopped VSS                                                    Volume Shadow Copy
Stopped vmicshutdown                                           Hyper-V Guest Shutdown Service
Stopped vmicrdv                                                Hyper-V Remote Desktop Virtualization Service
Stopped vmickvpexchange                                        Hyper-V Data Exchange Service
Stopped vmicvss                                                Hyper-V Volume Shadow Copy Requestor
Stopped vmicvmsession                                          Hyper-V PowerShell Direct Service
Stopped vmictimesync                                           Hyper-V Time Synchronization Service
Stopped Intel(R) Capability Licensing Service TCP IP Interface Intel(R) Capability Licensing Service TCP IP Interface
Stopped CredentialEnrollmentManagerUserSvc_19108e9             CredentialEnrollmentManagerUserSvc_19108e9
Stopped BluetoothUserService_19108e9                           Ondersteuningsservice voor Bluetooth-gebruikers_19108e9
Stopped diagsvc                                                Diagnostic Execution Service
Stopped fhsvc                                                  File History Service
Stopped Fax                                                    Fax
Stopped dmwappushservice                                       Routingservice voor WAP-pushberichten (Wireless Application Protocol) van Apparaatbeheer
Stopped DmEnrollmentSvc                                        Registratieservice voor Apparaatbeheer
Stopped diagnosticshub.standardcollector.service               Microsoft(R) Diagnostics Hub Standard Collector-service
Stopped AxInstSV                                               ActiveX Installer (AxInstSV)
Stopped gpsvc                                                  Group Policy Client
Stopped autotimesvc                                            Mobiele tijd
Stopped BcastDVRUserService_19108e9                            Gebruikersservice GameDVR en uitzending_19108e9
Stopped BEService                                              BattlEye Service
Stopped BDESVC                                                 BitLocker Drive Encryption Service
Stopped GoogleChromeElevationService                           Google Chrome Elevation Service
Stopped CaptureService_19108e9                                 CaptureService_19108e9
Stopped edgeupdate                                              Update voor Microsoft Edge-service (edgeupdate)
Stopped ClipSVC                                                Client License Service (ClipSVC)
Stopped COMSysApp                                              COM+ System Application
Stopped EasyAntiCheat                                          EasyAntiCheat
Stopped cmdvirth                                               COMODO Virtual Service Manager
Stopped DsSvc                                                  Data Sharing Service
Stopped Eaphost                                                Extensible Authentication Protocol
Stopped ConsentUxUserSvc_19108e9                               ConsentUX_19108e9
Stopped EntAppSvc                                              Enterprise App Management Service
Stopped dot3svc                                                Wired AutoConfig
Stopped DoSvc                                                  Delivery Optimization
Stopped embeddedmode                                           Ingesloten modus
Stopped edgeupdatem                                             Update voor Microsoft Edge-service (edgeupdatem)
Stopped DsmSvc                                                 Device Setup Manager
Stopped EFS                                                    Encrypting File System (EFS)
Stopped AppIDSvc                                               Application Identity
Stopped DevicesFlowUserSvc_19108e9                             DevicesFlow_19108e9
Stopped ALG                                                    Application Layer Gateway Service
Stopped AppXSvc                                                AppX Deployment Service (AppXSVC)
Stopped AppReadiness                                           App Readiness
Stopped AppMgmt                                                Application Management
Stopped AJRouter                                               AllJoyn Router Service
Stopped DeviceAssociationBrokerSvc_19108e9                     DeviceAssociationBroker_19108e9
Stopped AarSvc_19108e9                                         Agent Activation Runtime_19108e9
Stopped DeviceInstall                                          Device Install Service
Stopped icssvc                                                 Windows Mobile Hotspot Service
Stopped defragsvc                                              Optimize drives
Stopped GraphicsPerfSvc                                        GraphicsPerfSvc
Stopped hpqcaslwmiex                                           HP CASL Framework Service
Stopped aspnet_state                                           ASP.NET State Service
Stopped DevicePickerUserSvc_19108e9                            DevicePicker_19108e9
Stopped gupdate                                                Google Update-service (gupdate)
Stopped dbupdatem                                              Dropbox-update-service (dbupdatem)
Stopped dbupdate                                               Dropbox-update-service (dbupdate)
Stopped gupdatem                                               Google Update-service (gupdatem)
Running Themes                                                 Themes
Running vmcompute                                              Hyper-V-Host Compute-Service
Running VaultSvc                                               Credential Manager
Running TermService                                            Remote Desktop Services
Running com.docker.service                                     Docker Desktop Service
Running SystemEventsBroker                                     System Events Broker
Running TabletInputService                                     Touch Keyboard and Handwriting Panel Service
Running TDDService                                             GameSessions Hub Service
Running TapiSrv                                                Telephony
Running TimeBrokerSvc                                          Time Broker
Running CryptSvc                                               Cryptographic Services
Running UsoSvc                                                 Update Orchestrator-service
Running TrkWks                                                 Distributed Link Tracking Client
Running UnistoreSvc_19108e9                                    User Data Storage_19108e9
Running UserDataSvc_19108e9                                    User Data Access_19108e9
Running UserManager                                            User Manager
Running cplspcon                                               Intel(R) Content Protection HDCP Service
Running DcomLaunch                                             DCOM Server Process Launcher
Running DbxSvc                                                 DbxSvc
Running VMAuthdService                                         VMware Authorization Service
Running TokenBroker                                            Webaccountbeheer
Running cphs                                                   Intel(R) Content Protection HECI Service
Running CoreMessagingRegistrar                                 CoreMessaging
Running AudioEndpointBuilder                                   Windows Audio Endpoint Builder
Running Audiosrv                                               Windows Audio
Running WlanSvc                                                WLAN AutoConfig
Running AppHostSvc                                             Hulpservice voor toepassingshost
Running Appinfo                                                Application Information
Running BITS                                                   Background Intelligent Transfer Service
Running Bonjour Service                                        Bonjour-service
Running BFE                                                    Base Filtering Engine
Running Winmgmt                                                Windows Management Instrumentation
Running WinHttpAutoProxySvc                                    WinHTTP Web Proxy Auto-Discovery Service
Running AGSService                                             Adobe Genuine Software Integrity Service
Running WwanSvc                                                WWAN AutoConfig
Running AGMService                                             Adobe Genuine Monitor Service
Running ZeroConfigService                                      Intel(R) PROSet/Wireless Zero Configuration Service
Running AdobeARMservice                                        Adobe Acrobat Update Service
Running WpnUserService_19108e9                                 Windows Push Notifications User Service_19108e9
Running WpnService                                             Systeemservice voor Windows Push Notifications
Running wscsvc                                                 Security Center
Running wuauserv                                               Windows Update
Running WSearch                                                Windows Search
Running chromoting                                             Chrome Remote Desktop-service
Running VMware NAT Service                                     VMware NAT Service
Running CertPropSvc                                            Certificate Propagation
Running CDPSvc                                                 Service Platform voor verbonden apparaten
Running CDPUserSvc_19108e9                                     Gebruikerservice voor Connected Devices Platform_19108e9
Running CmdAgent                                               COMODO Internet Security Helper Service
Running CmdAgentProt                                           COMODO Internet Security Protected Helper Service
Running ClickToRunSvc                                          Microsoft Office Click-to-Run Service
Running VMUSBArbService                                        VMware USB Arbitration Service
Running VMnetDHCP                                              VMware DHCP Service
Running Wcmsvc                                                 Windows Connection Manager
Running BTAGService                                            Bluetooth Audio Gateway-service
Running BrokerInfrastructure                                   Background Tasks Infrastructure Service
Running WdiSystemHost                                          Diagnostic System Host
Running WdiServiceHost                                         Diagnostic Service Host
Running Wallpaper Engine Service                               Wallpaper Engine Service
Running cbdhsvc_19108e9                                        Gebruikersservice voor klembord_19108e9
Running camsvc                                                 Capability Access Manager Service
Running BthAvctpSvc                                            AVCTP-service
Running bthserv                                                Bluetooth Support Service
Running FrameServer                                            Windows Camera Frame Server
Running netprofm                                               Network List Service
Running NgcCtnrSvc                                             Microsoft Passport Container
Running NlaSvc                                                 Network Location Awareness
Running NgcSvc                                                 Microsoft Passport
Running hidserv                                                Human Interface Device Service
Running hns                                                    Host Network Service
Running NcbService                                             Network Connection Broker
Running Netman                                                 Network Connections
Running NcdAutoSetup                                           Network Connected Devices Auto-Setup
Running nsi                                                    Network Store Interface Service
Running PcaSvc                                                 Program Compatibility Assistant Service
Running FDResPub                                               Function Discovery Resource Publication
Running fdPHost                                                Function Discovery Provider Host
Running PimIndexMaintenanceSvc_19108e9                         Contact Data_19108e9
Running EvtEng                                                 Intel(R) PROSet/Wireless Event Log
Running OneSyncSvc_19108e9                                     Host synchroniseren_19108e9
Running nvagent                                                Netwerkvirtualisatieservice
Running FontCache3.0.0.0                                       Windows Presentation Foundation Font Cache 3.0.0.0
Running FontCache                                              Windows Font Cache Service
Running Origin Web Helper Service                              Origin Web Helper Service
Running HP Comm Recover                                        HP Comm Recovery
Running igfxCUIService2.0.0.0                                  Intel(R) HD Graphics Control Panel Service
Running KeyIso                                                 CNG Key Isolation
Running LanmanServer                                           Server
Running lfsvc                                                  Geolocation Service
Running LanmanWorkstation                                      Workstation
Running IpOverUsbSvc                                           Windows Phone IP over USB Transport (IpOverUsbSvc)
Running iphlpsvc                                               IP Helper
Running IKEEXT                                                 IKE and AuthIP IPsec Keying Modules
Running JTAGServer                                             Altera JTAG Server
Running jhi_service                                            Intel(R) Dynamic Application Loader Host Interface Service
Running LicenseManager                                         Service voor Windows-licentiebeheer
Running HPWMISVC                                               HPWMISVC
Running HvHost                                                 HV-hostservice
Running HPSupportSolutionsFrameworkService                     HP Support Solutions Framework Service
Running mpssvc                                                 Windows Defender Firewall
Running HPJumpStartBridge                                      HP JumpStart Bridge
Running LMS                                                    Intel(R) Management and Security Application Local Management Service
Running lmhosts                                                TCP/IP NetBIOS Helper
Running LSM                                                    Local Session Manager
Running LxssManager                                            LxssManager
Running ibtsiva                                                Intel Bluetooth Service
Running ShellHWDetection                                       Shell Hardware Detection
Running DiagTrack                                              Connected User Experiences and Telemetry
Running Dhcp                                                   DHCP Client
Running InstallService                                         Microsoft Store-installatieservice
Running DevQueryBroker                                         DevQuery Background Discovery Broker
Running DisplayEnhancementService                              Service voor beeldschermverbetering
Running SENS                                                   System Event Notification Service
Running DispBrokerDesktopSvc                                   Beeldschermbeleidsservice
Running SharedAccess                                           Internet Connection Sharing (ICS)
Running Disc Soft Lite Bus Service                             Disc Soft Lite Bus Service
Running Spooler                                                Print Spooler
Running StorSvc                                                Storage Service
Running stisvc                                                 Windows Image Acquisition (WIA)
Running DeviceAssociationService                               Device Association Service
Running SysMain                                                SysMain
Running SynTPEnhService                                        SynTPEnhService
Running SSDPSRV                                                SSDP Discovery
Running SQLWriter                                              SQL Server VSS Writer
Running SstpSvc                                                Secure Socket Tunneling Protocol Service
Running Steam Client Service                                   Steam Client Service
Running StateRepository                                        State Repository Service
Running SEMgrSvc                                               Betalingen en NFC/SE Manager
Running ProfSvc                                                User Profile Service
Running Power                                                  Power
Running QWAVE                                                  Quality Windows Audio Video Experience
Running RegSrvc                                                Intel(R) PROSet/Wireless Registry Service
Running RasMan                                                 Remote Access Connection Manager
Running PlugPlay                                               Plug and Play
Running EventSystem                                            COM+ Event System
Running EventLog                                               Windows Event Log
Running PolicyAgent                                            IPsec Policy Agent
Running esifsvc                                                Intel(R) Dynamic Platform and Thermal Framework service
Running Remote Assistant Service                               Remote Assistant Service
Running DPS                                                    Diagnostic Policy Service
Running SamSs                                                  Security Accounts Manager
Running Schedule                                               Task Scheduler
Running SecurityHealthService                                  Windows-beveiligingsservice
Running Dnscache                                               DNS Client
Running DusmSvc                                                Dataverbruik
Running RmSvc                                                  Radiobeheerservice
Running RpcEptMapper                                           RPC Endpoint Mapper
Running RtkAudioService                                        Realtek Audio Service
Running RpcSs                                                  Remote Procedure Call (RPC)


woensdag 11/18/2020 17:04 +01:00

Number of Running Services:  149
Number of Stopped Services:  163


Files are different
Stopped  PrintWorkflowUs... PrintWorkflow_d23742c
Stopped  MessagingServic... MessagingService_d23742c
Stopped  LxssManagerUser... LxssManagerUser_d23742c
Stopped  gpsvc              Group Policy Client
Stopped  CaptureService_... CaptureService_d23742c
Stopped  ConsentUxUserSv... ConsentUX_d23742c
Stopped  DeviceAssociati... DeviceAssociationBroker_d23742c
Stopped  AarSvc_d23742c     Agent Activation Runtime_d23742c
Stopped  DevicePickerUse... DevicePicker_d23742c
Stopped  DevicesFlowUser... DevicesFlow_d23742c
Running  UnistoreSvc_d23... User Data Storage_d23742c
Running  UserDataSvc_d23... User Data Access_d23742c
Running  AppXSvc            AppX Deployment Service (AppXSVC)
Running  BcastDVRUserSer... Gebruikersservice GameDVR en uitzen...
Running  XblAuthManager     Xbox Live-verificatiebeheer
Running  CDPUserSvc_d23742c Gebruikerservice voor Connected Dev...
Running  cbdhsvc_d23742c    Gebruikersservice voor klembord_d23...
Running  W32Time            Windows Time
Running  OneSyncSvc_d23742c Host synchroniseren_d23742c
Running  hpqcaslwmiex       HP CASL Framework Service
Running  PimIndexMainten... Contact Data_d23742c
Running  DsSvc              Data Sharing Service
```

## Elevated permissions

Allows user to run powershell with elevated permissions. This is necessary for the script show-event-logs.ps1.

## Compare

A script that compares two txt files and outputs the difference.
