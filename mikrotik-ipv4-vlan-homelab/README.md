# mikrotik-ipv4-vlan-homelab

## Introduction

This lab consists of three MikroTik routers and three VLANs, allowing machines
to be isolated across three different networks.

This configuration is used in my
[NixOS homelab](https://github.com/badele/nix-homelab).

## Inventory

| Number | Description      |
| ------ | ---------------- |
| 3      | MikroTik routers |
| 3      | VLANs            |
| 9      | PCs              |

**Details**

- **DMZ (32)**
- **ADM (240)**
- **LAN (254)**

|   Type   |  Name  | Description         | Identifier                                                                                              | Acess                                                                                                                                                              |
| :------: | :----: | ------------------- | ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
|   vlan   |  DMZ   | Demilitarized zone  | `32`                                                                                                    |                                                                                                                                                                    |
|   vlan   |  ADM   | Administrative zone | `240`                                                                                                   |                                                                                                                                                                    |
|   vlan   |  LAN   | Local network zone  | `254`                                                                                                   |                                                                                                                                                                    |
|  router  | mtr254 | Main router         | `172.100.100.254`(MGMT)</br>`172.100.32.254`(DMZ)</br>`172.100.240.254`(ADM)</br>`172.100.254.254`(LAN) | `ssh admin@172.100.100.254`                                                                                                                                        |
|  router  | mtr253 | Second router       | `172.100.100.253`(MGMT)</br>`172.100.32.253`(DMZ)</br>`172.100.240.253`(ADM)</br>`172.100.254.253`(LAN) | `ssh admin@172.100.100.253`                                                                                                                                        |
|  router  | mtr252 | Third router        | `172.100.100.252`(MGMT)</br>`172.100.32.252`(DMZ)</br>`172.100.240.252`(ADM)</br>`172.100.254.252`(LAN) | `ssh admin@172.100.100.252`                                                                                                                                        |
| computer | pc254  | Test computer       | `172.100.32.4`(DMZ)</br>`172.100.240.4`(ADM)</br>`172.100.254.4`(LAN)                                   | `docker exec -it clab-mikrotik-homelab-pc254-dmz`</br>`docker exec -it clab-mikrotik-homelab-pc254-adm`</br>`docker exec -it clab-mikrotik-homelab-pc254-lan`</br> |
| computer | pc253  | Test computer       | `172.100.32.3`(DMZ)</br>`172.100.240.3`(ADM)</br>`172.100.254.3`(LAN)                                   | `docker exec -it clab-mikrotik-homelab-pc253-dmz`</br>`docker exec -it clab-mikrotik-homelab-pc253-adm`</br>`docker exec -it clab-mikrotik-homelab-pc253-lan`</br> |
| computer | pc252  | Test computer       | `172.100.32.2`(DMZ)</br>`172.100.240.2`(ADM)</br>`172.100.254.2`(LAN)                                   | `docker exec -it clab-mikrotik-homelab-pc252-dmz`</br>`docker exec -it clab-mikrotik-homelab-pc252-adm`</br>`docker exec -it clab-mikrotik-homelab-pc252-lan`</br> |

---

### **Diagram**

![diagram](diagram.svg)

---

### **Tests**

```bash
cd mikrotik-ipv4-vlan-homelab
just deploy

# wait 1 minute
just test
just diagram

# Connect to router SSH
ssh admin@172.100.100.254 # .253 or .252 (pass admin/admin)

# Connect to router WWW
xdg-open 172.100.100.254 # .253 or .252 (pass admin/admin)
```
