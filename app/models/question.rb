class Question < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :task
  has_many :answers
end
