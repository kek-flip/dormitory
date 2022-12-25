require 'rails_helper'

RSpec.describe CouncilMember, type: :model do
  it { should belong_to(:student) }

  it { should validate_presence_of(:student_id).with_message('Необходимо связать члена студсовета со студентом') }

  it { should validate_presence_of(:rank).with_message('Необходимо указать должность') }
end
