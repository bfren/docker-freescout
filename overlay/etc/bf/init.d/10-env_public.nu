use bf
bf env load

# Override Nginx public environment variable to point to FreshRSS source
def main [] {
    let fs_src = $"(bf env ETC_SRC)/freescout"
    bf env set FS_SRC $fs_src
    bf env set NGINX_PUBLIC $"($fs_src)/public"
}
