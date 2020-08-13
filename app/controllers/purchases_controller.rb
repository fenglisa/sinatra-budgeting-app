class PurchasesController < ApplicationController

  # GET: /purchases
  #get "/purchases" do
  #  redirect_if_logged_out
  #  erb :"/purchases/index.html"
  #end

  # GET: /purchases/new
  get "/purchases/:budget_id/new" do
    redirect_if_logged_out
    @budget = current_user.budgets.find_by_id(params[:budget_id])
    erb :"/purchases/new"
  end

  # POST: /purchases
  post "/purchases/:budget_id" do
    @purchase = current_user.purchases.build(
      amount: params[:amount],
      budget_id: params[:budget_id],
      date: Date.today
    )
    if @purchase.save
      redirect "/budgets/#{@purchase.budget_id}"
    else
      @error = @purchase.errors.full_messages.first
      erb :'/purchases/new'
    end
    redirect "/purchases"
  end

  # GET: /purchases/5
  #get "/purchases/:id" do
  #  erb :"/purchases/show.html"
  #end

  # GET: /purchases/5/edit
  get "/purchases/:id/edit" do
    redirect_if_logged_out
    @purchase = current_user.purchases.find_by_id(params[:id])
    @budget = Budget.find_by_id(@purchase.budget_id)
    erb :"/purchases/edit"
  end

  # PATCH: /purchases/5
  patch "/purchases/:id" do
    @purchase = current_user.purchases.find_by_id(params[:id])
    params.delete(:_method)
    if @purchase.update!(params)
      redirect "/budgets/#{@purchase.budget_id}"
    else
      @error = @purchase.errors.full_messages.first
      erb :"/purchases/edit"
    end
  end

  # DELETE: /purchases/5/delete
  delete "/purchases/:id" do
    @purchase = current_user.purchases.find_by_id(params[:id])
    @budget = Budget.find_by_id(@purchase.budget_id)
    @purchase.destroy
    redirect "/budgets/#{@budget.id}"
  end
end
