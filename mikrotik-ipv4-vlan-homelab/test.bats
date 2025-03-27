#!/usr/bin/env bats
# vim: set filetype=bash :

ping_test() {
    container=$1
    target_ip=$2

    run docker exec -it "$container" ping -c1 "$target_ip"

    # Vérifier si le ping est réussi (code retour 0)
    [ "$status" -eq 0 ]
}

mtr_ssh() {
    target_ip=$1

    run ssh-keygen -R "172.100.100.${target_ip}" || true

    run sshpass -p "admin" ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null "admin@172.100.100.${target_ip}" "/ping 8.8.8.8 count=1"
    # sshpass -p "admin" ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null "admin@172.100.100.${target_ip}" "/ping 8.8.8.8 count=1" | grep -v timeout
}

@test "DMZ - ping pc252 => pc254" {
    ping_test "clab-mikrotik-homelab-pc252-dmz" "172.100.32.4"
}

@test "DMZ - ping pc253 => pc254" {
    ping_test "clab-mikrotik-homelab-pc253-dmz" "172.100.32.4"
}

@test "ADM - ping pc252 => pc254" {
    ping_test "clab-mikrotik-homelab-pc252-adm" "172.100.240.4"
}

@test "ADM - ping pc253 => pc254" {
    ping_test "clab-mikrotik-homelab-pc253-adm" "172.100.240.4"
}

@test "LAN - ping pc252 => pc254" {
    ping_test "clab-mikrotik-homelab-pc252-lan" "172.100.254.4"
}

@test "LAN - ping pc253 => pc254" {
    ping_test "clab-mikrotik-homelab-pc253-lan" "172.100.254.4"
}

@test "mtr254 => internet" {
    mtr_ssh 254
}

@test "mtr253 => internet" {
    mtr_ssh 253
}

@test "mtr252 => internet" {
    mtr_ssh 252
}
