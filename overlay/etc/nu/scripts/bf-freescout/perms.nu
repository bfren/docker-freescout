use bf

# User / group for permissions
const user = "www:www"

# Set permissions on data files and directories
export def set [] {
    # set permissions for data directory
    let fs_data = bf env FS_DATA
    bf write $"Setting permissions for ($fs_data)." perms/set
    [$fs_data $user 0644 0755] | bf ch apply

    # set permissions for build directories
    let fs_public = bf env FS_SRC_PUBLIC
    bf write $"Setting permissions for ($fs_public)." perms/set
    [$"($fs_public)/css/builds" $user 0644 0755]
    [$"($fs_public)/js/builds" $user 0644 0755]
}
