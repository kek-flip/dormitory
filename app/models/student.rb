class Student < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :user_id, message: 'Студент связанный с этим пользователем уже существует'
  validates_presence_of :room, message: 'Необходимо указать комнату проживания'
end
