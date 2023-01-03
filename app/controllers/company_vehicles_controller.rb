class CompanyVehiclesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_company, only: %i[new create]
  before_action :set_company_vehicle, only: %i[show edit update destroy status]
  def index
    @company_vehicles = CompanyVehicle.all
  end

  def new
    @company_vehicle = CompanyVehicle.new
  end

  def create
    @company_vehicle = @company.company_vehicles.new(company_vehicle_params)
    if @company_vehicle.save
      redirect_to company_path(@company)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @company_vehicle.update(company_vehicle_params)
      redirect_to company_path(@company_vehicle.company)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @company_vehicle.destroy
      redirect_to company_company_vehicle_path(@company), notice: 'Registro eliminado.'
    end
  end

  def status
    @company_vehicle.active = !@company_vehicle.active
    redirect_to company_path(@company_vehicle.company) if @company_vehicle.save
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_company_vehicle
    @company_vehicle = CompanyVehicle.find(params[:id])
  end

  def company_vehicle_params
    params.require(:company_vehicle).permit(:brand, :model, :license_plate, :active)
  end
end
