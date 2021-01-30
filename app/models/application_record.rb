class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # attr_accessible :tasks, :completed, :tags
  # acts_as_taggable
end
