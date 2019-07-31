# GitHub Action for AWS CDK

This Action for [AWS CDK](https://docs.aws.amazon.com/cdk/index.html) enables arbitrary actions for interacting with the AWS Cloud Development Kit (AWS CDK) via the [AWS CDK Command Line Interface (`cdk`)](https://docs.aws.amazon.com/cdk/latest/guide/tools.html#cli).

_Currently supports CDK apps created with Python_

## Usage

An example workflow for synthesizing an AWS CloudFormation template for your app and then invoking the AWS CloudFormation create/update API to deploy it into your AWS account using `cdk deploy`.


```hcl
workflow "Deploy the Stack" {
  on = "push"
  resolves = ["Deploy"]
}

action "Deploy" {
  uses = "scottbrenner/aws-cdk-action@master"
  args = "deploy"
  secrets = ["AWS_ACCESS_KEY_ID", "AWS_SECRET_ACCESS_KEY"]
}
```

### Secrets

- `AWS_ACCESS_KEY_ID` – **Required** The AWS access key part of your credentials ([more info](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys))
- `AWS_SECRET_ACCESS_KEY` – **Required** The AWS secret access key part of your credentials ([more info](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys))

### Environment

Each Stack instance in your AWS CDK app is explicitly or implicitly associated with an environment (`env`). An environment is the target AWS account and AWS Region into which this stack needs to be deployed. 

See [the CDK developer guide](https://docs.aws.amazon.com/cdk/latest/guide/environments.html) for more information.

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.
