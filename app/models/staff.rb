class Staff < ApplicationRecord
  belongs_to :user
  has_many :requests
  validates_uniqueness_of :user_id, message: 'Сотрудник связанный с этим пользователем уже существует'
  validates_presence_of :rank, message: 'Необходимо указать должность'
end
