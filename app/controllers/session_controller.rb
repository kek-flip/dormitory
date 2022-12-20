# frozen_string_literal: true

class SessionController < ApplicationController
  skip_before_action :authenticate, only: %i[login create]

  def login; end

  def create
    user = User.find_by_login(params[:login])
    if user&.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to root_path
    else
      redirect_to session_login_path, alert: 'Неверный логин или пароль'
    end
  end

  def logout
    session.delete(:current_user_id)
    @_current_user = nil
    redirect_to session_login_path
  end
end
