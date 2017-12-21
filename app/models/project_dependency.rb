class ProjectDependency < ApplicationRecord
  validates :name, presence: true, length: { in: 2..70 }
end
