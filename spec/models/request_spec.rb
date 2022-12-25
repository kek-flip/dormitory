require 'rails_helper'

RSpec.describe Request, type: :model do
  it { should belong_to(:student) }
  it { should belong_to(:staff) }

  it { should validate_presence_of(:floor).with_message('Укажите этаж') }
  it { should validate_presence_of(:location).with_message('Укажите место') }
  it { should validate_presence_of(:problem).with_message('Опишите проблему') }
end
