class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.references :user, foreign_key: true
      t.references :topic, foreign_key: true
      t.string :name, null: false #validate length in model
      t.string :description, null: false #validate length in model
      t.integer :pages, null: false, :default => 1
      # subtopic - to be implemented later 
      # delivery time - need another table for availability
      t.integer :status_user, :default => 0 #to use enum in model - [booked, paid, delivered]
      t.integer :status_admin, :default => 0 #to use enum in model - [queued, assigned, started, completed]
      t.timestamps null: false
    end
    end
  end
end


