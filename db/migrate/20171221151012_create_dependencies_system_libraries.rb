class CreateDependenciesSystemLibraries < ActiveRecord::Migration[5.1]
  def change
    create_table :dependencies_system_libraries do |t|
      t.references :project_dependency, index: true
      t.references :system_library, index: true

      t.timestamps
    end
  end
end
