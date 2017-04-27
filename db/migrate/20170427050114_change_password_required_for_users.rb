class ChangePasswordRequiredForUsers < ActiveRecord::Migration[5.0]
  def change
  end

  change_column_null :users, :encrypted_password, true

  
end
