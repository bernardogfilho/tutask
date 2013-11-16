class Project < ActiveRecord::Base
  validates :title, presence: true
  # validates_presence_of :title

  has_many :topics
  has_many :tasks
  has_and_belongs_to_many :users
end
