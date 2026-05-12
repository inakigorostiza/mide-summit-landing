# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**MIDE Summit 2026 SEO Event Landing Page**

A professional static HTML landing page promoting the MIDE Summit 2026 SEO event in Madrid (May 19, 2026). The page features event details, speaker information, schedule, and a lead capture form. Styled to match the Mide360 company website design.

**Repository:** https://github.com/inakigorostiza/mide-summit-landing  
**Live Site:** https://inakigorostiza.github.io/mide-summit-landing/  
**Local Development:** http://localhost:8000

---

## Project Structure

```
mide-summit-landing/
├── index.html                          # Main landing page (947 lines, 30KB)
├── .env                                # GitHub API credentials (git-ignored)
├── .gitignore                          # Standard git ignore rules
│
├── docs/superpowers/
│   ├── specs/
│   │   └── 2026-05-12-mide-summit-landing-page-design.md
│   └── plans/
│       └── 2026-05-12-mide-summit-landing-page.md
│
├── setup-github.sh                     # Create repo & initial commit (via GitHub API)
├── deploy-github-pages.sh              # Enable GitHub Pages deployment
├── check-deploy-status.sh              # Monitor GitHub Pages build status
│
└── GITHUB_SETUP.md                     # GitHub API key setup instructions
```

---

## Key Technologies & Architecture

**Frontend:**
- Pure HTML5 with embedded CSS (no external dependencies)
- Responsive grid layouts (CSS Grid)
- No JavaScript required
- Static site (no server-side processing)

