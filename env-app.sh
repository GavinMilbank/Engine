export ADMIN_EMAIL=admin@portela.co.nz
export APP_NAME=${CIRCLE_PROJECT_REPONAME:-$(basename $(pwd) | tr '[:upper:]' '[:lower:]')}
export APP_DOMAIN=${APP_NAME}.com # portela.biz

# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html
export REPO_DIR=$(pwd)
PATH=${REPO_DIR}/bin:${REPO_DIR}/sbin:${REPO_DIR}/script:${PATH}
PYTHONPATH=src
export AWS_PAGER PATH PYTHONPATH

# https://github.com/aws/aws-cli/issues/4787
if [[ -z "${CIRCLE_BRANCH}" ]] ; then
    echo ${AWS_PROFILE:?is null} > /dev/null
    export AWS_REGION=`aws configure get region`
    if [ `uname` = "Darwin" ] ; then
        . ./script/macos.sh
        export AWS_ACCESS_KEY_ID=`aws configure get aws_access_key_id`
        export AWS_SECRET_ACCESS_KEY=`aws configure get aws_secret_access_key`
        export AWS_ACCOUNT_ID=$(aws sts get-caller-identity | jq .Account | sed -e's/"//g')
    fi
fi
echo ${AWS_REGION:?is null} > /dev/null
echo ${AWS_ACCESS_KEY_ID:?is null} > /dev/null
echo ${AWS_SECRET_ACCESS_KEY:?is null} > /dev/null
echo ${AWS_ACCOUNT_ID:?is null} > /dev/null

#echo Query secrets, hosted-zone and  certificates
export APP_SECRETS_ARN=$(
  aws secretsmanager --region ${AWS_REGION}  list-secrets |
  jq '.SecretList[] |select(.Name=="'${APP_NAME}'") | .ARN' |
  sed -e's/"//g'
)
export APP_HOSTED_ZONE=$(
  aws route53 --region ${AWS_REGION} list-hosted-zones | 
  jq '.HostedZones[] |select(.Name=="'${APP_DOMAIN}.'") | .Id' | 
  sed -e's/"//g'
)
export APP_HOSTED_ZONE_ID=$(echo ${APP_HOSTED_ZONE} | awk -F/ '{print $3}')
export APP_DOMAIN_CERT=$(
  aws acm --region ${AWS_REGION} list-certificates |  
  jq '.CertificateSummaryList[] |select(.DomainName=="'${APP_DOMAIN}'") | .CertificateArn' | 
  head -1 | sed -e's/"//g'
)
export APP_BEANSTALK_CERT=arn:aws:iam::350426166855:server-certificate/portela-tech.com-20211003
# Cloudfront certs
#export APP_DOMAIN_CERT_USEAST1=$(
#  aws acm --region us-east-1 list-certificates --certificate-statuses "ISSUED"| 
#  jq '.CertificateSummaryList[] |select(.DomainName=="'${APP_DOMAIN}'") | .CertificateArn' | 
#   head -1 | sed -e's/"//g'
#)
export ECR_URL=${AWS_ACCOUNT_ID}.dkr.ecr.ap-southeast-2.amazonaws.com
export APP_BUCKET=${APP_NAME}-${AWS_ACCOUNT_ID}-${AWS_REGION}
export WEB_BUCKET=${APP_NAME}-web-${AWS_ACCOUNT_ID}-${AWS_REGION}
export WEB_URL=http://${WEB_BUCKET}.s3-website-${AWS_REGION}.amazonaws.com

export EC2_KEY_NAME=portela
export EC2_VPC=vpc-b84946df
export EC2_SUBNET_A=subnet-f40feebc
export EC2_SUBNET_B=subnet-70533528
export EC2_SUBNET_C=subnet-c9ba4daf
export EC2_SECURITY_GROUP=sg-d40d6ca1 # default
export TZ=Pacific/Auckland

echo ADMIN_EMAIL=${ADMIN_EMAIL}
echo APP_BUCKET=${APP_BUCKET}
echo APP_DOMAIN=${APP_DOMAIN}
echo APP_DOMAIN_CERT=${APP_DOMAIN_CERT}
# echo APP_DOMAIN_CERT_USEAST1=${APP_DOMAIN_CERT_USEAST1}
echo APP_BEANSTALK_CERT=${APP_BEANSTALK_CERT}
echo APP_HOSTED_ZONE=${APP_HOSTED_ZONE}
echo APP_HOSTED_ZONE_ID=${APP_HOSTED_ZONE_ID}
echo APP_NAME=${APP_NAME}
echo APP_SECRETS_ARN=${APP_SECRETS_ARN}
echo AWS_ACCOUNT_ID=${AWS_ACCOUNT_ID}
echo AWS_REGION=${AWS_REGION}
echo ECR_URL=${ECR_URL}
echo API_USER=${APP_NAME}
echo WEB_BUCKET=${WEB_BUCKET}
echo WEB_URL=${WEB_URL}
echo EC2_KEY_NAME=${EC2_KEY_NAME}
echo EC2_VPC=${EC2_VPC}
echo EC2_SECURITY_GROUP=${EC2_SECURITY_GROUP}
echo EC2_SUBNET_A=${EC2_SUBNET_A}
echo EC2_SUBNET_B=${EC2_SUBNET_B}
echo EC2_SUBNET_C=${EC2_SUBNET_C}
echo TZ=${TZ}
