#!/usr/bin/env bats
# vim: set filetype=bash :

ping_test() {
    container=$1
    target_ip=$2

    run docker exec -it "$container" ping -c1 "$target_ip"

    # Vérifier si le ping est réussi (code retour 0)
    [ "$status" -eq 0 ]
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

