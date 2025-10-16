# Power Saving Guide

This document outlines a minimal, efficient power saving setup for DE-independent standalone arch linux evironments.

Components:

- **thermald** manages fans to keep the CPU within safe temp limits
- **auto-cpufreq** reduces battery drain through dynamic CPU scaling
- **tlp** manages system-level power configurations to optimize battery life
- **zram-generator** provides a user-friendly setup for managing zram devices
- **brightnessctl** manages display brightness on newer-generation laptops

## Installation

```sh
pacman -S tlp thermald brightnessctl zram-generator
yay -S auto-cpufreq
```

## Configuration

### thermald

```sh
systemctl enable --now thermald
```

### auto-cpufreq

```sh
auto-cpufreq --install
```

### tlp

`tlp` conflicts with `auto-cpufreq` if both are set to manage CPU scaling. It's recommended to use the latter as it can dynamically adjust frequences and governors in real time compared `tlp`'s static configuration.

Disable `tlp` CPU scaling by adding these parameters to `/etc/tlp.conf`:

```sh
CPU_SCALING_GOVERNOR_ON_AC=none
CPU_SCALING_GOVERNOR_ON_BAT=none
```

```sh
systemctl enable --now tlp
```

**Optional:** `tlp` provides a high degree of power saving customizability for various system components. They can be configured via `/etc/tlp.conf` or the external `tlpui` GUI frontend.

```sh
yay -S tlpui
```

### zram-generator

A zram device represents a compressed block device in RAM that can be used as swap. By compressing memory pages, it increases effective RAM capacity and reduces disk I/O under heavy load. This helps improve system responsiveness and power efficiency, especially on laptops or memory-constrained systems.

To configure zram, create the `/etc/systemd/zram-generator.conf` file to customize device parameters:

```sh
[zram0]
zram-size = ram / 2
compression-algorithm = zstd
priority = 100
```

```sh
sudo systemctl start systemd-zram-setup@zram0.service
sudo systemctl daemon-reload
```

## Ending Remarks

At last, restart the device to ensure services are properly loaded:

```sh
reboot
```

Use `systemctl` to verify service status:

```sh
systemctl is-active thermald auto-cpufreq tlp
```

Use `swapon` to verify zram status:

```sh
swapon --show
```

This setup can reduce overall energy consumption to roughly 4-6 W at idle and around 7-9 W under typical workloads, improving battery life and lowering heat output.
