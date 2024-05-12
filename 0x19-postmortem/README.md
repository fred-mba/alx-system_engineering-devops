## Postmortem Report: Security Breach due to Dictionary Attack

### Incident Overview
**Date:** Sunday, May 12, 2024
**Time:** 8:21 AM - 9:27 AM GMT
**Impact:** Unauthorized access to multiple user accounts, potential data leakage

### Issue Summary
At 8:21 AM, our security monitoring system detected multiple failed login attempts originating from various IP addresses. Investigations revealed that these attempts were part of dictionary attack targeting our authentication systems. Despite our system’s limiting measures, the attacker utilized users’ logins to access their accounts. The root cause of this breach was weak passwords and lack of multi-factor authentication access into users’ accounts.

**Timeline (all times Greenwich Meridian Time)**
•	8:26 AM: Incident detected
•	8:31 AM: Pagers alerted on-call person
•	8:35 AM: On-call person escalate the issue to the security team
•	8:41 AM: Failed attempts to block access to authentication systems
•	8:55 AM: Successful configuration change rollback
•	9:00 AM: Servers restart begin
•	9:25 AM: 100% traffic back online

### Root Cause
At 8:18, monitors registered multiple login attempts from different IP addresses. Investigations show weak passwords and lack of multi-factor verification paved access to most user’s accounts. This resulted to exposal and manipulation users’ information. Insufficient user alert for suspicious login activities was co-issue. At least 2% of our customers were affected by this cyberattack.

### Resolution and Recovery
Security team responded within 10 minutes of initial detection. At 8:41 AM, the response team tried to block Ip addresses associated with the attack with no success. This forced the team to reset passwords for compromised accounts and enforce stronger password policies. At this time frame, affected users were informed to be patient as servers were under maintenance.

The team implemented rate limiting mechanisms to prevent brute force, ARP sniffing and dictionary attacks. In addition, enhanced monitoring and alerting measures for abnormal login patterns in earlier stages were adopted. 
Corrective and Preventive measures
Two days after the incident, we conducted an internal analysis to review areas for improvement, recommendations and preventive measures.
**Areas of Improvement**
•	Proactive enforcement of strong password policies
•	Implementation of multi-factor verification for added layer of security.
•	Fix the underlying authentication layers and monitoring mechanisms to correctly alert on alerts.
•	Add a double verification process to users account
•	Conduct regular awareness training for users on creating strong passwords
•	Creating and implementing automatic tools detecting and blocking cyberattacks

We are committed to respond and protect our customers against cyberattacks. We acknowledge the efforts of the security team in responding promptly to this cybersecurity attack and implementing measures to prevent similar incidents in future. We appreciate your patience during server downtimes and apologize for the inconveniences.
