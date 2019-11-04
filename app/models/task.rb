class Task < ApplicationRecord

  validates :title, presence: true
  validates :content, presence: true
  validates :status, presence: true
  validates :priority, presence: true
  validates :expiration_date, presence: true
  paginates_per 5
  belongs_to :user
    scope :search_with_title, -> (title) {where("title LIKE ?", "%#{title}%")}

    scope :search_with_status, -> (status) {where(status: status)}


  private

  enum priority: { 低: 0, 中: 1, 高: 2}

  def self.getPriority(task)
    return "低" if task.nil?
    if task.priority == 0
      "低"
    elsif task.priority == 1
      "中"
    else task.priority == 2
      "高"
    end
  end
end
