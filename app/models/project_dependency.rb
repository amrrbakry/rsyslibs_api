class ProjectDependency < ApplicationRecord
  validates :name, presence: true, length: { in: 2..70 }

  has_many :dependencies_system_libraries
  has_many :system_libraries, through: :dependencies_system_libraries
end
