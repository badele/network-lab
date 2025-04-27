# mikrotik-dns-failover-homelab

## Introduction

This lab consists of creating a pseudo-failover on a MikroTik router.

The lab is made up of three DNS servers based on CoreDNS. A MikroTik router acts
as the primary DNS server, forwarding DNS queries to one of the three DNS
servers.

To achieve this, we use the `netwatch` and `scripts` features of
[MikroTik](https://mikrotik.com/) so that the MikroTik router updates the
available DNS servers based on the hosts' availability (a kind of
pseudo-failover).

**Note:** Contrary to what one might think, adding multiple nameservers in the
`/etc/resolv.conf` file does not create a failover. During DNS resolution, the
system queries the first entry in `/etc/resolv.conf`. If there is a timeout, it
then tries the second one, and so on.

This configuration is used in my
[NixOS homelab](https://github.com/badele/nix-homelab).

## Inventory

| Number | Description     |
| ------ | --------------- |
| 1      | MikroTik router |
| 3      | DNS servers     |
| 1      | client          |

**Details**

|   Type   |  Name  | Description        | Identifier | Acess                                          |
| :------: | :----: | ------------------ | ---------- | ---------------------------------------------- |
|  server  |  dns2  | DNS server 1       |            |                                                |
|  server  |  dns3  | DNS server 2       |            |                                                |
|  server  |  dns4  | DNS server 3       |            |                                                |
|  router  | mtr254 | MikroTik router    |            | `ssh admin@172.100.100.254`                    |
| computer | client | Ubuntu test client |            | `docker exec -it clab-mikrotik-homelab-client` |

---

### **Diagram**

![diagram](diagram.svg)

---

### **Tests**

```bash
cd mikrotik-dns-failover

just build coredns

just deploy

# wait 1 minute
just test
just diagram

# Connect to router SSH
ssh admin@172.100.100.254

# Connect to router WWW
xdg-open 172.100.100.254
```
