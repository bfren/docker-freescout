use bf

const fresh = "FS_INSTALL_FRESH"
const complete = "FS_INSTALL_COMPLETE"

# Mark the application as installed.
export def complete [] { bf env set $complete 1}

# Mark the application as a fresh installation.
export def fresh [] { bf env set $fresh 1}

# Check whether or not the application is installed.
export def is_complete [] { bf env check $complete }

# Check whether or not the application is a fresh installation.
export def is_fresh [] { bf env check $fresh }
