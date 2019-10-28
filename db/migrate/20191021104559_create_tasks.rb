class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, unique: true
      t.string :title
      t.text :content
      t.string :expiration_date
      t.string :status, default: "未着手", null: false
      t.integer :priority
      t.timestamps
    end
  end
end
