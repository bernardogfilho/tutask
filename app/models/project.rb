class Project < ActiveRecord::Base
  validates :title, presence: true
  has_many :tasks
  has_and_belongs_to_many :users
end
