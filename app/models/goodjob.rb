class Goodjob < ApplicationRecord
  belongs_to :video, counter_cache: :goodjobs_count
  belongs_to :user
end
