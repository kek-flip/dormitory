# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate

  private

  def current_user
    @_current_user ||= session[:current_user_id] &&
                       User.find_by(id: session[:current_user_id])
  end

  def set_current_user_access
    # 0 - студент
    # 1 - Студсовет
    # 2 - Работник
    council_member = CouncilMember.find_by_student_id(Student.find_by_user_id(current_user.id).id)
    staff = Staff.find_by_user_id(current_user.id)
    if !council_member.nil?
      @_current_user_role = council_member
      @_user_access = 1
    elsif !staff.nil?
      @_current_user_role = staff
      @_user_access = 2
    else
      @_user_access = 0
    end
    @_user_access
  end

  def authenticate
    set_current_user_access
    redirect_to session_login_path if current_user.nil?
  end
end
