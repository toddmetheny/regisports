class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
    authorize! :read, @reservations
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @order = current_order
    @reservation = @order.reservations.build(reservation_params)
    #@reservation = Reservation.new(reservation_params)
    @order_id = current_order.id

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Registration  was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
        format.js {}
        @order.save
        session[:order_id] = @order.uuid
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Registration was successfully destroyed.' }
      format.json { head :no_content }
      format.js {}#{render inline: "location.reload()" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:name, :lastname, :age, :gender, :email, :phone, :team, :shirt, :redeemcode, :option_id, :tax, :reservation_status_id)
    end
end
