use bf
use bf-s6
bf env load

def main [] { bf-s6 crontab generate_template "1min" "fetch-emails" }
