class SessionsController < ApplicationController

  get "/login" do
    erb :"/sessions/new"
  end

  post '/sessions' do
     @user = User.find_by(username: params[:username])
     if @user &&  @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect '/users/home'
     else
       @error = "Username or Password is incorrect."
       erb :'sessions/new'
     end
  end

  delete '/sessions' do
     session.clear
     #session[:user_id] = nil
     redirect '/'
  end

end
