class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :occupation
      t.string :industry
      t.integer :role, :default => 0 #to use enum in model - [customer, researcher, superadmin]
      t.string :email, null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
