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
  class Task < ApplicationRecord
  end

#contentスキーマ

  |data-type|task|
  |:--|--
  |t.string |name|
  |t.text_area |content|
