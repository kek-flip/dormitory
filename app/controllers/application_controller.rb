# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate

  private

  def current_user
    @_current_user ||= session[:current_user_id] &&
                       User.find_by(id: session[:current_user_id])
  end

  def authenticate
    redirect_to session_login_path if current_user.nil?
  end
end
