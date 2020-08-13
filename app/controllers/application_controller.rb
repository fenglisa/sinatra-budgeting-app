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

    def redirect_if_logged_out
      if !signed_in?
        redirect '/'
      end
    end

    def purchases_by_date
      current_user.purchases.sort_by do |p|
        p.date
      end
    end

    def purchase_total
      budget_purchases = []
      current_user.purchases.each do |p|
        budget_purchases << p.amount if p.budget_id == @budget.id
      end
      budget_purchases.sum
    end

    def remaining_balance
      @budget.balance = @budget.balance - purchase_total
      @budget.balance
    end


  end

  get "/" do
    erb :index
  end

end
