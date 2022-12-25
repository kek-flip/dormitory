require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:council_member) }

  it { should validate_presence_of(:title).with_message('У новости должен быть заголовок') }
  it { should validate_presence_of(:text).with_message('Новость не может быть пустой') }
end
