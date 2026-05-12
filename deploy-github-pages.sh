#!/bin/bash

# GitHub Pages Deployment Script
# Enables GitHub Pages for your repository

set -e

# Load environment variables from .env file
if [ ! -f .env ]; then
    echo "❌ Error: .env file not found!"
    exit 1
fi

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

echo "🚀 Deploying to GitHub Pages..."
echo ""
echo "📝 Configuration:"
echo "   Username: $GITHUB_USERNAME"
echo "   Repository: $REPO_NAME"
echo ""

# Enable GitHub Pages
echo "🔄 Enabling GitHub Pages..."

PAGES_RESPONSE=$(curl -s -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  "https://api.github.com/repos/$GITHUB_USERNAME/$REPO_NAME/pages" \
  -d "{
    \"source\": {
      \"branch\": \"main\",
      \"path\": \"/\"
    }
  }")

# Check response
if echo "$PAGES_RESPONSE" | grep -q "\"url\""; then
    echo "✅ GitHub Pages enabled successfully!"

    # Extract the pages URL
    PAGES_URL=$(echo "$PAGES_RESPONSE" | grep -o '"url":"[^"]*' | cut -d'"' -f4)

    echo ""
    echo "✨ Your site is now live!"
    echo ""
    echo "📍 GitHub Pages URL:"
    echo "   https://$GITHUB_USERNAME.github.io/$REPO_NAME/"
    echo ""
    echo "📍 API Response:"
    echo "   $PAGES_URL"
    echo ""

elif echo "$PAGES_RESPONSE" | grep -q "Conflict"; then
    echo "✅ GitHub Pages is already enabled!"
    echo ""
    echo "📍 Your site URL:"
    echo "   https://$GITHUB_USERNAME.github.io/$REPO_NAME/"
    echo ""
    echo "Note: It may take a few minutes for changes to appear."

else
    echo "❌ Failed to enable GitHub Pages. Response:"
    echo "$PAGES_RESPONSE"
    exit 1
fi

echo ""
echo "🎉 Deployment complete!"
echo ""
echo "Next steps:"
echo "1. Wait 1-2 minutes for GitHub Pages to deploy"
echo "2. Visit: https://$GITHUB_USERNAME.github.io/$REPO_NAME/"
echo "3. Your landing page will be live!"
echo ""
echo "💡 Tips:"
echo "   - If you see 404, wait a moment and refresh"
echo "   - Check deployment status in GitHub: Settings → Pages"
echo "   - Any push to main will auto-deploy updates"
