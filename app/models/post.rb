class Post < ApplicationRecord
  belongs_to :council_member
  validates_presence_of :title, message: 'У новости должен быть заголовок'
  validates_presence_of :text, message: 'Новость не может быть пустой'
end
