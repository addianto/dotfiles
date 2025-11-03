---
name: Command Substitutes
description: Rules for substituting specific commands with their alternatives.
---

1. Unless specified otherwise, replace the following commands with their substitutes:
   - Terraform (`tf` or `terraform`) with OpenTofu (`tf`)
   - Docker (`docker`) with Podman (`podman`)
   - `docker-compose` with `podman-compose`
2. When working on Flutter project, prefix any `dart` and `flutter` commands with `fvm`.
   For example, `flutter analyze` become `fvm flutter analyze`.
   The reason is I use `fvm` (Flutter Version Manager) to manage multiple Flutter installation in my development machine.
