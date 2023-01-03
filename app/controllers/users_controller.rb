class UsersController < ApplicationController
  before_action :authenticate_admin!, except: :show
  before_action :set_user, only: %i[show edit update destroy status]

  def index
    @users = User.order(active: :desc, last_name: :asc)
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy

    if @user.destroy
      redirect_to users_path, notice: 'Registro eliminado'
    end
  end

  def status
    @user.active = !@user.active
    @users = User.order(active: :desc)
    redirect_to users_path if @user.save
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :shift, :employee_number, :admin, :active, :photo)
  end
end
