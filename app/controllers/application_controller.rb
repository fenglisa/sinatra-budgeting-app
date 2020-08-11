require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "0dee2e0c0cabfcaae23cf7f86c5c66c0b1979f0bfe43fc293062f680b58297c27caebe42afb7a8be5998eb7c0138d12b232a60ccfd17975161f1dd627bef249e"
    set :views, 'app/views'
  end

  helpers do
    def signed_in?
      !!session[:user_id]
    end

    def current_user
      @user ||= User.find(session[:user_id ])
    end
  end

  get "/" do
    erb :index
  end

end
