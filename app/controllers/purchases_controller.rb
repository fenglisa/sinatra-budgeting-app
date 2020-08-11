class PurchasesController < ApplicationController

  # GET: /purchases
  get "/purchases" do
    erb :"/purchases/index.html"
  end

  # GET: /purchases/new
  get "/purchases/new" do
    erb :"/purchases/new.html"
  end

  # POST: /purchases
  post "/purchases" do
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
