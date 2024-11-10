#!/bin/bash

set -eu

# Step 1: Clone the git repo in the current directory
echo "Cloning the repository..."
git clone https://github.com/iloveitaly/python-package-template.git
shopt -s dotglob
mv python-package-template/* .
shopt -u dotglob

# If the current directory is empty outside of hidden files, use the base name of the folder
if [ -z "$(ls -A | grep -v '^\..*')" ]; then
  project_name=$(basename "$PWD")
else
  # Step 2: Ask for the project name
  read -p "Enter the project name: " project_name </dev/tty
fi

# Step 3: Generate package_name and file_system_package_name
package_name=$project_name
file_system_package_name=$(echo "$project_name" | tr '-' '_')

# Step 4: Find and replace all instances of python-package-template with $package_name
echo "Replacing instances of 'python-package-template' with '$package_name'..."
grep -rl 'python-package-template' . | xargs sed -i '' "s/python-package-template/$package_name/g"

# Step 5: Rename python_package_template to $file_system_package_name
echo "Renaming 'python_package_template' to '$file_system_package_name'..."
mv python_package_template "$file_system_package_name"

# Step 6: Attempt to get the user's email from git config
user_email=$(git config --global user.email)

# If not found in git config, ask for the user's email
if [ -z "$user_email" ]; then
  read -p "Enter your email: " user_email </dev/tty
fi

# Step 7: Replace all instances of 'your@email.com' with $user_email
echo "Replacing instances of 'your@email.com' with '$user_email'..."
grep -rl 'your@email.com' . | xargs sed -i '' "s/your@email.com/$user_email/g"

# Step 9: Replace all instances of 'github-username' with $github_username
# Attempt to get GitHub username from git config
github_username=$(git config --global github.user)

# If not found in git config, ask for the GitHub username
if [ -z "$github_username" ]; then
  read -p "Enter your GitHub username: " github_username </dev/tty
fi

echo "Replacing instances of 'github-username' with '$github_username'..."
grep -rl 'github-username' . | xargs sed -i '' "s/github-username/$github_username/g"

# Step 10: Attempt to get the user's full name from git config
full_name=$(git config --global user.name)

# If not found in git config, ask for the user's full name
if [ -z "$full_name" ]; then
  read -p "Enter your full name: " full_name </dev/tty
fi

# Step 11: Replace all instances of 'Your Name' with $full_name
echo "Replacing instances of 'Your Name' with '$full_name'..."
grep -rl 'Your Name' . | xargs sed -i '' "s/Your Name/$full_name/g"

rm setup.sh
rm README.md
touch README.md

rm -rf .git
git init .
git add .
git commit -m "initial commit"

echo "Setup complete."
