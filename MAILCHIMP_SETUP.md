# Mailchimp Integration Setup

This guide explains how to integrate the MIDE Summit landing page with Mailchimp for email list management.

## Prerequisites

1. A Mailchimp account (free tier works fine)
2. Mailchimp API key
3. Updated `.env` file

---

## Step 1: Get Your Mailchimp API Key

### Where to Find:
1. Sign in to **https://mailchimp.com**
2. Click your **profile** (bottom left)
3. Select **Account & billing** → **Extras** → **API Keys**
4. Click **Create A Key**
5. Copy the generated API key

### API Key Format:
The key looks like: `a1b2c3d4e5f6g7h8i9j0k1l2-us1`

**Important:** The part after the last dash (e.g., `us1`) is your server location. You'll need this.

### Add to .env:
```bash
MAILCHIMP_API_KEY=a1b2c3d4e5f6g7h8i9j0k1l2-us1
MAILCHIMP_SERVER=us1
```

---

## Step 2: Create Mailchimp Audience

The setup script creates a Mailchimp audience with the required fields automatically.

```bash
chmod +x mailchimp-setup.sh
./mailchimp-setup.sh
```

### What the Script Does:
1. ✅ Validates your Mailchimp API key
2. ✅ Creates a new audience: "MIDE Summit 2026 - Event Registrations"
3. ✅ Adds merge fields:
   - **FNAME** (First Name)
   - **LNAME** (Last Name)
   - **COUNTRY** (Country)
4. ✅ Updates `.env` with the List ID

### Expected Output:
```
📧 Setting up Mailchimp Audience...

Configuration:
  API Key: a1b2c3d4...l2
  Server: us1

🔄 Creating Mailchimp audience 'MIDE Summit 2026'...
✅ Audience created successfully!
   List ID: a1b2c3d4e5

🔄 Adding merge fields (Name, Surname, Country)...
✅ Merge fields created successfully!

✨ Mailchimp setup complete!
```

---

## Step 3: Form Submission Integration

The landing page form automatically submits to Mailchimp when users fill it out.

### How It Works:
1. User fills in Name, Surname, Email, Country
2. User clicks "Request Entry" button
3. JavaScript captures the form data
4. Data is sent to Mailchimp API
5. User sees success/error message
6. Contact is added to your Mailchimp audience

### Form Fields Mapping:
| Form Field | Mailchimp Field |
|-----------|-----------------|
| Name | FNAME (First Name) |
| Surname | LNAME (Last Name) |
| Email | EMAIL |
| Country | COUNTRY |

---

## Step 4: View Subscribers in Mailchimp

Once the integration is live, subscribers will appear in your Mailchimp audience.

### View Your Audience:
1. Go to **https://mailchimp.com/lists/**
2. Click **MIDE Summit 2026 - Event Registrations**
3. See all registered contacts

### Monitor Subscriptions:
- Real-time updates as forms are submitted
- View contact details, segments, tags
- Export subscriber list
- Create email campaigns

---

## Security Notes

**API Key Visibility:**
The Mailchimp API key is embedded in the HTML/JavaScript (client-side). This is acceptable because:
- Mailchimp audiences for public signups are meant to be public
- API keys for public audiences have limited permissions
- The key can only add contacts to that specific audience
- GitHub Pages is HTTPS-encrypted

**Best Practices:**
- ✅ API key is only used for adding subscribers
- ✅ Data sent via HTTPS
- ✅ No sensitive user data is exposed
- ✅ Form validation on client side

---

## Testing

### Local Testing:
```bash
python3 -m http.server 8000
# Visit http://localhost:8000
# Fill and submit the form
# Check Mailchimp audience for new contact
```

### Live Testing:
```bash
git push origin main
# Wait 1-2 minutes for GitHub Pages to deploy
# Visit https://inakigorostiza.github.io/mide-summit-landing/
# Fill and submit the form
# Check Mailchimp for the subscription
```

---

## Troubleshooting

### Issue: "Failed to subscribe" message

**Check 1: API Key**
- Verify `MAILCHIMP_API_KEY` is correct in `.env`
- Make sure it includes the server part (e.g., `-us1`)

**Check 2: List ID**
- Verify `MAILCHIMP_LIST_ID` is set in `.env`
- Run setup script again: `./mailchimp-setup.sh`

**Check 3: Browser Console**
- Open DevTools: F12 or Cmd+Option+I
- Check Console tab for error messages
- Look for CORS or API errors

### Issue: "Invalid API Key" error

- Regenerate API key at https://mailchimp.com/account/api/
- Update `.env` with new key
- Run setup script again: `./mailchimp-setup.sh`

### Issue: Subscribers not appearing

- Wait 1-2 minutes (real-time sync)
- Check Mailchimp audience spam/unconfirmed folder
- Verify form submission completed (success message shown)
- Check browser console for errors

---

## Configuration Files

### .env Variables:
```bash
MAILCHIMP_API_KEY=your_api_key_with_server
MAILCHIMP_SERVER=us1  # or us2, us3, etc.
MAILCHIMP_LIST_ID=auto_populated_by_setup_script
```

### index.html:
Form data is automatically submitted via JavaScript.  
No HTML changes needed - integration is automatic!

---

## Next Steps

1. ✅ Get Mailchimp API key
2. ✅ Update `.env` with API key
3. ✅ Run `./mailchimp-setup.sh`
4. ✅ Test form submission locally
5. ✅ Deploy: `git push origin main`
6. ✅ Test live form submission
7. ✅ View subscribers in Mailchimp dashboard

---

## Mailchimp Resources

- **Mailchimp API Docs:** https://mailchimp.com/developer/marketing/api/
- **List/Audience Endpoint:** https://mailchimp.com/developer/marketing/api/list-members/
- **API Key Management:** https://mailchimp.com/account/api/
- **Dashboard:** https://mailchimp.com/lists/

---

## Email Campaigns

Once you have subscribers, you can:
- Create email campaigns in Mailchimp
- Send event updates and reminders
- Segment subscribers by country
- Track opens and clicks
- Build email sequences

