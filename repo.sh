#!/bin/bash

# create a GitHub repo and a local git repo
#   and connect them together

# make the directory and cd into it
mkdir $1
cd $1

# create the local repo                                                          
git init --initial-branch=main                                                   
# then the remote                                                                
gh repo create $1  --public --gitignore $2  --license "unlicense" --confirm
git pull origin main

# create README.md
touch README.md
echo "# $1" >> README.md

# add the GitHub Action for Linting
mkdir -p .github/workflows
cd .github/workflows
echo $2
if [ $2 = "Swift" ]
then
  cp ~/scripts/swift.yml ./swift.yml
  cd ../..
  echo "[![SwiftLint](https://github.com/mr-coxall/$1/workflows/SwiftLint/badge.svg)](https://github.com/mr-coxall/$1/actions)" >> ./README.md
  git add .github/workflows/swift.yml
else
  cp ~/scripts/main.yml ./main.yml
  cd ../..
  echo "[![GitHub's Super Linter](https://github.com/mr-coxall/$1/workflows/GitHub's%20Super%20Linter/badge.svg)](https://github.com/mr-coxall/$1/actions)" >> ./README.md
  git add .github/workflows/main.yml
fi

# update remote
git add *
git commit -m "init"
git push origin main