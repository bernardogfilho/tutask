require 'spec_helper'

describe Topic do
  it {should belong_to :project}
  it {should validate_presence_of :title}
  it {should have_a_valid_factory}
end
