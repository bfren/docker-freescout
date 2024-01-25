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
    bf env set FS_STORAGE $"($fs_data)/storage"

    let fs_src = bf env FS_SRC
    bf env set FS_SRC_ENV $"($fs_src)/.env"
    bf env set FS_SRC_MODULES $"($fs_src)/Modules"
    bf env set FS_SRC_BOOSTRAP_CACHE $"($fs_src)/bootstrap/cache"

    let fs_public = $"($fs_src)/public"
    bf env set FS_SRC_PUBLIC $fs_public
    bf env set FS_SRC_PUBLIC_CSS_BUILDS $"($fs_public)/css/builds"
    bf env set FS_SRC_PUBLIC_JS_BUILDS $"($fs_public)/js/builds"
    bf env set FS_SRC_PUBLIC_MODULES $"($fs_public)/modules"
    bf env set FS_SRC_PUBLIC_STORAGE $"($fs_public)/storage"

    let fs_storage = $"($fs_src)/storage"
    bf env set FS_SRC_STORAGE $fs_storage
    bf env set FS_SRC_STORAGE_APP $"($fs_storage)/app/public"
    bf env set FS_SRC_STORAGE_ATTACHMENTS $"($fs_storage)/attachments"
    bf env set FS_SRC_STORAGE_CACHE $"($fs_storage)/framework/cache/data"
    bf env set FS_SRC_STORAGE_LOGS $"($fs_storage)/logs"
}
