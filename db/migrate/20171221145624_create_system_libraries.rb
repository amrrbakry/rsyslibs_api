class CreateSystemLibraries < ActiveRecord::Migration[5.1]
  def change
    create_table :system_libraries do |t|
      t.string :name
      t.string :version
      t.string :os
      t.integer :os_bits
      t.string :os_vendor

      t.timestamps
    end
  end
end
