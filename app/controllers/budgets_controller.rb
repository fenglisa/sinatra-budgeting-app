class BudgetsController < ApplicationController

  # GET: /budgets
  get "/budgets" do
    @budgets = current_user.budgets
    #binding.pry
    erb :"/budgets/index.html"
  end

  # GET: /budgets/new
  get "/budgets/new" do
    erb :'/budgets/new'
  end

  # POST: /budgets
  post "/budgets" do
    if params[:name] == ""
      @error = "Please specify an expense"
      erb :'/budgets/new'
    else
      @budget = current_user.budgets.build(params)
      if @budget.save
        redirect "/budgets"
      else
        @error = @budget.errors.full_messages.first
        erb :'/budgets/new'
      end
    end
  end

  # GET: /budgets/5
  #get "/budgets/:id" do
  #  erb :"/budgets/show.html"
  #end

  # GET: /budgets/5/edit
  get "/budgets/:id/edit" do
    @budget = current_user.budgets.find_by_id(params[:id])
    erb :"/budgets/edit"
  end

  # PATCH: /budgets/5
  patch "/budgets/:id" do
    @budget = current_user.budgets.find_by_id(params[:id])
    params.delete(:_method)
    if @budget.update!(params)
      redirect "/budgets"
    else
      @error = @budget.errors.full_messages.first
      erb :"/budgets/edit"
    end
  end

  # DELETE: /budgets/5/delete
  delete "/budgets/:id/delete" do
    redirect "/budgets"
  end
end
