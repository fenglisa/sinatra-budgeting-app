class UsersController < ApplicationController

  # GET: /users
  get "/" do
    erb :"/index"
  end

  # GET: /users/new
  get "/signup" do
    erb :"/users/new"
  end

  get "/login" do
    erb :"/users/login"
  end

  # POST: /users
  post "/users" do
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/users/:id'
    end
    redirect '/login'
  end

  # GET: /users/5
  get "/users/:id" do
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
