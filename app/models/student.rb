class Student < ApplicationRecord
  has_one :users
  validates_presence_of :users, message: 'Необходимо связать студента с пользователем'
  validates_uniqueness_of :user_id, message: 'Студент связанный с этим пользователем уже существует'
  validates_presence_of :room, message: 'Необходимо указать комнату проживания'
end
