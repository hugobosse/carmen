class CreateJoinTableDemandCuisine < ActiveRecord::Migration[5.0]
  def change
    create_join_table :demands, :cuisines do |t|
      # t.index [:demand_id, :cuisine_id]
      # t.index [:cuisine_id, :demand_id]
    end
  end
end
