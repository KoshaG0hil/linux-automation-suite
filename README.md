# Linux Automation Suite

A collection of production-grade Bash scripts that automate 
Linux server health monitoring, log management, user auditing, 
and backups.

Built as part of a DevOps learning portfolio.

## Project Structure

linux-automation-suite/
├── scripts/        # Bash automation scripts
├── cron/           # Cron schedule configuration
├── systemd/        # Systemd timer units
├── docs/           # Runbooks and documentation
├── tests/          # Script test harness
└── README.md

## Scripts

| Script | Purpose | Schedule |
|---|---|---|
| disk_check.sh | Alerts when disk exceeds 80% | Every hour |
| log_cleanup.sh | Rotates logs older than 7 days | Daily 2am |
| user_audit.sh | Reports sudo users and logins | Weekly |
| backup.sh | Backs up critical directories | Daily 3am |

## Tech Stack

- OS: Kali Linux (Ubuntu-based)
- Language: Bash
- Scheduler: Cron + Systemd timers
- Alerting: Slack webhooks via curl
- Version Control: Git + GitHub
- Security: SSH key auth, UFW firewall

## Setup

### Prerequisites
- Linux machine
- Git installed
- curl installed

### Configuration
Create a .env file in your home directory:
SLACK_WEBHOOK=your_slack_webhook_url
THRESHOLD=80

## Week by Week Progress

- [x] Week 1 — Environment setup, SSH, UFW, Git
- [ ] Week 2 — Disk check and log cleanup scripts
- [ ] Week 3 — User audit and backup scripts
- [ ] Week 4 — Cron, systemd timers, Slack alerts
- [ ] Week 5 — Testing, documentation, GitHub polish

## Author

Kosha Gohil
GitHub: https://github.com/KoshaG0hil
