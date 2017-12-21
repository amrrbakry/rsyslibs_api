class ProjectDependencySerializer < ActiveModel::Serializer
  attributes :id, :name, :version, :github_url, :website, :owner_name

  has_many :system_libraries
end
