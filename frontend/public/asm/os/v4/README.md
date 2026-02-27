# os v4 (stage1)

## Goal

Initialize a minimal VFS foundation in RAM and prepare virtual trees for `/dev` and `/proc`.

## Implemented in stage1

- VFS core init (`vfs_ready`, table counters)
- mount table init
- mount: `os_disk` -> `/usr`
- symlink table init
- symlink: `/bin` -> `/usr/bin`
- virtual metadata seeding for `/dev` and `/proc`

## Notes

This stage focuses on structure and initialization. Data persistence, inode allocator, path resolver, and full syscall integration are planned next.
