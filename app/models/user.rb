class User < ActiveRecord::Base
  validates :name, presence: true, on: :update
end