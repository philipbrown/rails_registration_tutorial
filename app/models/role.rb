class Role < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end
