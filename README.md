# Linux Automation Suite

Automated Bash scripts that keep a Linux server healthy —
no manual checking required.

## What it does

- Monitors disk usage and alerts when storage is running low
- Rotates and compresses old log files automatically
- Audits which users have admin access on the server
- Backs up critical directories on a schedule

## Project Structure

```
linux-automation-suite/
├── scripts/        Bash automation scripts
├── cron/           Cron schedule configuration
├── systemd/        Systemd timer units
├── docs/           Runbooks and documentation
└── tests/          Script test harness
```

## Tech Stack

- OS: Kali Linux
- Language: Bash
- Scheduler: Cron and Systemd timers
- Alerting: Slack webhooks
- Version Control: Git and GitHub
- Security: SSH key auth, UFW firewall

## Progress

- [x] Week 1 — Environment setup, SSH, UFW, Git
- [ ] Week 2 — Disk check and log cleanup scripts
- [ ] Week 3 — User audit and backup scripts
- [ ] Week 4 — Cron, systemd timers, Slack alerts
- [ ] Week 5 — Testing and documentation

## Author

Kosha Gohil
