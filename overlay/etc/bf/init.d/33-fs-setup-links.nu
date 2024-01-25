use bf
use bf-freescout
bf env load

def main [] {
    # ensure environment file exists
    if (bf env FS_ENV | bf fs is_not_file) { bf write error "FreeScout environment file cannot be found." }

    # link source to /data
    bf write "Linking source to volume..."
    create_if_not_link (bf env FS_SRC_ENV) (bf env FS_ENV)
    create_if_not_link (bf env FS_SRC_ATTACHMENTS) (bf env FS_ATTACHMENTS)
    create_if_not_link (bf env FS_SRC_LOGS) (bf env FS_LOGS)
    create_if_not_link (bf env FS_SRC_MODULES) (bf env FS_MODULES)
    create_if_not_link (bf env FS_SRC_PUBLIC_STORAGE) (bf env FS_STORAGE)

    let fs_modules = bf env FS_MODULES
    ls $fs_modules | where type == dir | get name | each {|x|
        create_if_not_link $"(bf env FS_SRC_PUBLIC_MODULES)/($x | path basename)" $x
    }

    # set permissions
    bf write "Setting permissions on data directory."
    bf-freescout perms set
}

# Create a link to a target if the link does not exist.
def create_if_not_link [
    link: string    # Path to the link to check
    target: string  # Target to use if $link does not exist
] {
    if ($link | bf fs is_not_symlink) {
        bf write debug $" .. ($link) to ($target)"
        rm --force --recursive $link
        ^ln -s $target $link
    }
}
