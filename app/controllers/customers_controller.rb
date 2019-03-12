require 'pry'
class CustomersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect "/orders/new"
    else
      erb :'/customers/new_customer'
    end
  end

  get '/login' do
    if logged_in?
      redirect "/orders/new"
    else
      erb :'/customers/login'
    end
  end

  get '/checkout' do
    if logged_in?
      erb:'/customers/checkout'
    else
      redirect "/login"
    end
  end

  post '/login' do
    if @customer = Customer.find_by(username: params[:username])
      if @customer.authenticate(params[:password])
        login(@customer.id)
        ##now check to see if the customer has a saved cart/incomplete order
        ##if this is the case, update their cart and session[:order_id] to reflect this.
        @oldcart = Order.where(customer_id: @customer.id, completed_order: 0)
        if @oldcart.length > 0
          session[:order_id] = @oldcart[0].id
          redirect "/orders/#{session[:order_id]}"
        else
        redirect "/orders/new"
      end
      else
        flash[:message] = "That <em>password was incorrect</em>; please try again."
        redirect "/login"
      end
    else
      flash[:message] = "<em>No such user was found</em>; please re-enter login info or <em><a href='/signup'>sign up </a></em> for an account."
      redirect "/login"
    end
  end

  post '/signup' do
    ##if any fields are left blank
    if params.values.any? { |v| v == "" }
      flash[:message] = "<em>One or more fields were left blank</em>; please try again."
      redirect "/signup"
    else
      @customer = Customer.create(username: params[:username], first_name: params[:first_name], last_name: params[:last_name], address: params[:address], email: params[:email], password: params[:password])
      ##if username is already taken
      if @customer.errors.messages[:username]
        flash[:message] = "That <em>username is already taken</em>; please try again."
        redirect "/signup"
      else
        @customer.save
        login(@customer.id)
        redirect "/orders/new"
      end
    end
  end

  get '/customers/:slug' do
    @customer = Customer.find_by_slug(params[:slug])
    if logged_in? && current_customer == @customer
      erb :'/customers/show'
    else
      redirect "/"
    end
  end

  get '/customers/:slug/edit' do
    @customer = Customer.find_by_slug(params[:slug])
    if logged_in? && current_customer == @customer
      erb :'customers/edit_profile'
    else
      redirect "/"
    end
  end

  patch '/customers/:slug' do
    @customer = Customer.find_by_slug(params[:slug])
    if logged_in? && current_customer == @customer
      if params[:first_name] != "" && params[:last_name] != "" && params[:address] != "" && params[:email] != ""
        @customer.update_attributes(:first_name => params[:first_name], :last_name => params[:last_name], :address => params[:address], :email => params[:email])
        redirect "/customers/#{@customer.slug}"
      else
        flash[:message] = "Please make sure all fields below are filled out before resubmitting."
        redirect "/customers/#{@customer.slug}/edit"
      end
    else
      redirect "/"
    end
  end

  get '/logout' do
    if logged_in?
      @customer = Customer.find_by(id: session[:user_id])
      session.destroy
      redirect "/login"
    else
      redirect "/"
    end
  end

end
