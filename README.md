#userモデル

  class User < ApplicationRecord
  end

#userスキーマ


  |data-type|column|
  |:--|--
  |t.string |name|
  |t.string |email|
  |t.string |password_digest|



#taskモデル
  class Task < ApplicationRecord
  end

#taskスキーマ

  |data-type|column|
  |:--|--
  |t.string |name|
  |t.text |content|
