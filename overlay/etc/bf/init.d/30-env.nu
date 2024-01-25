use bf
bf env load

# Set environment variables
def main [] {
    let fs_data = "/data"
    let fs_storage = $"($fs_data)/storage"
    bf env set FS_DATA $"($fs_data)"
    bf env set FS_ENV $"($fs_data)/.env"
    bf env set FS_MODULES $"($fs_data)/Modules"
    bf env set FS_STORAGE $fs_storage
    bf env set FS_STORAGE_LOGS $"($fs_storage)/logs"
    bf env set FS_STORAGE_PUBLIC $"($fs_data)/storage/app/public"

    let fs_src = bf env FS_SRC
    let fs_src_public = $"($fs_src)/public"
    bf env set FS_SRC_ENV $"($fs_src)/.env"
    bf env set FS_SRC_MODULES $"($fs_src)/Modules"
    bf env set FS_SRC_PUBLIC $fs_src_public
    bf env set FS_SRC_PUBLIC_MODULES $"($fs_src_public)/modules"
    bf env set FS_SRC_PUBLIC_STORAGE $"($fs_src_public)/storage"
    bf env set FS_SRC_STORAGE $"($fs_src)/storage"
}
