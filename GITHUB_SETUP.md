# GitHub Setup Instructions

This guide will help you push your MIDE Summit landing page to GitHub using the GitHub API.

## Prerequisites

1. A GitHub account
2. A GitHub Personal Access Token (PAT)

## Step 1: Create GitHub Personal Access Token

### Where to Create:
1. Go to https://github.com/settings/tokens
2. Click **"Generate new token"** → **"Tokens (classic)"**
3. Give it a name: `MIDE Summit CLI`
4. Set expiration: 90 days (or your preference)

### Required Permissions (Scopes):
Check these boxes:
- ✅ `repo` (Full control of private repositories)
- ✅ `workflow` (Update GitHub Actions workflows - optional)

### Generate Token:
1. Click **"Generate token"**
2. **COPY the token immediately** (you won't see it again!)
3. Keep it safe

## Step 2: Configure .env File

Open `.env` in your project and update:

```bash
GITHUB_TOKEN=ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxx
GITHUB_USERNAME=your_github_username
REPO_NAME=mide-summit-landing
```

**Example:**
```bash
GITHUB_TOKEN=ghp_1a2b3c4d5e6f7g8h9i0j1k2l3m4n5o6p
GITHUB_USERNAME=john_doe
REPO_NAME=mide-summit-landing
```

## Step 3: Run the Setup Script

From your project directory, run:

```bash
./setup-github.sh
```

### What the Script Does:
1. ✅ Validates your GitHub credentials
2. ✅ Creates a new repository on GitHub via API
3. ✅ Initializes git locally
4. ✅ Creates a `.gitignore` file
5. ✅ Adds the remote repository
6. ✅ Stages all files
7. ✅ Creates initial commit
8. ✅ Pushes code to GitHub

## Expected Output

```
📝 GitHub Configuration:
   Username: john_doe
   Repository: mide-summit-landing

🔄 Creating GitHub repository...
✅ Repository created successfully!
   Repository URL: https://github.com/john_doe/mide-summit-landing.git

🔄 Initializing git repository...
✅ Git repository initialized

🔄 Creating .gitignore...
✅ .gitignore created

🔄 Adding git remote...
✅ Remote added

🔄 Staging files...
✅ Files staged

🔄 Creating initial commit...
✅ Initial commit created

🔄 Pushing to GitHub...
✅ All done! Your code has been pushed to GitHub!

📍 Repository: https://github.com/john_doe/mide-summit-landing

Next steps:
1. Visit your repository: https://github.com/john_doe/mide-summit-landing
2. You can now clone it with: git clone https://github.com/john_doe/mide-summit-landing.git
3. Make future commits with: git push origin main
```

## Troubleshooting

### Error: "GITHUB_TOKEN not set"
- Make sure `.env` file exists
- Replace `your_github_api_token_here` with your actual token

### Error: "Repository already exists"
- The repository name is already taken
- Change `REPO_NAME` in `.env` to a unique name

### Error: "Invalid token"
- Your GitHub token may be expired
- Create a new token at https://github.com/settings/tokens

### Error: "401 Unauthorized"
- Check that your token has the correct permissions
- Verify the token hasn't been revoked

## Future Commits

After the initial setup, you can make changes and push them:

```bash
# Make changes to files
git add .
git commit -m "Your commit message"
git push origin main
```

## Security Notes

⚠️ **IMPORTANT:**
- Never commit `.env` to git (it's in `.gitignore`)
- Never share your GITHUB_TOKEN
- Tokens have expiration dates - check periodically
- If you suspect a token is compromised, delete it immediately

## What Gets Committed

The following files will be pushed to GitHub:
- `index.html` - Main landing page
- `docs/superpowers/specs/` - Design specifications
- `docs/superpowers/plans/` - Implementation plans
- `.gitignore` - Git ignore file
- `GITHUB_SETUP.md` - This file
- `.env` - **NOT COMMITTED** (in .gitignore)

## Questions?

If you encounter issues:
1. Check your token has correct permissions
2. Verify your GitHub username is correct
3. Ensure `.env` file is in the project root
4. Check GitHub API status: https://www.githubstatus.com/
