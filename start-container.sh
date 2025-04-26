#/bin/bash

if [ -z "$1" ]; then
  echo "Must provide crowbar profile name. See 'crowbar profiles list'."
  exit
fi

AWS_PROFILE=$1
AWS_ACCESS_KEY_ID=$(crowbar creds ${AWS_PROFILE} -p  | jq -r '.AccessKeyId')
AWS_SECRET_ACCESS_KEY=$(crowbar creds ${AWS_PROFILE} -p  | jq -r '.SecretAccessKey')
AWS_SESSION_TOKEN=$(crowbar creds ${AWS_PROFILE} -p  | jq -r '.SessionToken')


docker run -it  \
--platform linux/amd64 \
-v /Users/jan.repalda/Documents/blackwidow/:/root/blackwidow/ \
-v /Users/jan.repalda/Documents/CHEF/:/root/CHEF/ \
-v /Users/jan.repalda/Documents/OPS/:/root/OPS/ \
-v /Users/jan.repalda/Documents/CLOUDOPS/:/root/CLOUDOPS/ \
-v /Users/jan.repalda/Documents/sre_tools/:/root/SRE_TOOLS/ \
-v /Users/jan.repalda/.illumio/:/root/.illumio/ \
-v /Users/jan.repalda/.ssh/:/root/.ssh \
-v /Users/jan.repalda/ilok/:/root/ilok \
-e AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
-e AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
-e AWS_SESSION_TOKEN="${AWS_SESSION_TOKEN}" \
-v /Users/jan.repalda/.gitconfig:/root/.gitconfig \
-v /Users/jan.repalda/.chef:/root/.chef \
-v /Users/jan.repalda/Documents/CHEF/data_bags:/var/chef/data_bags \
docker-chaos.ilabs.io/blackwidow/centos7-orc
# Use an official Ruby runtime as a parent image
#FROM ruby:2.5.0
# Install any needed packages specified in requirements.txt
#RUN bundle install%        
