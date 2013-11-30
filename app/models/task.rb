class Task < ActiveRecord::Base
  scope :done, -> { where(completed:true)}
  scope :todo, -> { where(completed:false)}
  
  validates :title, presence: true

  has_many :questions
  belongs_to :project
  belongs_to :owner, class_name: "User"
  has_and_belongs_to_many :users, join_table: "users_tasks_join_table"
end