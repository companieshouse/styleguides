# Innovation AWS Account Deployment Guidance

This guide provides best practices for deploying resources in our innovation AWS account, with a focus on resource efficiency and cost optimisation.

## Overview

The innovation AWS account is a space for experimentation and proof-of-concepts. All resources deployed here should be tagged appropriately and sized to minimise costs while meeting functional requirements.

## Data Handling

Do not use live data that is not
publicly available in the innovation AWS account. Personally identifiable information (PII) must never be used. Use synthetic data that contains no PII for development, testing, demonstrations, and proof-of-concepts instead.

> [!NOTE]
> Synthetic data is artificially generated information that may mimic the
> characteristics of real data, but has no relation to any live data and does
> not represent real people, organisations, or events. This differs from
> anonymised data, which is live data that has been processed to remove or
> obscure identifying information. Synthetic data must not contain real
> personal, confidential, or sensitive information.

## Tagging Strategy

All taggable resources **must** be tagged with the following mandatory tags:

### Required Tags

| Tag Key | Description | Example Value | Notes |
|---------|-------------|----------------|-------|
| `Name` | Human-readable resource identifier | `my-api-service` | Use lowercase with hyphens |
| `Team` | Scrum team responsible for the resource | `Apollo`, `Titans` | Use exact team name |
| `ContactEmail` | Email of primary contact for the resource | `apollo-team@companieshouse.gov.uk` | Used for notifications and escalations |

### Optional Tags

Consider adding these tags for better resource organisation:

| Tag Key | Description | Example Value | Notes |
|---------|-------------|---------------|-------|
| `Project` | Associated project or initiative | `ai-experimentation` | |
| `Environment` | Deployment environment | `innovation` | |
| `ManagedBy` | Infrastructure management tool | `terraform` | |
| `ShutdownSchedule` | Shutdown schedule outside work hours | `mon-fri-1800-0800` | Used for cost optimisation |

### Tagging Example

```yaml
Name: ml-training-pipeline
Team: Apollo
ContactEmail: asurname@companieshouse.gov.uk
Project: predictive-analytics
Environment: innovation
ManagedBy: terraform
ShutdownSchedule: mon-fri-1800-0800
```

## Resource Sizing Best Practices

### General Principles

1. **Start Small**: Always provision the smallest resource size that meets your requirements
2. **Monitor & Scale**: Use CloudWatch metrics to identify performance bottlenecks
3. **Right-size Regularly**: Review running resources weekly and adjust allocations
4. **Avoid Waste**: Delete unused resources immediately

### Compute (EC2)

- **Default**: `t3.micro` or `t4g.micro` (eligible for free tier)
- **For testing/CI/CD**: `t3.small` maximum
- **For short-lived workloads**: Use spot instances (up to 70% savings)
- **Avoid**: `m5.large` and larger unless justified

**Action**: Enable auto-scaling with aggressive scale-down policies (e.g., scale down after 5 minutes of low CPU)

### Containers (ECS/EKS)

- **Task size**: Start with 256 MB memory, 0.25 vCPU
- **Number of replicas**: 1 (unless high availability is required)
- **Scaling**: Enable CPU-based auto-scaling at 70% threshold

### Databases (RDS/DynamoDB)

- **RDS**: Use `db.t3.micro` with single-AZ deployment (not Multi-AZ)
- **DynamoDB**: Use on-demand billing for unpredictable workloads to avoid over-provisioning
- **PostgreSQL/MySQL**: Prefer RDS over self-managed databases (reduces operational overhead)
- **Avoid**: Reserved instances (buy as consumption proves demand)

### Storage (S3/EBS)

- **S3**: Use `STANDARD_IA` storage class for non-active data
- **EBS**: Use `gp3` volumes (better performance-to-cost ratio than gp2)
- **Volume size**: Start with 10 GB, expand as needed
- **Enable lifecycle policies**: Automatically transition or delete old objects

### Networking

- **Load Balancer**: Use Network Load Balancer (NLB) only if needed; consider Application Load Balancer (ALB) for HTTP/HTTPS
- **NAT Gateway**: Disable or use NAT instances (cost > $32/month for NAT Gateway)
- **VPC Endpoints**: Consider for AWS services to reduce NAT Gateway usage

### Lambda

- **Memory**: Start with 128 MB
- **Timeout**: Set conservatively (60 seconds default)
- **Reserved Concurrency**: Only set if truly necessary
- **Layers**: Share common dependencies to reduce package size
- **Event triggers**: Confirm each EventBridge rule, SQS queue, SNS topic, API Gateway route, and other event source invokes the intended function with the expected permissions and filtering. Disable any trigger that is incorrectly configured until it is corrected.

## Resource Selection by Use Case

