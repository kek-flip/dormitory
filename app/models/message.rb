class Message < ApplicationRecord
  belongs_to :council_member
  validates_presence_of :title, message: 'У сообщения должен быть заголовок'
  validates_presence_of :text, message: 'Сообщение не может быть пустым'
end
