#!/bin/bash

# =========================================
# Check for branch name
# =========================================
if [[ -z "$1" ]]; then
  echo "ERROR: Branch name required"
  exit 1
fi

branch_name=$1
echo "Branch:" . $branch_name

# =========================================
# Get www directory
# =========================================
doc_root=$(grep "^DocumentRoot" -m 1 /etc/httpd/conf/httpd.conf)

doc_path=$(echo $doc_root | cut -c 15- | head --bytes -2)
echo "Doc Root:" . $doc_path

# =========================================
# Change to docroot path
# =========================================
original_path=$(echo `pwd`)
cd $doc_path

# =========================================
# Create new git branch
# =========================================
git checkout -b $branch_name
git push origin $branch_name
git add uploads/*
git commit -a -m "new files for $branch_name"
git push -u origin $branch_name

# =========================================
# Change to original path
# =========================================
cd $original_path

