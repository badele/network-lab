# mikrotik-ipv4-vlan-homelab

## Introduction

This lab consists of three MikroTik routers and three VLANs, allowing machines
to be isolated across three different networks.

This configuration is used in my
[NixOS homelab](https://github.com/badele/nix-homelab).

- **DMZ (32)**
- **ADM (240)**
- **LAN (254)**

| Name   | Address         | Description            |
| ------ | --------------- | ---------------------- |
| mtr254 | 172.100.100.254 | Main router            |
|        | 172.100.32.254  | Main router DMZ VLAN   |
|        | 172.100.240.254 | Main router ADM VLAN   |
|        | 172.100.254.254 | Main router LAN VLAN   |
| mtr253 | 172.100.100.253 | Second router          |
|        | 172.100.32.253  | Second router DMZ VLAN |
|        | 172.100.240.253 | Second router ADM VLAN |
|        | 172.100.254.253 | Second router LAN VLAN |
| mtr252 | 172.100.100.252 | Third router           |
|        | 172.100.32.252  | Third router DMZ VLAN  |
|        | 172.100.240.252 | Third router ADM VLAN  |
|        | 172.100.254.252 | Third router LAN VLAN  |
| pc254  | 172.100.32.4    | PC 254 on DMZ          |
|        | 172.100.240.4   | PC 254 on ADM          |
|        | 172.100.254.4   | PC 254 on LAN          |
| pc252  | 172.100.32.2    | PC 252 on DMZ          |
|        | 172.100.240.2   | PC 252 on ADM          |
|        | 172.100.254.2   | PC 252 on LAN          |

---

### **Diagram**

![diagram](diagram.svg)

---

### **Tests**

```bash
cd mikrotik-ipv4-vlan-homelab
just deploy

# Test LAN between two PCs
docker exec -it clab-mikrotik-homelab-pc252-lan ping -c3 172.100.254.4
docker exec -it clab-mikrotik-homelab-pc254-lan ping -c3 172.100.254.2

# Test ADM between two PCs
docker exec -it clab-mikrotik-homelab-pc252-adm ping -c3 172.100.240.4
docker exec -it clab-mikrotik-homelab-pc254-adm ping -c3 172.100.240.2

# Test DMZ between two PCs
docker exec -it clab-mikrotik-homelab-pc252-dmz ping -c3 172.100.32.4
docker exec -it clab-mikrotik-homelab-pc254-dmz ping -c3 172.100.32.2

# Connect to router
ssh admin@172.100.100.254 # .253 or .252 (pass admin/admin)
```
