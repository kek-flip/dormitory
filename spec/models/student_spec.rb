require 'rails_helper'

RSpec.describe Student, type: :model do
  it { should belong_to(:user) }

  it { should validate_presence_of(:user_id).with_message('Необходимо связать студента с пользователем') }

  it { should validate_presence_of(:room).with_message('Необходимо указать комнату проживания') }
  it { should validate_numericality_of(:room).with_message('Некорректный номер комнаты') }
end
