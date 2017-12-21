require 'rails_helper'

RSpec.describe DependenciesSystemLibrary, type: :model do
  it { should belong_to(:project_dependency) }
  it { should belong_to(:system_library) }
end
