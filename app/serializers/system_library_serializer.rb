class SystemLibrarySerializer < ActiveModel::Serializer
  attributes :id, :name, :version, :os, :os_bits, :os_vendor

  has_many :project_dependencies
end
