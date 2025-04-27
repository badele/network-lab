#!/usr/bin/env bats
# vim: set filetype=bash :

setup() {
    docker start clab-mikrotik-homelab-dns2
    docker start clab-mikrotik-homelab-dns3
    docker start clab-mikrotik-homelab-dns4
}

ping_test() {
    container=$1
    target_ip=$2

    run docker exec -it "$container" ping -4 -c1 "$target_ip"
}

dig_test() {
    container=$1
    query=$2

    run docker exec -it "$container" dig +time=2 -4 "$query"
}

@test "ping dns2 => mtr254" {
    ping_test "clab-mikrotik-homelab-dns2" "172.100.100.254"
}

@test "ping dns3 => mtr254" {
    ping_test "clab-mikrotik-homelab-dns3" "172.100.100.254"
}

@test "ping dns4 => mtr254" {
    ping_test "clab-mikrotik-homelab-dns4" "172.100.100.254"
}

@test "dns2 query forwarding to 172.100.100.254" {
    dig_test "clab-mikrotik-homelab-dns2" dns1.lab.local
}

@test "dns3 query forwarding to 172.100.100.254" {
    dig_test "clab-mikrotik-homelab-dns3" dns1.lab.local
}

@test "dns4 query forwarding to 172.100.100.254" {
    dig_test "clab-mikrotik-homelab-dns4" dns1.lab.local
}

@test "client => no DNS available" {
    docker stop clab-mikrotik-homelab-dns2
    docker stop clab-mikrotik-homelab-dns3
    docker stop clab-mikrotik-homelab-dns4

    sleep 20

    dig_test "clab-mikrotik-homelab-client" dns2.lab.local

    [[ "$output" == *"status: SERVFAIL"* ]]
}

@test "client => failover available" {
    docker stop clab-mikrotik-homelab-dns2
    docker stop clab-mikrotik-homelab-dns3

    sleep 20
    dig_test "clab-mikrotik-homelab-client" dns1.lab.local
}
