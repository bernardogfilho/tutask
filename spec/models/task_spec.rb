require 'spec_helper'

describe Task do
  it {should validate_presence_of(:title)}
  it {should belong_to(:project)}
  it {should have_many(:questions)}
  it {should have_and_belong_to_many :users}
  it {should belong_to :owner}
  it {should have_a_valid_factory}
end
