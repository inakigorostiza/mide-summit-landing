# Mide Summit Event Landing Page Design

**Project:** Mide Summit Event Lead Capture Landing Page  
**Date:** 2026-05-12  
**Status:** Design Phase

## Overview

A static HTML landing page to promote the Mide Summit Event and capture lead information. The page will feature event details at the top to build interest, followed by a sign-up form to collect visitor information.

## Purpose

Lead capture for the Mide Summit Event. Users should learn about the event and opt-in to receive more information by submitting their contact details.

## Target Content

The page will include:
- **Event Title & Tagline** — Headline introducing the Mide Summit Event
- **Event Date & Time** — When the event occurs
- **Event Location** — Where the event takes place
- **Event Description** — What the event is about (context and purpose)
- **Benefits/Highlights** — Key reasons to attend (bulleted list)
- **Lead Capture Form** — Sign-up form with user details

## Page Structure

### Header Section
- Main headline: "Mide Summit Event"
- Brief tagline or subtitle explaining what the event is

### Event Information Sections
Organized logically with semantic HTML sections:
- Date & Time information
- Location information
- Event description (1-2 paragraphs)
- Benefits/Highlights (list format)

### Form Section
Single sign-up form with:
- **Field 1: Name** (text input)
- **Field 2: Surname** (text input)
- **Field 3: Email** (email input)
- **Field 4: Country** (text input)
- **Submit Button** — Labeled "Sign Up" or "Register"

Each field includes a clear label for accessibility.

## Technical Requirements

- **HTML Only** — No CSS styles or inline styling
- **Static** — No form submission handling or JavaScript
- **Semantic HTML** — Use proper semantic elements: `<header>`, `<section>`, `<form>`, `<input>`, etc.
- **Single File** — Create as `index.html` in project root
- **No Dependencies** — Pure HTML, no frameworks or external libraries

## Form Behavior

- Form does not submit anywhere (static HTML)
- No client-side validation
- No confirmation messages or redirects
- Simple, clean form layout

## Accessibility

- All form inputs have associated `<label>` elements
- Proper heading hierarchy with `<h1>`, `<h2>`, etc.
- Semantic HTML for screen readers
- Clear, descriptive text for all sections

## Scope

This is a **static HTML landing page only**. Out of scope:
- CSS styling or visual design
- Form submission or backend integration
- JavaScript functionality
- Responsive design or mobile optimization
- Analytics or tracking

These can be added in future iterations.

## Deliverable

Single `index.html` file with:
- Proper HTML5 structure
- Event information content
- Lead capture form
- Semantic, readable code
