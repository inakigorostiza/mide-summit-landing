#!/bin/bash

# GitHub API Setup Script
# This script creates a GitHub repository and pushes your code

set -e

# Load environment variables from .env file
if [ ! -f .env ]; then
    echo "❌ Error: .env file not found!"
    echo "Please create a .env file with GITHUB_TOKEN, GITHUB_USERNAME, and REPO_NAME"
    exit 1
fi

# Source the .env file
export $(cat .env | grep -v '#' | xargs)

# Validate required variables
if [ -z "$GITHUB_TOKEN" ] || [ "$GITHUB_TOKEN" = "your_github_api_token_here" ]; then
    echo "❌ Error: GITHUB_TOKEN not set in .env file"
    exit 1
fi

if [ -z "$GITHUB_USERNAME" ] || [ "$GITHUB_USERNAME" = "your_github_username_here" ]; then
    echo "❌ Error: GITHUB_USERNAME not set in .env file"
    exit 1
fi

if [ -z "$REPO_NAME" ]; then
    echo "❌ Error: REPO_NAME not set in .env file"
    exit 1
fi

echo "📝 GitHub Configuration:"
echo "   Username: $GITHUB_USERNAME"
echo "   Repository: $REPO_NAME"
echo ""

# Step 1: Create repository via GitHub API
echo "🔄 Creating GitHub repository..."

REPO_RESPONSE=$(curl -s -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/user/repos \
  -d "{
    \"name\": \"$REPO_NAME\",
    \"description\": \"MIDE Summit 2026 SEO Event Landing Page\",
    \"private\": false,
    \"auto_init\": false
  }")

# Check if repository was created successfully
if echo "$REPO_RESPONSE" | grep -q "\"id\""; then
    echo "✅ Repository created successfully!"
else
    echo "❌ Failed to create repository. Response:"
    echo "$REPO_RESPONSE"
    exit 1
fi

REPO_URL="https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
echo "   Repository URL: $REPO_URL"
echo ""

# Step 2: Initialize git if not already initialized
echo "🔄 Initializing git repository..."
if [ ! -d .git ]; then
    git init
    echo "✅ Git repository initialized"
else
    echo "✅ Git repository already exists"
fi

# Step 3: Configure git user (if not already configured)
if ! git config user.name > /dev/null 2>&1; then
    git config user.name "GitHub User"
    git config user.email "user@github.com"
fi

# Step 4: Create .gitignore
echo "🔄 Creating .gitignore..."
cat > .gitignore << 'GITIGNORE'
# Environment variables
.env
.env.local
.env.*.local

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Node (if used)
node_modules/
.npm
package-lock.json

# Python (if used)
__pycache__/
*.py[cod]
*.egg-info/
.venv/

# Build files
dist/
build/
*.log
GITIGNORE
echo "✅ .gitignore created"
echo ""

# Step 5: Add remote
echo "🔄 Adding git remote..."
if git remote get-url origin > /dev/null 2>&1; then
    git remote remove origin
fi
git remote add origin "https://$GITHUB_USERNAME:$GITHUB_TOKEN@github.com/$GITHUB_USERNAME/$REPO_NAME.git"
echo "✅ Remote added"
echo ""

# Step 6: Add all files
echo "🔄 Staging files..."
git add .
echo "✅ Files staged"
echo ""

# Step 7: Create initial commit
echo "🔄 Creating initial commit..."
git commit -m "Initial commit: MIDE Summit 2026 landing page

- Static HTML landing page with event details
- Professional styling matching Mide360 website design
- Responsive design for all devices
- Event schedule, speaker information, and contact form
- Dark theme with gold/yellow accents
- Full event details and program information"

echo "✅ Initial commit created"
echo ""

# Step 8: Push to GitHub
echo "🔄 Pushing to GitHub..."
git branch -M main
git push -u origin main

echo ""
echo "✅ All done! Your code has been pushed to GitHub!"
echo ""
echo "📍 Repository: $REPO_URL"
echo ""
echo "Next steps:"
echo "1. Visit your repository: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo "2. You can now clone it with: git clone $REPO_URL"
echo "3. Make future commits with: git push origin main"
