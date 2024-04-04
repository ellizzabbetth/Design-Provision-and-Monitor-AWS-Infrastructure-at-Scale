# Cloud Developer ND Course 2: Design for Performance and Scalability

---

## Project 2  Design for Performance and Scalability


Plan, design, provision, and monitor infrastructure in AWS using industry-standard and open source tools. Practice the skills you have learned throughout the course to optimize infrastructure for cost and performance. Use Terraform to provision and configure AWS services in a global configuration.

## Required

- AWS CLI
- Terraform


### Task 1 Create AWS Infrastructure Diagram
- Cost-effective AWS infrastructure for a new social media application development project for 50,000 single-region users. [Diagram_1](Task1/Udacity_Diagram_1.pdf)


### Task 2 Serverless Schematic Diagram
- You have been asked to plan a SERVERLESS architecture schematic for a new application development project. The project requires the following AWS infrastructure and services.
- Serverless architecture for a new application development project. Udacity_Diagram_2.pdf [Diagram_2](Task2/Udacity_Diagram_2.pdf)

### Task 3 Calculate Infrastructure Costs
- [Initial_Cost_Estimate](Task3/Initial_Cost_Estimate.csv)
- [Reduced_Cost_Estimate](Task3/Reduced_Cost_Estimate.csv)
- [Increased_Cost Estimate](Task3/Increased_Cost_Estimate.csv)

https://calculator.aws/#/estimate?id=36b31200221d54ceee14d53b6694fa6b504aa448

### Reduced costs changes

Changes:

- Use more but smaller EC2 instances
- Use smaller RDS instances
- Use reserved instances

Reasoning:

- The use of smaller EC2 instances allows for more granular autoscaling. However there is a risk that this could reduce performance.
- The use of smaller RDS instances allows for significantly lower costs. However this could negatively impact database performance.
- Using reserved instances will significantly reduce costs. The disadvantage is the loss in flexibility since it requires a commitment to using the selected infrastructure for the next year. 

### Increased costs changes

Changes:

- Larger RDS instances
- More EC2 instances for scaling
- Third availability zone set up in us-east-2
  - Elastic Load Balancing
  - EC2 Auto Scaling (web and application server)
  - RDS read replica
  - VPC NAT Gateway
  - CloudFront
  - S3 Bucket


Reasoning:

- Larger RDS instances will improve database performance and allow for horizonal scaling.
- More EC2 instances improve application performance and will allow for vertical scaling.
- Third availability zone in a second region allows for failover if there is a region wide disaster and the `us-east-1` region experiences an outage. This is unlikely to happen so this feature is more of a nice-to-have rather than an neccesscity.



### Task 4a Infrastructure as Code

- [Terraform 6 EC2](Task5/Terraform_1_1.png)
- [Terraform 4 EC2](Task5/Terraform_1_2.png)

### Task 4b Use Terraform to Provision AWS Infrastructure

- [Terraform EC2](Task5/Terraform_2_1.png)

### Task 4c Destroy the Infrastructure using Terraform

- [Terraform_destroyed](Task5/Terraform_destroyed.png)



## Project  Instructions

### Exercise 1

1. Download the [starter code](https://github.com/udacity/cand-c2-project).
2. In the main.tf file write the code to provision
   * AWS as the cloud provider
   * Use an existing VPC ID
   * Use an existing public subnet
   * 4 AWS t2.micro EC2 instances named Udacity T2
   * 2 m4.large EC2 instances named Udacity M4
3. Run Terraform. 
4. Take a screenshot of the 6 EC2 instances in the AWS console and save it as `Terraform_1_1`. 
5. Use Terraform to  delete the 2 m4.large instances 
6. Take an updated screenshot of the AWS console showing only the 4 t2.micro instances and save it as `Terraform_1_2`

![](screenshots/Terraform_1_1.png)

![](screenshots/Terraform_1_2.png)

![](screenshots/Terraform_2_1.png)



### Exercise 2

1. In the  Exercise_2 folder, write the code to deploy an AWS Lambda Function using Terraform. Your code should include:

   * A lambda.py file
   * A main.tf file with AWS as the provider, and IAM role for Lambda, a VPC, and a public subnet
   * An outputs.tf file
   * A variables.tf file with an AWS region
  
2. Take a screenshot of the EC2 instances page



3. Take a screenshot of the VPC page 

![](screenshots/Terraform_destroyed.png)


Resources
1. https://www.youtube.com/watch?v=4ZCrRbPR3gc
2. Serverless Architecture: https://aws.amazon.com/getting-started/hands-on/build-serverless-web-app-lambda-apigateway-s3-dynamodb-cognito/
3. How to Setup Terraform with AWS in Windows | Run Terraform from local | Automate AWS Infrastructure: https://www.youtube.com/watch?v=4ZCrRbPR3gc

terraform init
terraform plan
terraform apply
terraform destroy --target aws_instance.UdacityM4
