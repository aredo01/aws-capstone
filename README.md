Clarusway Blog Page Application Deployment on AWS 🌍☁️
Overview 📖
The Clarusway Blog Page Application is a web application built using the Django framework. 
This application allows users to write and manage their own blogs, upload media (images/videos), and store their content securely on AWS services such as S3 and RDS. 
The application is hosted on a highly available and scalable AWS infrastructure utilizing EC2, Auto Scaling, Load Balancers, CloudFront, Route 53, and other essential AWS services.

Key Features:
Scalable and Resilient Architecture: Deployed using AWS services such as EC2, RDS, and S3 with Auto Scaling, Load Balancing, and CloudFront caching for high availability and performance. ⚡
Secure Data Handling: Sensitive data such as database credentials are securely managed using SSM Parameter Store. 🔐
Efficient Traffic Management: Application Load Balancer (ALB) manages incoming traffic, with automatic scaling based on load and Route 53 for DNS management and failover routing. 🚦
Serverless Functions: AWS Lambda is used to trigger actions (such as saving media metadata to DynamoDB) when new media is uploaded to S3. 🔄

Architecture Diagram 🏗️

Project Components 🛠️
AWS EC2: Ubuntu 22.04 instances running the Django application. 🖥️
AWS RDS: MySQL database for storing user data. 🗄️
AWS S3: Two buckets, one for user media uploads and the other for failover static website hosting. 🗑️
AWS DynamoDB: Stores metadata of uploaded media files. 📁
AWS Lambda: Triggers on S3 events to update DynamoDB with media metadata. ⚙️
AWS ALB (Application Load Balancer): Manages HTTP(S) traffic and distributes it across EC2 instances. 🔄
AWS Auto Scaling Group: Scales EC2 instances based on load. 📊
AWS CloudFront: Content delivery network (CDN) for fast and secure access to application resources. 🚀
AWS Route 53: DNS management with failover configuration. 🌐
AWS SSM Parameter Store: Securely stores database credentials and GitHub token. 🔑
Architecture Workflow 🔄

User Interaction:

Users interact with the Django-based web application via the browser, hosted on an EC2 instance behind an ALB.
The application allows users to upload images or videos to their personal blog pages, with media content stored in S3.
Load Balancing & Auto Scaling:

Traffic is routed through the ALB, which distributes requests across EC2 instances within the Auto Scaling Group.
The Auto Scaling Group adjusts the number of EC2 instances based on traffic load, ensuring high availability and optimal performance.
Data Storage & Management:

User data is stored in a MySQL database managed by RDS.
Media files are stored in an S3 bucket, with metadata saved to a DynamoDB table.
Lambda functions are triggered by S3 events to update DynamoDB with file metadata.
Security & Performance:

SSL certificates are used for secure HTTP(S) connections, with CloudFront providing content caching for faster access.
Route 53 manages DNS and routes traffic based on health checks for failover purposes.
Steps for Deployment 🚀
1. Create AWS VPC and Subnets 🌍
Set up a dedicated VPC with both public and private subnets across multiple availability zones.
Configure routing tables, NAT Gateway/Instances, and Internet Gateway for secure and optimized communication between resources.
2. Create RDS MySQL Instance 🗄️
Launch an RDS MySQL instance in the private subnet.
Use AWS SSM Parameter Store to securely manage database credentials.
3. Configure EC2 Instances with Django App 🖥️
Launch EC2 instances using Launch Templates.
Install Django and required dependencies using user data scripts.
Clone the project repository from GitHub and deploy the Django app.
4. Set Up S3 for Media Storage 🗂️
Create two S3 buckets: one for storing user-uploaded media and another for a static website in case of failover.
5. Set Up Auto Scaling 📈
Configure an Auto Scaling Group with a desired capacity of 1 EC2 instance, and a max size of 3 instances to handle variable loads.
6. Configure Load Balancer and Target Group 🚦
Set up an ALB and configure it to route traffic securely with SSL termination and redirection from HTTP to HTTPS.
7. Set Up CloudFront 🚀
Create a CloudFront distribution to cache static assets and serve them quickly to end users.
8. Configure Route 53 for DNS Management 🌐
Set up Route 53 with a failover routing policy to ensure traffic is routed to healthy resources.
9. Configure Lambda and DynamoDB ⚙️
Create a Lambda function to capture S3 events and update metadata in DynamoDB.
Environment Variables 🌿
Ensure to set the following environment variables in the Django settings (settings.py):

S3_BUCKET_NAME: The name of the S3 bucket for storing user media.
RDS_DB_NAME: The name of the RDS MySQL database.
RDS_USERNAME: The database username fetched from SSM Parameter Store.
RDS_PASSWORD: The database password fetched from SSM Parameter Store.
GITHUB_TOKEN: Your GitHub token for repository access.
Technologies Used 🛠️
AWS EC2, RDS, S3, CloudFront, Route 53, Lambda, DynamoDB, SSM, ACM 🌐
Django Framework 🐍
Git/GitHub for Version Control 🧑‍💻
Python 3.8, MySQL 🧑‍🔧
Conclusion 🎯
This project demonstrates how to deploy a Django-based web application on AWS using best practices in scalability, security, and high availability. 
It leverages various AWS services to ensure a seamless user experience, with automatic scaling, secure data storage, and efficient traffic management. 💪

License 📝
This project is licensed under the MIT License - see the LICENSE file for details.

## Resources

- [Python Django Framework](https://www.djangoproject.com/)

- [Python Django Example](https://realpython.com/get-started-with-django-1/)

- [AWS CLI Command Reference](https://docs.aws.amazon.com/cli/latest/index.html)
