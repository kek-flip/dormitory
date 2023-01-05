# frozen_string_literal: true

# Sessions controller
class SessionController < ApplicationController
  skip_before_action :authenticate, only: %i[login create]

  def login; end

  def create
    user = User.find_by_login(params[:login])
    if user&.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = user.nil? ? 'Неправильный логин' : 'Неправильный пароль'
      redirect_to session_login_path
    end
  end

  def logout
    session.delete(:current_user_id)
    @_current_user = nil
    @_user_access = nil
    @_current_user_role = nil
    redirect_to session_login_path
  end
end
