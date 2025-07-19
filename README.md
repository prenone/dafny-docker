[![Docker Pulls](https://img.shields.io/docker/pulls/prenone/dafny.svg)](https://hub.docker.com/r/prenone/dafny)
[![CI](https://github.com/prenone/dafny-docker/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/prenone/dafny-docker/actions/workflows/docker-publish.yml)

# prenone/dafny

A Docker image bundling the [Dafny](https://github.com/dafny-lang/dafny) Programming and Verification Language on top of the official Microsoft .NET SDK image.

---

## Installation

Pull the latest image from Docker Hub:

```bash
docker pull prenone/dafny:latest
```

---

## Usage

### Run an interactive shell

Start a container and enter bash:

```bash
docker run --rm -it prenone/dafny bash
```

Where you can then use the Dafny CLI:

```bash
dafny /version
```

---

### Verify a Dafny file

Suppose you have `Test.dfy` locally:

```dafny
method Test() {
    assert(2 > 1);
}
```

Run verification:

```bash
docker run --rm \
  -v "$(pwd)":/workspace \
  prenone/dafny \
  dafny verify Test.dfy
```

---

## Contributing

This is my first Docker image repo, please excuse any atrocious mistakes. Any contributions or suggestions are more than welcome.

