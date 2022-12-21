# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate

  private

  # 0 - студент
  # 1 - Студсовет
  # 2 - Работник

  STUDENT = 0
  COUNCIL_MEMBER = 1
  STAFF = 2

  def current_user
    @_current_user ||= session[:current_user_id] &&
                       User.find_by(id: session[:current_user_id])
  end

  def set_current_user_access
    council_member = CouncilMember.find_by_student_id(Student.find_by_user_id(current_user.id).id)
    staff = Staff.find_by_user_id(current_user.id)
    if !council_member.nil?
      @_current_user_role = council_member
      @_user_access = COUNCIL_MEMBER
    elsif !staff.nil?
      @_current_user_role = staff
      @_user_access = STAFF
    else
      @_user_access = STUDENT
    end
    @_user_access
  end

  def authenticate
    set_current_user_access unless current_user.nil?
    redirect_to session_login_path if current_user.nil?
  end
end
