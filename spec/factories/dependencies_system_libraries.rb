FactoryBot.define do
  factory :dependency_system_library, class: 'DependenciesSystemLibrary' do
    project_dependency
    system_library
  end
end