**Styling:**
- Gold/yellow accent color (#FFB800) matching MIDE branding
- Dark theme with professional color scheme
- Mobile-first responsive design
- Semantic HTML for accessibility

**Design System:**
The landing page includes these major sections:
1. **Navigation** - Sticky header with MIDE logo
2. **Hero** - Full-width hero with event title and CTA buttons
3. **Event Details** - 3-column card grid (date, location, price)
4. **Description** - Event overview in Spanish ("La nueva era del SEO")
5. **Benefits** - Grid of benefits/reasons to attend
6. **Schedule** - Timeline of event program (7 sessions)
7. **Speakers** - 5-column grid of featured speakers
8. **Contact Form** - Lead capture (Name, Surname, Email, Country)
9. **Related Courses** - 3 course cards
10. **Footer** - Multi-column footer with navigation links

---

## Common Development Tasks

### Run Landing Page Locally
```bash
python3 -m http.server 8000
# Visit: http://localhost:8000
```

### Push Code to GitHub
```bash
git add .
git commit -m "Your commit message"
git push origin main
```

### Deploy to GitHub Pages
Changes automatically deploy when you push to `main` branch (typically 1-2 minutes).  
To manually enable or check status:
```bash
./deploy-github-pages.sh
./check-deploy-status.sh
```

### First-Time GitHub Setup (with API)
Configure `.env` with your GitHub Personal Access Token, then:
```bash
./setup-github.sh
```

---

## GitHub API Integration

**Environment Variables (.env):**
```bash
GITHUB_TOKEN=ghp_xxxxxx...          # Personal Access Token
GITHUB_USERNAME=your_username       # GitHub username
REPO_NAME=mide-summit-landing       # Repository name
```

The `.env` file is **git-ignored** for security. To set up:
1. Generate token at https://github.com/settings/tokens
2. Require scope: `repo` (full control of repositories)
3. Copy token to `.env` file
4. Run `./setup-github.sh` or `./deploy-github-pages.sh`

**Available Scripts:**
- `setup-github.sh` - Create repository, commit, and push via GitHub API
- `deploy-github-pages.sh` - Enable GitHub Pages from API
- `check-deploy-status.sh` - Check GitHub Pages build status

---

## Styling & Customization

### Color Scheme
- **Primary Accent:** #FFB800 (gold/yellow) - MIDE brand color
- **Dark Background:** #1a1a1a, #2d2d2d (navigation, footer)
- **Light Background:** #f8f9fa, #fff (content sections)
- **Text:** #333 (dark text), #aaa/#ccc (light text on dark)

### Responsive Breakpoints
- **Desktop:** Full layout with all features
- **Tablet (1024px):** Adjusted spacing, navigation adapts
- **Mobile (768px):** Single-column layouts, stacked grids, smaller fonts

### Typography
- **Font Stack:** System fonts (-apple-system, BlinkMacSystemFont, Segoe UI, Roboto)
- **Heading Sizes:** h1: 4.5rem (hero) → h4: 1.2rem (cards)
- **Line Height:** 1.5-1.9 for readability

### Modifying Content
Edit `index.html` directly:
- Event details (date, location, price) in hero section
- Speaker names/titles in speakers section
- Schedule times and sessions
- Form labels and placeholder text
- Footer links and company info

### Modifying Styles
All CSS is embedded in `<style>` tag within `index.html`. Key sections:
- Navigation styles (dark sticky header)
- Hero section (gradient background, sizing)
- Card layouts (detail cards, speaker cards, course cards)
- Form styling (inputs, buttons, focus states)
- Responsive media queries

---

## Event Details (Reference)

**Event:** MIDE Summit 2026 - SEO Edition  
**Date:** May 19, 2026  
**Time:** 10:00 AM - 6:00 PM  
**Location:** Talent Garden Spain Auditorium, Calle Juan de Mariana 15, Madrid  
**Price:** €100  
**Language:** Spanish (with English support)  

**Speakers:**
- Natzir Turrado Ruiz (SEO & CRO Consultant)
- Giannella Ligato (eCommerce SEO Expert)
- Fernando Maciá Domene (Founder, Human Level)
- Ana Belén Leiño (SEO Project Manager, LIN3S)
- David Villarrubia (Full Stack SEO Consultant)

---

## Deployment Pipeline

```
Local Development (localhost:8000)
    ↓
    git commit & git push origin main
    ↓
GitHub Repository (main branch)
    ↓
GitHub Pages Build (1-2 minutes)
    ↓
Live Site (inakigorostiza.github.io/mide-summit-landing/)
```

**Auto-Deploy:** Any push to `main` automatically triggers GitHub Pages rebuild. No manual deployment needed after initial setup.

---

## Making Changes

### Edit Content
1. Edit `index.html` (HTML content or CSS)
2. Test locally: `python3 -m http.server 8000`
3. Commit: `git add index.html && git commit -m "Update: [description]"`
4. Push: `git push origin main`
5. Wait 1-2 minutes for GitHub Pages to build
6. Changes live at: https://inakigorostiza.github.io/mide-summit-landing/

### Common Updates
- **Event date/time:** Find "May 19, 2026" in hero and details sections
- **Add speaker:** Copy a speaker-card div in #speakers section
- **Update benefits:** Add/edit `<li>` items in #benefits section
- **Modify colors:** Search CSS for #FFB800 (gold), #1a1a1a (dark), etc.

---

## Performance Notes

- **Single HTML file:** 30KB (947 lines)
- **No external dependencies:** All CSS inline, no JavaScript
- **Lighthouse friendly:** Semantic HTML, accessible, responsive
- **Load time:** Instant (static file, minimal CSS)
- **Caching:** GitHub Pages uses aggressive caching; hard refresh for instant updates

---

## Future Enhancements

Potential improvements (not currently implemented):
- Add speaker photos (currently using gradient placeholder avatars)
- Form submission handling (currently static, no backend)
- Email notifications for registrations
- Dynamic schedule/speaker updates
- Analytics tracking
- SEO meta tags optimization
- Internationalization (currently Spanish/English)

---

## Documentation Files

- `GITHUB_SETUP.md` - Step-by-step GitHub API token creation
- `docs/superpowers/specs/2026-05-12-mide-summit-landing-page-design.md` - Design specifications
- `docs/superpowers/plans/2026-05-12-mide-summit-landing-page.md` - Implementation plan
