require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  enable :sessions
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_customer
    Customer.find(session[:user_id])
  end

  def login (customer_id)
    session[:user_id] = customer_id
  end

end
