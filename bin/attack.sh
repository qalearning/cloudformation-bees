#!/bin/bash

AWS_PROFILE="--profile default"
NAME="BeesAttack"
KEYNAME="Boxstarter"

STACK_CREATE="aws ${AWS_PROFILE} cloudformation create-stack"
OPTIONS=" --disable-rollback  --capabilities CAPABILITY_IAM "
TEMPLATE_FILE=resources/bees.yaml

P="   ParameterKey=KeyName,ParameterValue=${KEYNAME}"
P="$P ParameterKey=BeesControllerInstanceType,ParameterValue=t2.micro"
P="$P ParameterKey=BeeCount,ParameterValue=1"

#P="$P ParameterKey=TotalConnections,ParameterValue=1"
#P="$P ParameterKey=ConcurrentConnections,ParameterValue=1"
#P="$P ParameterKey=RunTests,ParameterValue=false"

P="$P ParameterKey=Target2Sting,ParameterValue=${1}"

CMD="$STACK_CREATE $OPTIONS --stack-name ${NAME} --parameters ${P} --template-body file://${TEMPLATE_FILE}"
echo $CMD
$CMD
