class Request < ApplicationRecord
  belongs_to :student
  belongs_to :staff

  validates_presence_of :floor, message: 'Укажите этаж'
  validates_presence_of :location, message: 'Укажите место'
  validates_presence_of :problem, message: 'Опишите проблему'
end
