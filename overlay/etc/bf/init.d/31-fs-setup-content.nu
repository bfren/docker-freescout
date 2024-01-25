use bf
use bf-freescout
bf env load

def main [] {
    # ensure source files exist
    if (bf env FS_SRC | bf fs is_not_dir) { bf write error "FreeScout source files cannot be found." }

    # get path to data directory
    let fs_data = bf env FS_DATA

    # if the environment file does not exist, this is a new installation so move files from source to data directory
    # otherwise the data directory contains an existing installation, so delete source files
    if (bf env FS_ENV | bf fs is_not_file) {
        bf write $"New installation - moving source modules and storage to ($fs_data)."
        bf-freescout install fresh
        move_if_not_link (bf env FS_SRC_MODULES) $fs_data
        move_if_not_link (bf env FS_SRC_STORAGE) $fs_data
    } else {
        bf write $"Taking over an existing installation - deleting default environment, modules and storage."
        delete_if_not_link (bf env FS_SRC_ENV)
        delete_if_not_link (bf env FS_SRC_MODULES)
        delete_if_not_link (bf env FS_SRC_STORAGE)
    }
}

# Delete a file or directory if it is not a link.
def delete_if_not_link [
    path: string    # The path to the file or directory to check
] {
    if ($path | bf fs is_not_symlink) {
        bf write debug $" .. deleting ($path) so it can be turned into a symlink."
        rm --force --recursive $path
    }
}

# Move a file or directory if it is not a link.
def move_if_not_link [
    path: string    # The path to the file or directory to check
    data: string    # The path to the FreeScout data directory
] {
    if ($path | bf fs is_not_symlink) {
        bf write debug $" .. moving ($path) so it can be turned into a symlink."
        mv $path $data
    }
}
