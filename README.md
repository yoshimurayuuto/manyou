#userモデル

  class User < ApplicationRecord
  end

#userスキーマ


  |data-type|column|
  |:--|--
  |string |name|
  |string |email|
  |string |password_digest|



#taskモデル
  class Task < ApplicationRecord
  end

#taskスキーマ

  |data-type|column|
  |:--|--
  |string |name|
  |text |content|
