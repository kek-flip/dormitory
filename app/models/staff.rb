class Staff < ApplicationRecord
  has_many :requests

  belongs_to :user
  validates_presence_of :user_id, message: 'Необходимо связать сотрудника с пользователем'
  validates_uniqueness_of :user_id, message: 'Сотрудник связанный с этим пользователем уже существует'
  validates_each :user_id do |record, attr, value|
    record.errors.add(attr, message: "Не существует пользователя с id #{value}") if User.find_by_id(value).nil?
  end

  validates_presence_of :rank, message: 'Необходимо указать должность'
end
