class Department < ApplicationRecord
  belongs_to :store
  has_many :employees
end
