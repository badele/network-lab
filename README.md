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
2. Deploy the lab with the following command:
   ```bash
   just deploy
   ```
3. Document your lab in a D2 file:
   ```bash
   just diagram
   ```

## Labs

| Name                                                        | Description                 | Tags                 |
| ----------------------------------------------------------- | --------------------------- | -------------------- |
| [mikrotik-ipv4-vlan-homelab](./mikrotik-ipv4-vlan-homelab/) | 3 VLANs on Mikrotik routers | ipv4, vlan, mikrotik |
