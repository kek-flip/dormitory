require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    it { should have_one(:student) }
    it { should have_one(:staff) }

    subject { User.new(login: 'test', password: 'test', name: 'Ivan', surname: 'Ivanov') }
    it { should validate_uniqueness_of(:login).with_message('Имя пользователя уже существует') }
    it { should validate_presence_of(:login).with_message('Укажите логин') }

    it { should validate_presence_of(:password).with_message('Пароль пользователя не должно быть пустым') }
    it { should validate_length_of(:password).with_message('Пароль должен быть 6 или более символов') }
    it { should validate_confirmation_of(:password).with_message('Пароли различны') }
    it { should validate_presence_of(:password_confirmation).with_message('Повторите пароль') }

    it { should validate_presence_of(:name).with_message('Укажитие имя') }
    it { should validate_presence_of(:surname).with_message('Укажитие фамилию') }
  end
end
