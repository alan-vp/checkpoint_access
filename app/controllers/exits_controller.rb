class ExitsController < ApplicationController
  def index
    @exits = Exit.all
  end

  def new
    @exit = Exit.new
  end

  def create
    @exit = current_user.exits.new(exit_params)
    if @exit.save
      redirect_to exits_path
    else
      render :new
    end
  end

  private

  def exit_params
    params.require(:exit).permit(:date, :time, :first_name, :last_name, :destination, :comments, :mileage, :invoice, :company_id, :company_vehicle_id)
  end
end
