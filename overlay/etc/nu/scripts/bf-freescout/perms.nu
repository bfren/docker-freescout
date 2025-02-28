use bf

# User / group for permissions
const user = "www:www"

# Set permissions on data files and directories
export def set [] {
    # set permissions for data and cache directories
    apply $"(bf env FS_DATA)"
    apply $"(bf env FS_SRC_BOOSTRAP_CACHE)"
    apply $"(bf env FS_SRC_STORAGE)"
    apply $"(bf env FS_SRC_PUBLIC_CSS_BUILDS)"
    apply $"(bf env FS_SRC_PUBLIC_JS_BUILDS)"
    apply $"(bf env FS_SRC_PUBLIC_MODULES)"
}

# Apply standard permissions to a path
def apply [
    path: string    # Apply standard permissions to this path
] {
    bf write $"Setting permissions for ($path)." perms/set
    [$path $user "0664" "0775"] | bf ch apply
}
