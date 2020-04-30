require 'rack-flash'

class ApplicationController < ActionController::Base

    use Rack::Flash

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, 'secure_password'
    end
end