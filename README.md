#userモデル

  class User < ApplicationRecord
  end

#userスキーマ


  |data-type|column|
  |:--|--
  |t.string |name|
  |t.string |email|
  |t.string |password_digest|



#contentモデル
  class Content < ApplicationRecord
  end

#contentスキーマ

  |data-type|column|
  |:--|--
  |t.text_area |content|
