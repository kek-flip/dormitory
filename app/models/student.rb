class Student < ApplicationRecord
  belongs_to :user
  validates_presence_of :user_id, message: 'Необходимо связать студента с пользователем'
  validates_uniqueness_of :user_id, message: 'Студент связанный с этим пользователем уже существует'
  validates_each :user_id do |record, attr, value|
    record.errors.add(attr, message: "Не существует пользователя с id #{value}") if User.find_by_id(value).nil?
  end

  validates_presence_of :room, message: 'Необходимо указать комнату проживания'
  validates_numericality_of :room, only_integer: true, message: 'Некорректный номер комнаты'
  validates_numericality_of :room, in: 201..837, message: 'Некорректный номер комнаты'
end
