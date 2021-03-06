require 'spec_helper'

describe User do
  it {should have_and_belong_to_many :projects}
  it {should have_many :topics }
  it {should validate_presence_of(:name).on(:update)}
  it {should have_a_valid_factory}
end