use bf

const fresh = "FS_FRESH_INSTALL"
const installed = "FS_INSTALLED"

# Mark the application as installed.
export def complete [] { bf env set $installed 1}

# Mark the application as a fresh installation.
export def fresh [] { bf env set $fresh 1}

# Check whether or not the application is installed.
export def is_complete [] { bf env check $installed }

# Check whether or not the application is a fresh installation.
export def is_fresh [] { bf env check $fresh }
