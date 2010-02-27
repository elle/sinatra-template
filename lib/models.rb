# example model file
require 'active_record'

class Page < ActiveRecord::Base
  validates_uniqueness_of :title
  
  named_scope :recent, {:limit => 10, :order => 'updated_at DESC'}
end

class Enquiry < ActiveRecord::Base
end
