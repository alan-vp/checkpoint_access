class CompaniesController < ApplicationController
  before_action :authenticate_admin!, except: :vehicles
  before_action :set_company, only: %i[show edit update destroy]
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @company_vehicles = @company.company_vehicles
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to companies_path(@company)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @company.destroy
      redirect_to companies_path, notice: 'Registro eliminado.'
    end
  end

  def vehicles
    @target = params[:target] # params[:target] lo tomamos de la URL que se construyó en el company_controller.js
    @company = Company.find(params[:company]) # lo mismo sucede en este caso
    @company_vehicles = @company.company_vehicles
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name)
  end


end
