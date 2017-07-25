class ChangeServicesScheduleTypes < ActiveRecord::Migration[5.0]
  def up
    change_column :restaurants, :lunch_service_opening_at, :string
    change_column :restaurants, :lunch_service_closing_at, :string
    change_column :restaurants, :dinner_service_opening_at, :string
    change_column :restaurants, :dinner_service_closing_at, :string
  end

  def down
    change_column :restaurants, :lunch_service_opening_at, :time
    change_column :restaurants, :lunch_service_closing_at, :time
    change_column :restaurants, :dinner_service_opening_at, :time
    change_column :restaurants, :dinner_service_closing_at, :time
  end
end
