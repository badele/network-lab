
# Show help
help: 
  just --list --unsorted

# Deploy containerlab lab
[no-cd]
deploy options="":
  @test -f lab.clab.yml || (echo "lab.clab.yml not found" ; exit 1)
  sudo containerlab deploy {{options}}

# destroy containerlab lab
[no-cd]
destroy:
  @test -f lab.clab.yml || (echo "lab.clab.yml not found" ; exit 1)
  sudo containerlab destroy || true

# Generate d2 diagram
[no-cd]
diagram:
  @test -f diagram.d2 || (echo "diagram.d2 not found" ; exit 1)
  @d2 diagram.d2

# Start edgeshark
edgeshark-start:
  DOCKER_DEFAULT_PLATFORM= docker compose -f tools/edgeshark.yaml up -d

# Stop edgeshark
edgeshark-stop:
  docker compose -f tools/edgeshark.yaml down

# open edgeshark web interface
edgeshark-open:
  xdg-open localhost:5001
