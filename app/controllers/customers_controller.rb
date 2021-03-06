class CustomersController < ApplicationController
  # GET /customers
  # GET /customers.json
  before_filter :is_admin_or_user, :only => [:edit, :show]
  before_filter :is_admin, :only => [:index]
  def index
    
	if params[:q]
		@customers = Customer.find_all_by_delivery_route(nil)
	else
		@customers = Customer.all
	end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @customers }
    end
  end
  
  def admin
	@week = Week.last
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.json
  def new
	if current_user
		date = Week.last .start_date - 1.days
		if Time.zone.now > Time.zone.local(date.year, date.month, date.day, 13, 0, 0, 0)
			redirect_to '/orders/late' and return
		end
		if Week .last .orders .map { |a| a.customer_id } .include?(current_user.id)
			order = Order.find_by_customer_id_and_week_id(current_user.id, Week.last.id)
			redirect_to edit_order_path(order) and return
		else
			redirect_to new_order_path and return
		end
	end
    @customer = env['omniauth.identity'] 
	@customer ||= Customer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @customer }
    end
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      if @customer.save
        format.html { redirect_to '/auth/identity/register', :notice => 'Customer was successfully created.' }
        format.json { render :json => @customer, :status => :created, :location => @customer }
      else
        format.html { render :action => "new" }
        format.json { render :json => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.json
  def update
    @customer = Customer.find(params[:id])
    unencrypted_password = params[:customer][:password].to_s
    password_digest = BCrypt::Password.create(unencrypted_password)
	params[:customer][:password_digest] = password_digest
    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to admin_path, :notice => 'Customer was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :ok }
    end
  end
end
