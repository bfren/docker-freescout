use bf
use bf-freescout
bf env load

def main [] {
    # ensure storage files exist
    if (bf env FS_STORAGE | bf fs is_not_dir) { bf write error "FreeScout storage directory cannot be found." }

    # an existing installation was detected, do not proceed
    if (bf-freescout install is_existing) {
        bf write "Taking over an existing installation - do not regenerate .env file."
        return
    }

    # generate environment file from the template
    let fs_env = bf env FS_ENV
    bf write $"Generating ($fs_env)."
    bf esh template $fs_env

    # set permissions
    bf write "Setting permissions on data directory."
    bf-freescout perms set
}
