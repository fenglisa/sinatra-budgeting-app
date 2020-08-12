class UsersController < ApplicationController

  # GET: /users/new
  get "/signup" do
    erb :'/users/new'
  end

  # POST: /users
  post "/users" do
    @usernames = User.all.map{|u| u.username}
    if @usernames.include?(params[:username])
      @error = "Invalid username :("
      erb :'/users/new'
    else
      @user = User.new(params)
      if @user.save
        session[:user_id] = @user.id
        redirect '/users/home'
      else
        @error = @user.errors.full_messages.first
        erb :"/users/new"
      end
    end
  end

  get '/users/home' do
    redirect_if_logged_out
    @user = User.find_by_id(session[:user_id])
    erb :"/users/home"
  end

  # GET: /users/5/edit
  #get "/users/:id/edit" do
  #  erb :"/users/edit"
  #end

  # PATCH: /users/5
  #patch "/users/:id" do
  #  redirect "/users/:id"
  #end

  # DELETE: /users/5/delete
  #delete "/users/:id/delete" do
  #  @user = User.find_by_id(params[:id])
  #  @user.delete
  #  redirect "/users"
  #end
end
