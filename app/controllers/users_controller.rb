# frozen_string_literal: true

# Users controller
class UsersController < ApplicationController
  before_action :parse_user_type, only: :create
  skip_before_action :authenticate, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.invalid?
      render :new, status: :unprocessable_entity
      return
    end

    @user.save
    student = Student.new(user_id: @user.id, room: params[:user][:room])
    staff = Staff.new(user_id: @user.id, rank: params[:user][:rank])

    if @user_type == 'student' && student.save
      redirect_to session_login_path, notice: 'Пользователь успешно создан'
    elsif @user_type == 'staff' && staff.save
      redirect_to session_login_path, notice: 'Пользователь успешно создан'
    else
      render :new, status: :unprocessable_entity
      @user.destroy
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation, :name, :surname, :second_name)
  end

  def parse_user_type
    @user_type = params[:user][:user_type]
  end
end
