class PollAnswer < ApplicationRecord
  belongs_to :poll
  belongs_to :student
end
