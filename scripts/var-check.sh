#!/usr/bin/env bash

if ! aws sts get-caller-identity &>/dev/null
then
  echo "Unable to use the AWS CLI. Make sure of one of the following:"
  echo -n "  - AWS_PROFILE is set, and the profile in ~/.aws/config or the "
  echo       "environment variable AWS_REGION sets a region"
  echo -n "  - AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, and AWS_REGION are set"
  echo -n    ". You may also need AWS_SESSION_TOKEN if you're using temporary "
  echo       "credentials."
  echo
  echo "See https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-using.html."
  exit 1
fi
