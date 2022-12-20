class UsersController < ApplicationController
  before_action :parse_user_type, only: :create

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    student = Student.new(user_id: user.id, room: params[:user][:room])
    staff = Staff.new(user_id: user.id, rank: params[:user][:rank])
    if user.save 
      student.save if @user_type == 'student' && stduent.valid?
      staff.save if @user_type == 'staff' && staff.valid?
      redirect_to sessions_login_path, notice: 'Пользователь успешно создан.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation, :name, :surname, :second_name)
  end

  def parse_user_type
    @user_type = params[:user][:user_type]
  end
end
