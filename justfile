# vim: set filetype=just :

# show help
help: 
  just --list --unsorted

[ no-cd ]
[ private]
check-config:
  @test -f lab.clab.yml || (echo "lab.clab.yml not found" ; exit 1)

# deploy containerlab lab
[no-cd]
deploy options="": check-config
  sudo containerlab deploy {{options}}

# info containerlab lab
[no-cd]
info: check-config
  @test -f lab.clab.yml || (echo "lab.clab.yml not found" ; exit 1)
  sudo containerlab inspect

# destroy containerlab lab
[no-cd]
destroy: check-config
  @test -f lab.clab.yml || (echo "lab.clab.yml not found" ; exit 1)
  sudo containerlab destroy || true

# launch unit test lab
[no-cd]
test:
  @bats test.bats

# generate d2 diagram
[no-cd]
diagram:
  @test -f diagram.d2 || (echo "diagram.d2 not found" ; exit 1)
  @d2 diagram.d2

# start edgeshark
edgeshark-start:
  DOCKER_DEFAULT_PLATFORM= docker compose -f tools/edgeshark.yaml up -d

# stop edgeshark
edgeshark-stop:
  docker compose -f tools/edgeshark.yaml down

# open edgeshark web interface
edgeshark-open:
  xdg-open localhost:5001
