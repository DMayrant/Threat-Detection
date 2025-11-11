# 👮🏾‍♂️ Threat Hunting and Automation 🚨

☁️ The MITRE ATT&CK framework is a globally accepted widely known framework for responding to adversarial tactic, techniques and common knowledge real world threats and threat actors. Addressing the common ways threat actors may navigate in your cloud environment. Threat hunting allows cloud security engineers to check for threats and vulnerabilities within the cloud environment. This framework brings Cyber threat Intelligence (CTI)to organizations. The common tactics threats actors will use to access your account is reconnaissance, defense evasion, lateral movement and exfiltration. For monitoring and incident response, containing the blast radius of the compromised resource is critical so other cloud resources are not impacted.

🕵🏾‍♂️ Certain AWS tools can help detect and monitor anomalies and abnormal behavior within your cloud environment such as Amazon Guardduty. Guardduty offers threat detection and a dashboard showing you examples of healthy traffic flowing within your cloud environment. Guardduty can also be used a security back-end for a CI/CD pipeline or VPC. Guardduty logs can be sent to Amazon EventBridge with a Grafana dashboard back-end for live data visualization

📈 VPC flow logs is another resource that helps monitor traffic within your cloud environment. These logs can be send to S3, redshift, cloud watch events or other third party data ingestion tools such as splunk or snowflake.

Security groups are stateful firewalls that act on the instance level, that that implicitly denies all ingress traffic following to your VPC.

🛠️ In this project, a threat detection environment is set up using AWS services such as VPC flow logs, S3, IAM roles and policies, Amazon Managed Grafana, and AWS API Gateway. A VPC was deployed containing both public and private subnets, configure VPC flow logs to capture network traffic, store the logs in an S3 bucket, and visualize the data using Grafana dashboards. Additionally, we will implement security best practices by creating IAM roles and policies to ensure secure access to resources and protect the backend Aurora databases. A lambda function will be used when triggered for automation of log findings detect suspicious activity. a node.js script is used as a runtime dependency for the lambda function. 

![image alt](https://github.com/DMayrant/Threat-Detection/blob/main/ThreatAutomation.jpeg?raw=true)
