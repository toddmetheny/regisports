class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    # @orders = Order.all
    authorize! :read, @orders
    @order_statuses = OrderStatus.all
    if params[:search_by_status]
      @orders = Order.search_by_status(params[:search_by_status])
    elsif params[:search]
       @orders = Order.search(params[:search])   
    else
      @orders = Order.all
    end

  end

# 3/2/16
#     def index
#     # @orders = Order.all
#     authorize! :read, @orders
#     @order_statuses = OrderStatus.all
#     if params[:search]
#       @orders = Order.search(params[:search])
#     elsif params[:search_by_status]
#       @orders = Order.search(params[:search_by_status])
#     else
#       @orders = Order.all
#     end

#   end
# CODE POSTED IN STACK OVERFLOW
  # def index
  #   @order_statuses = OrderStatus.all
  #   if params[:search]
  #     @orders = Order.search(params[:search])
  #   else
  #     @orders = Order.all
  #   end
  # end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find_by_uuid(params[:id])
    @reservations = @order.reservations
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit

  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find_by_uuid(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:subtotal, :tax, :total, :order_status_id, :uuid)
    end
end
