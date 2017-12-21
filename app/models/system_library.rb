class SystemLibrary < ApplicationRecord
  validates :name, :os, presence: true, length: { in: 2..70 }

  has_many :dependencies_system_libraries
  has_many :project_dependencies, through: :dependencies_system_libraries
end
