class CouncilMember < ApplicationRecord
  belongs_to :student
  validates_uniqueness_of :student_id, message: 'Данный студент уже состоит в студсовете'
  validates_presence_of :student_id, message: 'Необходимо связать члена студсовета со студентом'
  validates_each :student_id do |record, attr, value|
    record.errors.add(attr, message: "Не существует студента с id #{value}") if Student.find_by_id(value).nil?
  end

  validates_presence_of :rank, message: 'Необходимо указать должность'
end
