#!/bin/bash

AWS_PROFILE=$1

if test -z "${AWS_PROFILE}"; then
  echo "error: missing arg"
  exit 1
fi

bucket=$(aws --profile "${AWS_PROFILE}" s3 ls \
  | cut -d " " -f 3 \
  | peco)

test -z "${bucket}" && exit 0
echo "* bucket"
echo "${bucket}"

object=$(aws --profile "${AWS_PROFILE}" s3 ls "s3://${bucket}" --recursive \
  | tr -s " " \
  | cut -d " " -f 4 \
  | peco)

test -z "${object}" && exit 0
echo "* object"
echo "${object}"

echo "* tf state"

aws --profile "${AWS_PROFILE}" s3 cp "s3://$bucket/$object" - \
  | jq -r '.resources[] | "\(.mode) \(.type)"' \
  | column -t
