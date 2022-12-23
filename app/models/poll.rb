class Poll < ApplicationRecord
  has_may :poll_answers
  belongs_to :council_member
  validates_presence_of :title, message: 'У опроса должно быть название'
  validates_presence_of :questions, message: 'У опроса должен быть хотя бы один вопрос'
end
