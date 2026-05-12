# Mide Summit Event Landing Page Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a static HTML landing page to promote the Mide Summit Event and capture leads via a sign-up form.

**Architecture:** Single index.html file with semantic HTML structure containing event promotion content at the top and a lead capture form at the bottom. No CSS, no JavaScript, no form submission logic.

**Tech Stack:** HTML5, Python HTTP server (for localhost serving)

---

## File Structure

```
/Users/igorostiza/vibeoding-lab/
├── index.html              (Main landing page - single file)
├── docs/
│   └── superpowers/
│       ├── specs/
│       │   └── 2026-05-12-mide-summit-landing-page-design.md
│       └── plans/
│           └── 2026-05-12-mide-summit-landing-page.md
└── .gitignore              (if git repo)
```

---

## Task 1: Create HTML file with semantic structure

**Files:**
- Create: `index.html`

- [ ] **Step 1: Create the index.html file with basic HTML5 structure**

Create `/Users/igorostiza/vibeoding-lab/index.html` with the following content:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mide Summit Event</title>
</head>
<body>
    <header>
        <h1>Mide Summit Event</h1>
        <p>Join us for an unforgettable experience at the Mide Summit</p>
    </header>

    <main>
        <section id="event-details">
            <h2>Event Details</h2>
            
            <section id="date-time">
                <h3>Date & Time</h3>
                <p>June 15-17, 2026 | 9:00 AM - 5:00 PM</p>
            </section>

            <section id="location">
                <h3>Location</h3>
                <p>Convention Center, Downtown - Main Hall A & B</p>
            </section>

            <section id="description">
                <h3>About the Event</h3>
                <p>The Mide Summit is the premier industry event bringing together leaders, innovators, and professionals from across the region. This year's summit focuses on emerging technologies, strategic partnerships, and industry best practices.</p>
                <p>Whether you're looking to network, learn, or showcase your expertise, the Mide Summit offers unparalleled opportunities for growth and collaboration.</p>
            </section>

            <section id="benefits">
                <h3>Why Attend</h3>
                <ul>
                    <li>Network with industry leaders and professionals</li>
                    <li>Learn from keynote speakers and expert panels</li>
                    <li>Discover the latest innovations and trends</li>
                    <li>Participate in interactive workshops</li>
                    <li>Build valuable business connections</li>
                </ul>
            </section>
        </section>

        <section id="signup">
            <h2>Sign Up for Updates</h2>
            <p>Don't miss out! Register below to receive event updates and exclusive information.</p>
            
            <form id="lead-form">
                <div>
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" required>
                </div>

                <div>
                    <label for="surname">Surname:</label>
                    <input type="text" id="surname" name="surname" required>
                </div>

                <div>
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>

                <div>
                    <label for="country">Country:</label>
                    <input type="text" id="country" name="country" required>
                </div>

                <button type="submit">Sign Up</button>
            </form>
        </section>
    </main>

    <footer>
        <p>&copy; 2026 Mide Summit. All rights reserved.</p>
    </footer>
</body>
</html>
```

- [ ] **Step 2: Verify the HTML file exists and contains proper structure**

Run: `cat /Users/igorostiza/vibeoding-lab/index.html | head -20`

Expected: First 20 lines of the HTML file showing `<!DOCTYPE html>` through the opening of the head section.

---

## Task 2: Start a local HTTP server to serve the page

**Files:**
- No files created (server setup only)

- [ ] **Step 1: Navigate to the project directory and start Python HTTP server**

Run from `/Users/igorostiza/vibeoding-lab`:

```bash
cd /Users/igorostiza/vibeoding-lab && python3 -m http.server 8000
```

Expected output:
```
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
```

- [ ] **Step 2: Verify the server is running by accessing the page in browser**

Open in browser: `http://localhost:8000`

Expected: Landing page loads with:
- Header: "Mide Summit Event" title and tagline
- Event Details section with Date & Time, Location, Description, and Benefits
- Sign Up section with form fields (Name, Surname, Email, Country)
- Submit button
- Footer

- [ ] **Step 3: Verify form is functional (static, no submission)**

Interact with form in browser:
- Click in each field and verify you can type
- Click the Submit button
- Expected: Form action is empty (no submission), page remains on localhost:8000
- Check browser console (F12) - no JavaScript errors

---

## Summary

✅ Static HTML landing page created with semantic structure  
✅ Event information content included (date, location, description, benefits)  
✅ Lead capture form with 4 required fields (Name, Surname, Email, Country)  
✅ Page served locally on http://localhost:8000  
✅ Form is functional but does not submit anywhere (static HTML only)

The landing page is complete and accessible at `http://localhost:8000`.
