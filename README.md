# Linux & Networking Home Lab

Hands-on home lab documenting my learning in Linux administration, 
networking, and security — built alongside CCNA certification prep.

## Lab Environment
- Ubuntu Server (learning server, local network)
- Kali Linux (internet access, used for traffic analysis)
- Metasploitable 2
- VirtualBox

---

## Linux Administration

### File Permissions & Group Access Control
Designed and implemented a directory-based access control scheme for a 
simulated company structure.

- Created 5 department groups: `department`, `sales`, `finance`, `IT`, `developers`
- Built `/srv/company` with one subdirectory per group
- Applied **SGID** on each directory so new files/folders automatically 
  inherit the parent group instead of the creating user's default group
- Applied **chmod** so only the owner and group members have read/execute 
  access — other users have none
- Wrote a bash script (`linux/scripts/`) to automate user creation and 
  group assignment

**Note:** while testing `umask`, I found it's set per user/session and 
doesn't guarantee consistent permissions across a team — this pointed me 
toward **default ACLs** (`setfacl -d`) as the correct tool for enforcing 
inherited permissions regardless of who creates the file. Planned as a 
follow-up.

### In Progress
- Process management (`top`, `ps -ef`, `kill -15`/`kill -9`)

### Planned
- Default ACLs
- Cron / scheduled tasks

---

## Networking
*Not started yet — planned after current CCNA modules.*

## Security
*Planned — Nmap scanning, Metasploitable 2 assessment, Linux hardening.*

## Automation
*Planned — Bash scripting, Ansible, Docker.*
