class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      
      t.references :topic, foreign_key: true
      t.references :user, foreign_key: true
      t.string :name, null: false #validate length in model. Longer length.
      t.string :reference_url, null: false #validate url in model
      t.integer :year, null: false, :default => 0000 #validate year in model
	  t.integer :like_admin, null: false, :default => 0
	  t.integer :like_user, null: false, :default => 0
	  t.integer :status, :default => 0 #to use enum in model - [valid, invalid]
      t.timestamps
    end
  end
end
