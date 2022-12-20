class Student < ApplicationRecord
  validates_presence_of :user_id, message: 'Необходимо связать студента с пользователем'
  validates_uniqueness_of :user_id, message: 'Студент связанный с этим пользователем уже существует'
  validates_presence_of :room, message: 'Необходимо укзать комнату проживания'
end
