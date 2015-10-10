require_relative "../spec_helper"
require_relative "../../lib/models/post"

describe Post do
  it { is_expected.to validate_presence_of(:title) }
end
