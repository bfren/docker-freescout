use bf
bf env load

def main [] {
    # generate fetch email cron script
    let fetch_emails = $"(bf env CRON_D)/1min/fetch-emails"
    bf write $"Generating ($fetch_emails)."
    bf esh template $fetch_emails
}
