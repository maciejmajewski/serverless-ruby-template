# Serverless Ruby template
[![Build Status Ruby](https://github.com/maciejmajewski/serverless-ruby-template/workflows/Ruby/badge.svg)](https://github.com/maciejmajewski/serverless-ruby-template/actions?workflow=Ruby)
[![Build Status Terraform](https://github.com/maciejmajewski/serverless-ruby-template/workflows/Terraform/badge.svg)](https://github.com/maciejmajewski/serverless-ruby-template/actions?workflow=Terraform)

This is template for creating Serverless application with Ruby backend.

## Requirements

- `node`, `yarn` - to install `serverless`
- `terraform 0.12`
- `ruby 2.5.7`
- `direnv` (optional) - to set env variables in development automatically for
  you
- `docker` + optional `docker-compose` - for running DynamoDB Local

## Why Terraform?

`serverless` is used for managing and deploying client & backend applications.
It can be used for orchestrating all resources required by application to run
(like DynamoDB tables). Terraform  is more mature in managing resources coming
from multiple providers so it is a better fit for managing things like domains
DNS records or S3 buckets creation/configuration.

## Getting started

### Installation

Assuming you have `node`, `yarn` and `ruby` installed run:

```
yarn   # to install serverless and all dependencies
bundle # to install Ruby Gems
```

### Development

To run tests execute:

```
rspec
```

Make sure DynamoDB local is running:

```
docker-compose up
```

To verify code style run:

```
rubocop
```

### Deployment

```
npx serverless deploy
terraform apply
yarn build && npx sls client deploy
```

## Configuration files

- `.env` - contains application configuration that can be committed to source
  code repository, e.g. external API URLs, mappings
- `.env.local` - configuration for local development. Use `.env.local.template`
  to create this file. It contains all env variables that are created by
  `serverless` stack - so they aren't available on localhost, for instance
  DynamoDB table names (`DYNAMODB_TABLE_EXAMPLE`)
- `.envrc` - project configuration for running Terraform and Serverless.
  Use `.envrc.template` to create this file. It contains env variables exports
  to be set before running `terraform` or `serverless` commands. You can use
  tools like [direnv](https://direnv.net) to set them automatically for you.
  
