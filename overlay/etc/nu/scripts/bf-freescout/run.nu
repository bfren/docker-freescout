use bf

export def preflight [] {
    # load environment
    bf env load

    # manually set executing script
    bf env x_set --override run freescout-scheduled-tasks

    # if we get here we are ready to start scheduler
    bf write "Starting FreeScout scheduled tasks service."
}
