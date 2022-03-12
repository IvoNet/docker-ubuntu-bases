# Docker Ubuntu GUI base

This image aims to provide a web interface for all gui applications


# How it works

With difficulty :-)


# Example

```bash
docker run -it --rm -p 8080:8080 --cap-add=SYS_ADMIN -e PULSE_SERVER=docker.for.mac.localhost  -v ~/.config/pulse:/nobody/.config/pulse  ivonet/gui /bin/bash
```
