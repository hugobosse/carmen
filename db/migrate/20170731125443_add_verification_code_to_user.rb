class AddVerificationCodeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :verification_code, :string
    add_column :users, :verified, :boolean
  end
end
