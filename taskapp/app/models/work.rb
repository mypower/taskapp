class Work < ActiveRecord::Base
  belongs_to :user
  scope :finished, -> { where(done: true) }
  scope :unfinished, -> { where(done: false) }
end
