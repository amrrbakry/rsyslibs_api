class AddAttributesToProjectDependencies < ActiveRecord::Migration[5.1]
  def change
    add_column :project_dependencies, :github_url, :string
    add_column :project_dependencies, :website, :string
    add_column :project_dependencies, :owner_name, :string
  end
end
