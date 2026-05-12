#!/bin/bash

# Check GitHub Pages Deployment Status

export $(cat .env | grep -v '#' | xargs)

echo "🔍 Checking GitHub Pages deployment status..."
echo ""

STATUS=$(curl -s -H "Authorization: token $GITHUB_TOKEN" \
  "https://api.github.com/repos/$GITHUB_USERNAME/$REPO_NAME/pages" | grep -o '"status":"[^"]*' | cut -d'"' -f4)

echo "Repository: $GITHUB_USERNAME/$REPO_NAME"
echo "Status: $STATUS"
echo ""

case $STATUS in
  "building")
    echo "⏳ GitHub Pages is still building..."
    echo "   Try again in 1-2 minutes"
    echo ""
    echo "   Visit: https://$GITHUB_USERNAME.github.io/$REPO_NAME/"
    ;;
  "built")
    echo "✅ GitHub Pages is ready!"
    echo ""
    echo "📍 Your site is live at:"
    echo "   https://$GITHUB_USERNAME.github.io/$REPO_NAME/"
    echo ""
    echo "Open it in your browser now!"
    ;;
  *)
    echo "Status: $STATUS"
    ;;
esac
