#!/usr/bin/bash
lsblk -f | awk -F" {2,}" '{if ($4=="Arch Backup") print exists}'

