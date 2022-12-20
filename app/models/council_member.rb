class CouncilMember < ApplicationRecord
  has_one :student
  validates_presence_of :student, message: 'Необходимо связать члена студсовета со студентом'
  validates_uniqueness_of :student_id, message: 'Данный студент уже состоит в студсовете'
  validates_presence_of :rank, message: 'Необходимо указать должность'
end
