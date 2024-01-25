use bf
use bf-freescout
bf env load

def main [] {
    # ensure environment file is linked
    if (bf env FS_SRC_ENV | bf fs is_not_symlink) { bf write error "Source environment file is not linked correctly." }

    # move to source directory so we can run artisan
    bf write "Running setup using artisan."
    cd (bf env FS_SRC)

    # generate key for fresh installations
    if (bf-freescout install is_fresh) {
        bf write debug " .. generating key"
        ^php artisan key:generate
    }

    # clear cache
    bf write debug " .. clearing cache"
    ^php artisan freescout:clear-cache

    # clear configuration
    bf write debug " .. clearing configuration"
    ^php artisan config:clear

    # we don't use artisan storage:link because we've moved the storage location

    # run database migrations
    ^php artisan migrate --force

    # if this is not a fresh installation we're finished
    if not (bf-freescout install is_fresh) { return }

    # create user account
    bf write debug " .. creating admin user"
    let args = [
        "-n"
        "freescout:create-user"
        "--role" "admin"
        "--firstName" (bf env FS_ADMIN_FIRSTNAME)
        "--lastName" (bf env FS_ADMIN_LASTNAME)
        "--email" (bf env FS_ADMIN_EMAIL)
        "--password" (bf env FS_ADMIN_PASS)
    ]

    # mark setup as complete
    bf-freescout install complete
}
