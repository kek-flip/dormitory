# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base
  before_action :authenticate

  private

  # 0 - студент
  # 1 - Студсовет
  # 2 - Работник

  STUDENT = 1
  COUNCIL_MEMBER = 2
  STAFF = 0

  def current_user
    @_current_user ||= session[:current_user_id] &&
                       User.find_by(id: session[:current_user_id])
  end

  def set_current_user_access
    student = Student.find_by_user_id(current_user.id)
    council_member = CouncilMember.find_by_student_id(student.id) unless student.nil?
    staff = Staff.find_by_user_id(current_user.id)
    if !council_member.nil?
      @_current_user_role = council_member
      @_user_access = COUNCIL_MEMBER
    elsif !staff.nil?
      @_current_user_role = staff
      @_user_access = STAFF
    elsif !student.nil?
      @_current_user_role = student
      @_user_access = STUDENT
    end
    @_user_access
  end

  def authenticate
    set_current_user_access unless current_user.nil?
    redirect_to session_login_path if current_user.nil?
  end
end
