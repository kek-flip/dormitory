require 'rails_helper'

RSpec.describe Staff, type: :model do
  it { should have_many(:requests) }

  it { should belong_to(:user) }

  it { should validate_presence_of(:user_id).with_message('Необходимо связать сотрудника с пользователем') }

  it { should validate_presence_of(:rank).with_message('Необходимо указать должность') }
end
