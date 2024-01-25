use bf
use bf-freescout
bf env load

def main [] {
    # ensure storage files exist
    if (bf env FS_STORAGE | bf fs is_not_dir) { bf write error "FreeScout public storage directory cannot be found." }

    # generate environment file from the template
    let fs_env = bf env FS_ENV
    bf write $"Generating ($fs_env)."
    bf esh template $fs_env
}
