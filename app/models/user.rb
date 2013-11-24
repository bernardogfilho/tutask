class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, on: :update

  has_and_belongs_to_many :projects
  has_many :topics
  has_and_belongs_to_many :owned_projects, class_name: "Project", join_table: "groups_owners_join_table"
end