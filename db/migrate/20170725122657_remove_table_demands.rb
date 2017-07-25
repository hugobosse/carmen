class RemoveTableDemands < ActiveRecord::Migration[5.0]
  def up
    drop_table :demands
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
