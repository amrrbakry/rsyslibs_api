class ProjectDependencySerializer < ActiveModel::Serializer
  attributes :id, :name, :version

  has_many :system_libraries
end
