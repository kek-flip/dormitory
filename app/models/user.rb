class User < ApplicationRecord
  has_one :student

  has_one :staff

  validates_uniqueness_of :login, message: 'Имя пользователя уже существует'
  validates_presence_of :login, message: 'Укажите логин'

  has_secure_password
  validates_presence_of :password, message: 'Пароль пользователя не должно быть пустым'
  validates_length_of :password, minimum: 6, message: 'Пароль должен быть 6 или более символов'
  validates_confirmation_of :password, message: 'Пароли различны'
  validates_each :password do |record, attr, value|
    record.errors.add(attr, message: 'Пароль должен содержать цифры') unless value =~ /\d/
    record.errors.add(attr, message: 'Пароль должен содержать строчные буквы') unless value =~ /[a-z]/
    record.errors.add(attr, message: 'Пароль должен содержать прописные буквы') unless value =~ /[A-Z]/
  end

  validates_presence_of :name, message: 'Укажитие имя'

  validates_presence_of :surname, message: 'Укажитие фамилию'
end
