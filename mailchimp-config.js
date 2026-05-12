// Mailchimp Configuration
// This file is auto-populated by the setup script
// DO NOT manually edit - run ./mailchimp-setup.sh instead

const MAILCHIMP_CONFIG = {
    API_KEY: 'your_mailchimp_api_key_here',
    LIST_ID: 'your_mailchimp_list_id_here',
    SERVER: 'us1',
    ENABLED: false
};

// Helper function to validate configuration
function isMailchimpConfigured() {
    return MAILCHIMP_CONFIG.ENABLED &&
        MAILCHIMP_CONFIG.API_KEY !== 'your_mailchimp_api_key_here' &&
        MAILCHIMP_CONFIG.LIST_ID !== 'your_mailchimp_list_id_here';
}
