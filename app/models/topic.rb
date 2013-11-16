class Topic < Post  
  has_many :comments
  belongs_to :project
end
