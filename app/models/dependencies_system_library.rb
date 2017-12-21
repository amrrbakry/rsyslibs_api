class DependenciesSystemLibrary < ApplicationRecord
  belongs_to :project_dependency
  belongs_to :system_library
end
