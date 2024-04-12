use bf

# Append an instruction to the default crontab
#
# See (e.g.) https://crontab.guru/ for valid values
export def append [
    command: string                 # The command to run according to the pattern
    --min (-m): string = "*"        # Pattern: minute, e.g. 50 (every 50th minute past the hour) or */10 (every ten minutes)
    --hour (-h): string = "*"       # Pattern: hours, e.g. 4 (every 4am) or */8 (every eight hours)
    --day (-d): string = "*"        # Pattern: day of the month, e.g. 20 (every 20th of the month) or */2 (every two days)
    --month (-M): string = "*"      # Pattern: month of the year, e.g. 6 (every June) or */4 (every four months)
    --weekday (-w): string = "*"    # Pattern: weekday, e.g. 0 (every Sunday) or 1-5 (every Monday-Friday)
] {
    # get variables
    let crontab = bf env CRONTAB_ROOT
    let pad = { $in | fill -a left -c " " -w 8 }

    # if crontab doesn't exist, generate it
    if ($crontab | bf fs is_not_file) { generate_default }

    # create padded crontab pattern string
    let pattern = [
        ($min | do $pad)
        ($hour | do $pad)
        ($day | do $pad)
        ($month | do $pad)
        ($weekday | do $pad)
    ] | str join

    # append to crontab
    $"($pattern)($command)(char newline)" | save --append $crontab
}

# Generate the default crontab
export def generate_default [] { bf esh template (bf env CRONTAB_ROOT) }

# Generate a cron file to execute on the specified frequency
export def generate_template [
    frequency: string   # Cron frequency: "1min", "15min", "hourly", "daily", "weekly", "monthly"
    file: string        # Desired filename of the cron file (a matching .esh file must be placed in the templates directory)
] {
    # ensure frequency is a supported value
    let supported = [
        "1min"
        "15min"
        "hourly"
        "daily"
        "weekly"
        "monthly"
    ]
    if $frequency not-in $supported { bf write error $"'($frequency)' is not a supported cron frequency." crontab/generate_template }

    # generate the template
    let output = $"(bf env CRON_D)/($frequency)/($file)"
    bf write $"Generating ($output)." crontab/generate_template
    bf esh template $output

    # apply cron permissions
    bf ch apply_file "01-cron"
}
