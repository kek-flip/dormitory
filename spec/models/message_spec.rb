require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should belong_to(:council_member) }

  it { should validate_presence_of(:title).with_message('У сообщения должен быть заголовок') }
  it { should validate_presence_of(:text).with_message('Сообщение не может быть пустым') }
end
