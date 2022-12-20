class CouncilMember < ApplicationRecord
  validates_presence_of :student_id, message: 'Необходимо связать члена студсовета со студентом'
  validates_uniqueness_of :student_id, message: 'Данный студент уже состоит в студсовете'
  validates_presence_of :rank, message: 'Необходимо указать должность'
end
