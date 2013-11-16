require 'spec_helper'

describe Comment do
  it {should belong_to :topic}
  it {should validate_presence_of :content}
  it {should have_a_valid_factory}
end
