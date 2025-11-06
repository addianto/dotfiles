---
name: Command Substitutes
description: Rules for substituting specific commands with their alternatives.
---

1. Unless the user explicitly requests otherwise, always replace:
   - Terraform (`tf` or `terraform`) with OpenTofu (`tf`)
   - Docker (`docker`) with Podman (`podman`)
   - Docker Compose (`docker-compose`) with Podman Compose (`podman-compose`)
2. For commands likely to be run within a Flutter project (identified by presence of a `pubspec.yaml` containing "flutter" as a dependency):
   - Prefix all `dart` and `flutter` commands with `fvm` (e.g., `flutter analyze` to `fvm flutter analyze`)
   - This ensures the use of Flutter Version Manager for managing multiple Flutter installations
