use bf

# User / group for permissions
const user = "www:www"

# Set permissions on data files and directories
export def set [] {
    # set permissions for data directory
    let fs_data = bf env FS_DATA
    bf write $"Setting permissions for ($fs_data)." perms/content
    [$fs_data $user 0644 0755] | bf ch apply
}
