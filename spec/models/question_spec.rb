require 'spec_helper'

describe Question do
  it {should belong_to :task}
  it {should have_many :answers}
  it {should validate_presence_of :title}
  it {should have_a_valid_factory}
end
