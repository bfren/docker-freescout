use bf

# User / group for permissions
const user = "www:www"

# Set permissions on data files and directories
export def set [] {
    # set permissions for data directory
    let fs_data = bf env FS_DATA
    bf write $"Setting permissions for ($fs_data)." perms/set
    [$fs_data $user 0664 0775] | bf ch apply
}
