class CouncilMember < ApplicationRecord
  belongs_to :student
  validates_uniqueness_of :student_id, message: 'Данный студент уже состоит в студсовете'
  validates_presence_of :rank, message: 'Необходимо указать должность'
end