### Web Application

```text
- Compute: t3.small EC2 or App Runner (schedule shutdown outside work hours)
- Database: RDS (db.t3.micro, PostgreSQL)
- Storage: S3 (Standard storage class)
- Load Balancing: ALB (if multiple instances)
- Monitoring: CloudWatch (free tier included)
```

### Data Processing / Batch Jobs

```text
- Compute: EC2 Spot Instances (t3.small) or Batch (schedule for business hours only)
- Storage: S3 (Standard_IA for processed data)
- Processing: Lambda (for scheduled tasks) or Glue (for data pipelines)
- Monitoring: CloudWatch Logs
```

### Machine Learning / Model Training

```text
- Compute: SageMaker (ml.t3.medium notebook, ml.p3.2xlarge training only when active)
- Storage: S3 (STANDARD_IA for datasets)
- Monitoring: SageMaker Model Monitor + CloudWatch
- Tip: Schedule training jobs during business hours; use spot instances (up to 70% savings)
```

### API / Microservices

```text
- Compute: ECS on Fargate (256 MB/0.25 vCPU) or Lambda
- Database: DynamoDB (on-demand) or RDS (db.t3.micro, consider shutting down outside hours)
- Caching: ElastiCache (cache.t3.micro)
- API Gateway: Pay per million requests
```

## Shutting Down Resources Outside Work Hours

Significant cost savings can be achieved by shutting down non-critical resources outside business hours (typically 18:00–08:00 and weekends).

### Resources to Consider Shutting Down

- **EC2 instances** (unless they serve 24/7 traffic)
- **RDS databases** (take snapshots before shutdown for data retention)
- **SageMaker notebook instances** (always shut down when not in active use)
- **NAT Gateways** (may save ~$35/month per gateway)
- **Batch jobs** (schedule for business hours only)

### Resources to Keep Running

- **S3 buckets** (no hourly charges, only storage and transfer)
- **DynamoDB with on-demand billing** (minimal cost when not in use)
- **Lambda** (pay only per invocation)
- **CloudWatch** (usually free tier covers most use)

### Implementation Methods

#### Option 1: AWS Systems Manager Maintenance Windows

- Automate start/stop schedules for EC2 and RDS
- Set tag-based schedules (e.g., `ShutdownSchedule: mon-fri-1800-0800`)
- Recommended for teams using Infrastructure-as-Code

#### Option 2: EventBridge + Lambda

- Create EventBridge rules to trigger Lambda functions at scheduled times
- Lambda stops/starts resources based on tags
- More flexible for complex shutdown logic

#### Option 3: Manual Shutdown

- For one-off or ad-hoc resources
- Remember to shut down before leaving for the day
- Set email reminders if needed

### Example Shutdown Schedule

```text
ShutdownSchedule: mon-fri-1800-0800  # Stop 6 PM Friday through 8 AM Monday
ShutdownSchedule: daily-1800-0800    # Stop 6 PM–8 AM daily
ShutdownSchedule: manual              # No automatic shutdown
```

## Cost Optimisation Checklist

Before deploying, verify:

- [ ] The deployment uses only synthetic data or publicly available data, with no PII
- [ ] All resources have `Name`, `Team`, `ContactEmail`, and `CostCentre` tags
- [ ] Resource size is the smallest that meets requirements
- [ ] Shutdown schedule enabled for resources that don't need 24/7 availability
- [ ] Lambda event triggers have been confirmed as correctly configured; incorrect triggers are disabled
- [ ] Unused security groups, EBS volumes, and snapshots will be deleted
- [ ] Database backups are set to minimal retention (7 days default)
- [ ] S3 versioning disabled (unless explicitly required)
- [ ] CloudTrail and VPC Flow Logs are disabled in innovation account
- [ ] Reserved instances are NOT purchased (use on-demand only)
- [ ] Estimated monthly cost does not exceed team budget

## Monitoring & Cleanup

### Weekly Tasks

1. Review [AWS Cost Explorer](https://console.aws.amazon.com/cost-management/home#/custom) for resource costs filtered by CostCentre
2. Check CloudWatch alarms for resource health
3. Identify underutilised resources and scale down or delete
4. Verify shutdown schedules are running as expected

### Automatic Cleanup

- Set resource expiration tags (e.g., `ExpirationDate: 2026-10-15`)
- Use [AWS Config](https://aws.amazon.com/config/) rules to enforce required tagging
- Enable CloudTrail for audit logging

## Getting Help

- **AWS Cost Optimisation**: See the AWS Trusted Advisor recommendations
- **Performance Issues**: Review CloudWatch metrics and logs
- **Shutdown Schedule Setup**: Contact the platform engineering team
- **Account-level Questions**: Contact the platform engineering team
