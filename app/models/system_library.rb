class SystemLibrary < ApplicationRecord
  validates :name, :os, presence: true, length: { in: 2..70 }
end
