userモデル:

class User < ApplicationRecord
end

userスキーマ
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end
end

contentモデル
class Content < ApplicationRecord
end

contentスキーマ
class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.text_area :content
      t.timestamps
    end
  end
end
