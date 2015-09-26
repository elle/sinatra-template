require_relative "../spec_helper"
require_relative "../../lib/models/post"

describe Post do
  it { should validate_presence_of(:title) }
end
