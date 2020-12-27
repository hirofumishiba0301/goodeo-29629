class Goodjob < ApplicationRecord
  belongs_to :video, counter_cathe: :goodjob
  belongs_to :user
end
