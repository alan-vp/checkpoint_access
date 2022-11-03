class EntrancesController < ApplicationController
  def index
    @entrances = Entrance.all
  end

  def new
    @entrance = Entrance.new
  end

  def create
    @entrance = Entrance.new(entrance_params)
    if entrance.save
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
    params.require(:entrance).permit(:date, :time, :first_name, :last_name, :destination, :comments, :company_vehicle_id, :mileage, :user_id)
  end

end
