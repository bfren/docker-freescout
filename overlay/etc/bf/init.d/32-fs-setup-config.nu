use bf
use bf-freescout
bf env load

def main [] {
    # ensure storage files exist
    if (bf env FS_STORAGE | bf fs is_not_dir) { bf write error "FreeScout storage directory cannot be found." }

    # for a fresh installation, generate environment file from the template
    if (bf-freescout install is_fresh) {
        let fs_env = bf env FS_ENV
        bf write $"Generating ($fs_env)."
        bf esh template $fs_env
    } else {
        bf write "Taking over an existing installation - do not regenerate .env file."
    }

    # set permissions
    bf write "Setting permissions on data directory."
    bf-freescout perms set
}