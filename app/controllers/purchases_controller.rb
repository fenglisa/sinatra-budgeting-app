class PurchasesController < ApplicationController

  # GET: /purchases
  get "/purchases" do
    erb :"/purchases/index.html"
  end

  # GET: /purchases/new
  get "/purchases/:budget_id/new" do
    @budget = current_user.budgets.find_by_id(params[:budget_id])
    erb :"/purchases/new.html"
  end

  # POST: /purchases
  post "/purchases/:budget_id" do
    @purchase = current_user.purchases.build(
      amount: params[:amount], budget_id: params[:budget_id])
      #date:
    if @purchase.save
      redirect "/budgets"
    else
      @error = @purchase.errors.full_messages.first
      erb :'/purchases/new'
    end
    redirect "/purchases"
  end

  # GET: /purchases/5
  get "/purchases/:id" do
    erb :"/purchases/show.html"
  end

  # GET: /purchases/5/edit
  get "/purchases/:id/edit" do
    erb :"/purchases/edit.html"
  end

  # PATCH: /purchases/5
  patch "/purchases/:id" do
    redirect "/purchases/:id"
  end

  # DELETE: /purchases/5/delete
  delete "/purchases/:id/delete" do
    redirect "/purchases"
  end
end
