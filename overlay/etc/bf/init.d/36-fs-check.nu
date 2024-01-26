use bf
use bf-freescout
use bf-s6
bf env load

def main [] {
    # set permissions
    bf write "Setting standard permissions."
    bf-freescout perms set

    # if setup completed succesfully, write nice message and exit
    if (bf-freescout install is_complete) {
        bf clean
        bf write ok "FreeScout setup complete."
        return
    }

    # otherwise remove environment file
    if (bf-freescout install is_fresh) { rm (bf env FS_ENV) }

    # terminate container
    bf write notok "FreeScout setup did not complete successfully, terminating container."
    bf-s6 cont terminate
}
