class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  before_filter :is_admin, :only => [:edit, :index]
  
  def index
	if params[:week_id].present?
		@week = Week.find(params[:week_id])
		@orders = @week.orders
		@extras = @week.extras
	elsif params[:customer_id].present?
		@customer = Customer.find(params[:customer_id])
		@orders = @customer.orders
	else
		@orders = Order.all
	end
	
    respond_to do |format|
      format.html # index.html.erb
	  format.csv { render :text => Order.to_csv(@orders) }
      format.json { render :json => @orders }
    end
  end

  def confirmation 
  
  end
  
  def update_multiple
	Order.update(params[:order].keys, params[:order].values)
	flash[:notice] = "Products updated"
	redirect_to orders_url
  end
  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
  
	if params[:week_id].present?
		@week = Week.find(params[:week_id])
	else
		@week = Week.last
	end
	
	@order = @week.orders.build
	@extra_order = @order.extra_orders.build
	@extra_order2 = @order.extra_orders.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  
  def home
	if current_user
		redirect_to new_order_path
	end
	
  end
  
  def create
	if params[:week_id].present?
		@week = Week.find(params[:week_id])
	else
		@week = Week.last
	end
    
	@order = @week.orders.build(params[:order])
	if current_user
		@order.customer_id = current_user.id
	end
    
    if @order.save
		#ConfirmationEmail.order_confirmation(@order).deliver
		render 'confirmation'
      
    else
        render :action => "new" 
  
    end
  
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, :notice => 'Order was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :ok }
    end
  end
end
