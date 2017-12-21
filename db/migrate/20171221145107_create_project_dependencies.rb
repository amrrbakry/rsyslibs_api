class CreateProjectDependencies < ActiveRecord::Migration[5.1]
  def change
    create_table :project_dependencies do |t|
      t.string :name
      t.string :version

      t.timestamps
    end
  end
end
