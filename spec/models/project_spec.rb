require 'spec_helper'

describe Project do
  it {should have_and_belong_to_many :users}
  it {should have_many :tasks}
  it {should validate_presence_of(:title)}
end
