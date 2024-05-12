## Postmortem Report: Security Breach Due to Dictionary Attack

### Incident Overview
- **Date:** Sunday, May 12, 2024
- **Time:** 8:21 AM - 9:27 AM GMT
- **Impact:** Unauthorized access to multiple user accounts, potential data leakage

### Issue Summary
On the fateful day of May 12, 2024, at 8:21 AM, our security monitoring system detected multiple failed login attempts originating from various IP addresses. Investigations revealed that these attempts were part of a dictionary attack targeting our authentication systems. Despite our system’s limiting measures, the attacker utilized users’ logins to access their accounts. The root cause of this breach was weak passwords and a lack of multi-factor authentication access to users’ accounts.

**Timeline (all times Greenwich Meridian Time)**
*       8:26 AM: Incident detected
*       8:31 AM: Pagers alerted on-call person
*       8:35 AM: The on-call person escalated the issue to the security team
*       8:41 AM: Failed attempts to block access to authentication systems
*       8:55 AM: Successful configuration change rollback
*       9:00 AM: Servers restart begin
*       9:25 AM: 100% traffic back online

### Root Cause
At 8:18, monitors registered multiple login attempts from different IP addresses. Investigations show weak passwords and lack of multi-factor verification paved access to most users' accounts. This resulted in the exposal and manipulation of users’ information. Insufficient user alert for suspicious login activities was a co-issue. At least 2% of our customers were affected by this cyberattack.

### Resolution and Recovery
The security team responded within 10 minutes of initial detection. At 8:41 AM, the response team tried to block IP addresses associated with the attack with no success. This forced the team to reset passwords for compromised accounts and enforce stronger password policies. The affected users were informed to be patient as servers were under maintenance.

![Resolution](https://www.cartertoons.com/wp-content/uploads/2021/02/Blister-Pack-Data.jpg)

The team implemented rate-limiting mechanisms to prevent brute force, ARP sniffing, and dictionary attacks. Advanced anomaly detection algorithms were integrated into our monitoring and alerting systems to proactively identify and flag abnormal login patterns at the earliest stages of intrusion attempts. These algorithms utilize AI techniques to analyze login behavior, detect deviations from baseline activity, and trigger alerts for immediate investigation and response. Additionally, the real-time correlation of login events with contextual data, such as geolocation and user behavior profiles, enhances the accuracy and effectiveness of our threat detection capabilities.
Corrective and Preventive measures
Two days after the incident, we conducted an internal analysis to review areas for improvement, recommendations, and preventive measures.

**Areas of Improvement**
*       Proactive enforcement of strong password policies
*       Implementation of multi-factor verification for an added layer of security.
*       Fix the underlying authentication layers and monitoring mechanisms to alert correctly.
*       Add a double verification process to the user account
*       Conduct regular awareness training for users on creating strong passwords
*       Creating and implementing automatic tools detecting and blocking cyberattacks

We are committed to responding and protecting our customers against cyberattacks. We acknowledge the security team in responding promptly to this cybersecurity attack and implementing measures to prevent similar incidents in the future. We appreciate your patience during server downtimes and apologize for the inconvenience.

