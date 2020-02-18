#!/bin/bash
set -e

echo "*******************************"
aws --version
sam --version
python3 -V
pip3 -V
echo "Node $(node -v)"
echo "npm $(npm -v)"
echo "*******************************"

exec "$@"