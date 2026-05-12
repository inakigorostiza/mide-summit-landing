#!/bin/bash

# Mailchimp Audience Setup Script
# Creates a Mailchimp audience for MIDE Summit event with required fields

set -e

# Load environment variables
if [ ! -f .env ]; then
    echo "❌ Error: .env file not found!"
    exit 1
fi

export $(cat .env | grep -v '#' | xargs)

# Validate Mailchimp API key
if [ -z "$MAILCHIMP_API_KEY" ] || [ "$MAILCHIMP_API_KEY" = "your_mailchimp_api_key_here" ]; then
    echo "❌ Error: MAILCHIMP_API_KEY not set in .env file"
    echo ""
    echo "Get your API key:"
    echo "1. Go to https://mailchimp.com/account/api/"
    echo "2. Click 'Create A Key'"
    echo "3. Copy the API key"
    echo "4. Update .env: MAILCHIMP_API_KEY=your_key_here"
    echo "5. The server part (us1, us2, etc.) is after the last dash in your key"
    echo ""
    exit 1
fi

# Extract server from API key if not set
if [ "$MAILCHIMP_SERVER" = "us1" ]; then
    # Try to extract from API key (format: xxxxx-us1)
    MAILCHIMP_SERVER=$(echo "$MAILCHIMP_API_KEY" | grep -oE '[a-z]+[0-9]+$' || echo "us1")
fi

echo "📧 Setting up Mailchimp Audience..."
echo ""
echo "Configuration:"
echo "  API Key: ${MAILCHIMP_API_KEY:0:10}...${MAILCHIMP_API_KEY: -4}"
echo "  Server: $MAILCHIMP_SERVER"
echo ""

# Create audience via Mailchimp API
echo "🔄 Creating Mailchimp audience 'MIDE Summit 2026'..."

CREATE_RESPONSE=$(curl -s -X POST \
  -u "anystring:$MAILCHIMP_API_KEY" \
  "https://$MAILCHIMP_SERVER.api.mailchimp.com/3.0/lists" \
  -d "{
    \"name\": \"MIDE Summit 2026 - Event Registrations\",
    \"contact\": {
      \"company\": \"MIDE\",
      \"address1\": \"Calle Juan de Mariana 15\",
      \"city\": \"Madrid\",
      \"state\": \"Madrid\",
      \"zip\": \"28005\",
      \"country\": \"ES\"
    },
    \"permission_reminder\": \"You registered for MIDE Summit 2026 SEO Event\",
    \"campaign_defaults\": {
      \"from_name\": \"MIDE Summit\",
      \"from_email\": \"summit@mide.com\",
      \"subject\": \"Welcome to MIDE Summit 2026\",
      \"language\": \"es\"
    },
    \"email_type_option\": false
  }"
)

# Extract list ID from response
LIST_ID=$(echo "$CREATE_RESPONSE" | grep -o '"id":"[^"]*' | head -1 | cut -d'"' -f4)

if [ -z "$LIST_ID" ]; then
    # Check if error is "already exists" for this list
    if echo "$CREATE_RESPONSE" | grep -q "already exists"; then
        echo "⚠️  Audience already exists"
        echo "Using existing audience ID from previous setup..."
        # Try to find existing list
        LIST_ID=$(curl -s -u "anystring:$MAILCHIMP_API_KEY" \
          "https://$MAILCHIMP_SERVER.api.mailchimp.com/3.0/lists?fields=lists.id,lists.name" | \
          grep -o '"id":"[^"]*' | head -1 | cut -d'"' -f4)
    else
        echo "❌ Failed to create audience. Response:"
        echo "$CREATE_RESPONSE"
        exit 1
    fi
fi

if [ -z "$LIST_ID" ]; then
    echo "❌ Could not get audience ID. Please check your API key and try again."
    exit 1
fi

echo "✅ Audience created successfully!"
echo "   List ID: $LIST_ID"
echo ""

# Add merge fields (custom fields)
echo "🔄 Adding merge fields (Name, Surname, Country)..."

# Name field
curl -s -X POST \
  -u "anystring:$MAILCHIMP_API_KEY" \
  "https://$MAILCHIMP_SERVER.api.mailchimp.com/3.0/lists/$LIST_ID/merge-fields" \
  -d "{
    \"name\": \"First Name\",
    \"tag\": \"FNAME\",
    \"type\": \"text\",
    \"required\": true
  }" > /dev/null

# Surname field
curl -s -X POST \
  -u "anystring:$MAILCHIMP_API_KEY" \
  "https://$MAILCHIMP_SERVER.api.mailchimp.com/3.0/lists/$LIST_ID/merge-fields" \
  -d "{
    \"name\": \"Last Name\",
    \"tag\": \"LNAME\",
    \"type\": \"text\",
    \"required\": true
  }" > /dev/null

# Country field
curl -s -X POST \
  -u "anystring:$MAILCHIMP_API_KEY" \
  "https://$MAILCHIMP_SERVER.api.mailchimp.com/3.0/lists/$LIST_ID/merge-fields" \
  -d "{
    \"name\": \"Country\",
    \"tag\": \"COUNTRY\",
    \"type\": \"text\",
    \"required\": true
  }" > /dev/null

echo "✅ Merge fields created successfully!"
echo "   - FNAME (First Name)"
echo "   - LNAME (Last Name)"
echo "   - COUNTRY (Country)"
echo ""

# Update .env with the LIST_ID
echo "🔄 Updating .env file with Mailchimp List ID..."
sed -i '' "s/MAILCHIMP_LIST_ID=.*/MAILCHIMP_LIST_ID=$LIST_ID/" .env
echo "✅ .env updated!"
echo ""

# Update mailchimp-config.js with credentials
echo "🔄 Updating mailchimp-config.js with API credentials..."
sed -i '' "s|API_KEY: '.*'|API_KEY: '$MAILCHIMP_API_KEY'|" mailchimp-config.js
sed -i '' "s|LIST_ID: '.*'|LIST_ID: '$LIST_ID'|" mailchimp-config.js
sed -i '' "s|SERVER: '.*'|SERVER: '$MAILCHIMP_SERVER'|" mailchimp-config.js
sed -i '' "s|ENABLED: false|ENABLED: true|" mailchimp-config.js
echo "✅ mailchimp-config.js updated!"
echo ""

echo "✨ Mailchimp setup complete!"
echo ""
echo "📋 Your Audience Details:"
echo "   List ID: $LIST_ID"
echo "   API Key: ${MAILCHIMP_API_KEY:0:10}...${MAILCHIMP_API_KEY: -4}"
echo "   Server: $MAILCHIMP_SERVER"
echo ""
echo "📍 Next Steps:"
echo "1. Update index.html with MAILCHIMP_API_KEY and MAILCHIMP_LIST_ID"
echo "2. The form will now submit to Mailchimp automatically"
echo "3. View subscribers at: https://mailchimp.com/lists/$LIST_ID"
echo ""
echo "💡 To view your audience in Mailchimp:"
echo "   https://mailchimp.com/account/lists/"
