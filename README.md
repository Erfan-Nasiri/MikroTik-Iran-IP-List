# MikroTik-Iran-IP-List
This script provides an updated list of Iranian IP addresses for MikroTik RouterOS. It helps with traffic management, routing, and firewall configurations.
# MikroTik Address List for Iranian IP Addresses

This repository provides a list of Iranian IP addresses and a script to import them into a MikroTik router's address list. The address list can be used in various firewall configurations, such as mangle rules for marking packets, routing decisions, or filtering traffic based on Iranian IP addresses.

## Contents
- **`iran_ip_list.txt`**: A text file containing Iranian IP ranges in CIDR notation.
- **`import_iran_ips.rsc`**: A script to import the IP list into a MikroTik address list named `iran_ips`.

## Source of IP Address List
The IP address list for Iran was sourced from [ipdeny.com](http://www.ipdeny.com/ipblocks/data/countries/ir.zone) on [insert date]. IP ranges may change over time, so it’s recommended to update the list periodically.

## How to Use
### Prerequisites
- A MikroTik router running RouterOS.
- Access to the router via Winbox, SSH, or the web interface.
- The files from this repository downloaded to your computer.

### Step 1: Upload Files to Your MikroTik Router
1. Log in to your MikroTik router using Winbox or the web interface.
2. Navigate to the `Files` menu.
3. Upload `iran_ip_list.txt` and `import_iran_ips.rsc` by dragging and dropping or using the upload button.

### Step 2: Import the Address List
1. Open the terminal in your MikroTik router (via Winbox, SSH, or the web interface).
2. Run the following command to execute the script:
3. /import file-name=import_iran_ips.rsc
4. 3. The script will create an address list named `iran_ips` populated with the IP ranges from `iran_ip_list.txt`.

### Step 3: Use the Address List in Firewall Rules
Once imported, the `iran_ips` address list can be referenced in firewall rules. Below are practical examples:

#### Example 1: Mangle Rule to Mark Packets
Mark packets from Iranian IPs for QoS or monitoring:
```routeros 
/ip firewall mangle add chain=prerouting src-address-list=iran_ips action=mark-packet new-packet-mark=iran_traffic passthrough=no comment="Mark packets from Iran"
```
#### Example 2: Mangle Rule for Routing 
Mark traffic to Iranian IPs for specific routing:
 ``` /ip firewall mangle add chain=prerouting dst-address-list=iran_ips action=mark-routing new-routing-mark=to_iran passthrough=no comment="Mark routing for traffic to Iran" ```
Example 3: Filter Rule to Allow Traffic
```Allow traffic from Iranian IPs while dropping others:
/ip firewall filter add chain=forward src-address-list=iran_ips action=accept comment="Allow traffic from Iran" 
/ip firewall filter add chain=forward action=drop comment="Drop all other traffic"
```
Updating the IP Address List 
IP ranges can change due to reallocation. To update the list:

Visit ipdeny.com and download the latest ir.zone file.
Rename it to iran_ip_list.txt and replace the existing file on your router or in the repository.
Upload the updated iran_ip_list.txt to your router’s Files menu.
```Re-run the import command: 
/import file-name=import_iran_ips.rsc
```
