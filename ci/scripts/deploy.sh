#!/bin/bash

echo "Deploying app"

ssh-add "$SSH_KEY_PATH"

ssh -o "StrictHostKeyChecking no" "$SSH_USER@$SSH_IP" docker pull sunlib/wonderchat:latest
ssh -o "StrictHostKeyChecking no" "$SSH_USER@$SSH_IP" docker stop wonderchat
ssh -o "StrictHostKeyChecking no" "$SSH_USER@$SSH_IP" docker rm wonderchat
ssh -o "StrictHostKeyChecking no" "$SSH_USER@$SSH_IP" docker run --name wonderchat -d -p 80:3000 sunlib/wonderchat:latest deploy/bin/start-node

echo "Finished deploying app"
