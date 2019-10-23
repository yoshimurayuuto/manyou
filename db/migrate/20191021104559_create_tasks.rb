class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :content
      t.string "Expiration_date"
      t.timestamps
    end
  end
end
