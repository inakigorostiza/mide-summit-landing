// Mailchimp Configuration Template
// For GitHub Pages: This file is committed and contains the List ID
// For Local Testing: Use mailchimp-config.js (git-ignored) with API key
//
// After running ./mailchimp-setup.sh, mailchimp-config.js will be created
// with your API key for local testing

const MAILCHIMP_CONFIG = {
    API_KEY: 'your_mailchimp_api_key_here',
    LIST_ID: 'b89b9eb62d',  // Update this with your List ID after setup
    SERVER: 'us1',
    ENABLED: false
};

// Helper function to validate configuration
function isMailchimpConfigured() {
    return MAILCHIMP_CONFIG.ENABLED &&
        MAILCHIMP_CONFIG.API_KEY !== 'your_mailchimp_api_key_here' &&
        MAILCHIMP_CONFIG.LIST_ID !== 'your_mailchimp_list_id_here';
}
