# network-lab

This repository contains my experiments and network lab configurations built
with the excellent tool [Containerlab](https://containerlab.dev).

## About Containerlab

Containerlab allows for the quick deployment of network topologies using
**Docker images**. However, it can also leverage **QEMU images** to support
certain network devices, such as MikroTik routers.

All these labs are designed following the **Infrastructure as Code** approach:

- **YAML** is used for defining the lab with Containerlab.
- **D2** is used for creating network diagrams with [d2](https://d2lang.com/).

## Creating a Lab

Creating a lab is simple:

1. Define the topology in a **YAML** file in `<LABNAME>` folder
2. **[optional]** Build docker images²
   ```bash
   just build imgnameX build imgnameY
   ```
3. Deploy the lab with the following command:
   ```bash
   just deploy
   just info
   # Wait 1 minute before going to next step
   ```
4. Test your lab if it run correctely:
   ```bash
   just test
   ```
5. **[optional]** Show the network wires with
   [edgeshark](https://github.com/siemens/edgeshark)
   ```bash
   just edgeshark-start
   just edgeshark-open
   just edgeshark-stop
   ```
6. Document your lab in a D2 file:
   ```bash
   just diagram
   ```

## Labs

| Name                                                                     | Description                      | Tags                    |
| ------------------------------------------------------------------------ | -------------------------------- | ----------------------- |
| [2024-11-18 - mikrotik-ipv4-vlan-homelab](./mikrotik-ipv4-vlan-homelab/) | 3 VLANs on Mikrotik routers      | ipv4, vlan, mikrotik    |
| [2025-04-26 - mikrotik-dns-failover](./mikrotik-dns-failover/)           | DNS failover on Mikrotik routers | dns, failover, mikrotik |
