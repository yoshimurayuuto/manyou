class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.datetime :expiration_date
      t.string :status, default: "未着手", null: false
      t.integer :priority
      t.timestamps
    end
  end
end
