class EntrancesController < ApplicationController
  def index
    @entrances = Entrance.all
  end

  def new
    @entrance = Entrance.new
  end

  def create
    # @entrance = Entrance.new(entrance_params) -> Forma anterior, primero creaba la @entrance
    # @entrance.user = current_user -> y después asignaba el id del usuario a la entrance.
    @entrance = current_user.entrances.new(entrance_params) # Es es el "rails way", ya que antes de crear la instancia, sólo tenemos acceso a la información de user, en este caso a través del método current_user (gracias a devise)
    if @entrance.save
      redirect_to entrances_path
    else
      render :new
    end
  end

  def show
    @entrance = Entrance.find(params[:id])
  end

  private
  def entrance_params
    params.require(:entrance).permit(:date, :time, :first_name, :last_name, :destination, :comments, :company_id, :company_vehicle_id, :mileage)
  end

end
