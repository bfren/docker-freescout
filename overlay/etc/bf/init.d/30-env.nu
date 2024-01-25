use bf
bf env load

# Set environment variables
def main [] {
    let fs_data = "/data"
    bf env set FS_DATA $"($fs_data)"
    bf env set FS_ENV $"($fs_data)/.env"
    bf env set FS_ATTACHMENTS $"($fs_data)/attachments"
    bf env set FS_MODULES $"($fs_data)/Modules"
    bf env set FS_LOGS $"($fs_data)/logs"
    bf env set FS_PUBLIC $"($fs_data)/public"

    let fs_src = bf env FS_SRC
    bf env set FS_SRC_ENV $"($fs_src)/.env"
    bf env set FS_SRC_ATTACHMENTS $"($fs_src)/storage/attachments"
    bf env set FS_SRC_LOGS $"($fs_src)/storage/logs"
    bf env set FS_SRC_MODULES $"($fs_src)/Modules"
    bf env set FS_SRC_PUBLIC $"($fs_src)/public"
}
