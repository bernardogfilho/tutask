class Task < ActiveRecord::Base
  validates :title, presence: true

  has_many :questions
  belongs_to :project
end