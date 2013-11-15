require 'spec_helper'

describe User do
  # it {should have_and_belongs_to_many :projects}
  it {should validate_presence_of(:name).on(:update)}
  it {should have_a_valid_factory}
end