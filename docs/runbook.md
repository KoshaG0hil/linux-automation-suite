# Runbook

## Week 1 — Environment Setup

### What was set up
A baseline Linux environment on Kali Linux with version 
control, SSH authentication, and firewall protection.

### Tools Installed
- git — version control
- curl — HTTP requests from the terminal
- vim — terminal text editor
- ufw — firewall management

### SSH Key Setup
- Generated an ED25519 SSH key pair
- Private key stored at ~/.ssh/id_ed25519
- Public key added to GitHub account
- Connection tested successfully

### UFW Firewall
- Enabled UFW on system startup
- Allowed OpenSSH on port 22
- All other ports blocked by default

### Git Configuration
- Initialized repository at ~/linux-automation-suite
- Configured username: "user name"
- Default branch set to main
- Connected to GitHub via SSH

### GitHub Repository
- Repository name: linux-automation-suite
