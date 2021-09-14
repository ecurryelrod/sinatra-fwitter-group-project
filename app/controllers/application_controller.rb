require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "d5b08b5689ee04a7c1f7d651f73cce129badfe2b960364ce59e6d4a16d86e7b83407563a1d8c43efe2cc17ad1e96b74d8d6d8dc230f1a613da09cd636e0904f9"
  end

  get '/' do 
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user # !! returns truthy or falsey value specifically
    end

    def current_user
      # binding.pry
      # ||= sets value of variable on the left side to the value listed on the right side unless the variable on the left already has a value, then that value will stay the same and not get over ridden by what's to the right of the ||= operator
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end
end
