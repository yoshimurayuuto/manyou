class Task < ApplicationRecord
  # validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true, uniqueness: true
  validates :content, presence: true
end
