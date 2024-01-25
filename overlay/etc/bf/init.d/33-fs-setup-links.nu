use bf
bf env load

def main [] {
    # ensure environment file exists
    if (bf env FS_ENV | bf fs is_not_file) { bf write error "FreeScout environment file cannot be found." }

    # link source to /data
    create_if_not_link (bf env FS_SRC_ENV) (bf env FS_ENV)
    create_if_not_link (bf env FS_SRC_MODULES) (bf env FS_MODULES)
    create_if_not_link (bf env FS_SRC_STORAGE) (bf env FS_STORAGE)
    create_if_not_link (bf env FS_SRC_PUBLIC_STORAGE) (bf env FS_STORAGE_PUBLIC)

    let fs_modules = bf env FS_MODULES
    let fs_src_public_modules = bf env FS_SRC_PUBLIC_MODULES
    ls $fs_modules | where type == dir | each {|x|
        create_if_not_link $"($fs_src_public_modules)/($x | path basename)" $x
    }
}

# Create a link to a target if the link does not exist.
def create_if_not_link [
    link: string    # Path to the link to check
    target: string  # Target to use if $link does not exist
] {
    if ($link | bf fs is_not_symlink) {
        bf write $"Linking ($link) to ($target)."
        rm --force --recursive $link
        ^ln -s $target $link
    }
}
