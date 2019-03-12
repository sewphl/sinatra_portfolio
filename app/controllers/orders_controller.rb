require 'pry'
class OrdersController < ApplicationController

  get '/orders' do
    if logged_in?
      @orders = Order.all
      @tinctures = Tincture.all
      @customer = current_customer
      erb :'/orders/orders'
    else
      redirect "/login"
    end
  end

  get '/orders/new' do
    if logged_in?
      @customer = current_customer
    end
      @tinctures = Tincture.all
      erb :'/orders/new'
  end

  post '/orders' do
    if logged_in?
      if session.key?(:order_id) == false || session[:order_id] == nil
        @customer = current_customer
        @orderparams = params[:order][:tincture_counts].map! { |i| i.to_i }
        ##if the order submitted contains at least one tincture
        if @orderparams.sum > 0
          @order = Order.create(customer_id: current_customer.id, completed_order: 0)
          session[:order_id] = @order.id
          @orderparams.each_with_index do |t, idx|
            #if customer put 1+ quantity of that tincture in their cart
            if t>0
              #create an order with order ID and tincture ID
              t.times {OrdersTinctures.create(order_id: @order.id, tincture_id: Tincture.all[idx].id)}
              #update tincture inventory (subtract number of bottles requested)
              Tincture.update(Tincture.all[idx].id, inventory: Tincture.all[idx].inventory -= t)
            end
          end
          redirect "/orders/#{@order.id}"
          binding.pry
        else ##submitted empty order; redirect to order form:
        flash[:message] = "Please <em>increase quantity</em> of product to create an order."
        redirect "/orders/new"
        end
      else
        ##logged in but already started an order. edit that instead of starting new order.
        flash[:message] = "You already started an order; please edit current cart."
        redirect "/orders/#{session[:order_id]}"
      end
    else ##not logged in; redirect to login:
      flash[:message] = "Please <em>log in</em> to create an order."
      redirect "/login"
    end
  end

  get '/orders/:id' do
    if logged_in?
      @order = Order.find(params[:id])
      if current_customer.id == @order.customer_id
        @customer = current_customer
        @ots = OrdersTinctures.all.select {|ot| ot.order_id == @order.id}
        ##this is an array of the tincture IDs in the current cart.
        @ots_t = @ots.map {|ti| ti[:tincture_id]}
        ##only post tinctures that are in the current cart when showing current cart.
        @tinctures = Tincture.all.select {|ti| @ots_t.include? ti.id}
        erb :'/orders/show_order'
      else
        redirect "/orders/new"
      end
    else
      redirect "/login"
    end
  end

  get '/orders/:id/edit' do
    if logged_in?
      @customer = current_customer
      @tinctures = Tincture.all
      @order = Order.find(params[:id])
      if current_customer.id == @order.customer_id
        erb :'orders/edit_order'
      else
        redirect "/orders"
      end
    else
      redirect "/login"
    end
  end

  patch '/orders/:id' do
    @customer = current_customer
    @orderparams = params[:order][:tincture_counts].map! { |i| i.to_i }
    if logged_in? && @orderparams.sum > 0
      @order = Order.find(params[:id])
        if current_customer.id == @order.customer_id
          ##use info in OrdersTinctures to add cancelled order items back to tincture inventory.
          ##then destroy those OrdersTinctures rows.
          @ots = OrdersTinctures.all.select {|ot| ot.order_id == @order.id}
          ##this is an array of all the tincture IDs that were in the old cart.
          @ots_t = @ots.map {|ti| ti[:tincture_id]}
          ##add the cancelled order items back to tincture inventory.
          @ots_t.each do |t|
            Tincture.update(t, inventory: Tincture.find(t).inventory += 1)
          end
          ##destroy rows in OrdersTinctures join table
          @ots.each do |ot|
            ot.destroy
          end

          ##NOW UPDATE WITH THE NEW ORDER.
          ##if the order submitted contains at least one tincture
          @orderparams.each_with_index do |t, idx|
            #if customer put 1+ of that tincture in their cart
            if t>0
              #create an order with order ID and tincture ID
              t.times {OrdersTinctures.create(order_id: @order.id, tincture_id: Tincture.all[idx].id)}
              #update tincture inventory (subtract number of bottles requested)
              Tincture.update(Tincture.all[idx].id, inventory: Tincture.all[idx].inventory -= t)
            end
          end
          redirect "/orders/#{@order.id}"
        else
          redirect "/orders/new"
        end
      elsif logged_in? && @orderparams.sum == 0
        @order = Order.find(params[:id])
        flash[:message] = "It seems you attempted to empty your cart completely. If this is the case, please click 'Delete my order' below."
        redirect "/orders/#{@order.id}"
    else
      redirect "/login"
    end
  end

  delete '/orders/:id' do
    @order = Order.find(params[:id])
    if logged_in? && current_customer.id == @order.customer_id
      @customer = current_customer
      ##use info in OrdersTinctures to add cancelled order items back to tincture inventory.
      ##then destroy those OrdersTinctures rows.
      @ots = OrdersTinctures.all.select {|ot| ot.order_id == @order.id}
      ##this is an array of all the tincture IDs that were in the old cart.
      @ots_t = @ots.map {|ti| ti[:tincture_id]}
      ##add the cancelled order items back to tincture inventory.
      @ots_t.each do |t|
        Tincture.update(t, inventory: Tincture.find(t).inventory += 1)
      end
      ##destroy rows in OrdersTinctures join table
      @ots.each do |ot|
        ot.destroy
      end
      ##finally, delete order.
      @order.delete
      ##and change session[:order_id] to nil
      session[:order_id] = nil
      redirect "/orders/new"
    else
      redirect "/login"
    end
  end

end
