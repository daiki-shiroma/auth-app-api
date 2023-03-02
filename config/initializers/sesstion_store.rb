if Rails.env === 'production'
    Rails.application.config.session_store :cookie_store, key: '_auth-app-api', domain: 'auth-app-client.vercel.app'
else
    Rails.application.config.session_store :cookie_store, key: '_auth-app-api'
end