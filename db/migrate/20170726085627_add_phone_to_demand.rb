class AddPhoneToDemand < ActiveRecord::Migration[5.0]
  def change
    add_column :demands, :phone, :string
  end
end
