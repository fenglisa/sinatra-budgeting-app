# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
    ```
    class CreateUsers < ActiveRecord::Migration[5.2]
    ```
- [x] Include more than one model class (e.g. User, Post, Category)
    `User` `Budget` `Purchase`
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    ```
    class User < ActiveRecord::Base
      has_secure_password
      has_many :budgets
      has_many :purchases, through: :budgets
    end
    ```
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    ```
    class Purchase < ActiveRecord::Base
      belongs_to :budget
    end
    ```
- [x] Include user accounts with unique login attribute (username or email)
    ```
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
    ```
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    Create a new budget:
    ```
      get "/budgets/new"
      post "/budgets"
    ```
    Read a budget:
    ```
      get "/budgets"
      get "/budgets/:id"
    ```
    Update a budget:
    ```
      get "/budgets/:id/edit"
      patch "/budgets/:id"
    ```
    Delete a budget:
    ```
      delete "/budgets/:id"
    ```

- [x] Ensure that users can't modify content created by other users
    ```
    def current_user
      @user ||= User.find(session[:user_id ])
    end

    @budget = current_user.budgets.find_by_id(params[:id])
    ```
- [x] Include user input validations
    ```
      <input id = "username" type="text" name="username" pattern="[A-Za-z0-9^/s]{3,}" required>

      <input type="number" name="balance" id="budget_balance" required></input>
    ```
- [x] BONUS - not required - Display validation failures to user with error message
    ```
    post "/budgets" do
      if params[:name] == ""
        @error = "Please specify an expense"
        erb :'/budgets/new'
      elsif !unique_budget?
        @error = "This budget already exists"
        erb :'/budgets/new'
    ```
- [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
