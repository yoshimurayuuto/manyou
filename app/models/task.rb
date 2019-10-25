class Task < ApplicationRecord
  # validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :title, presence: true
  validates :content, presence: true
  validates :status, presence: true
  validates :priority, presence: true
  paginates_per 10
  def self.search(search)
    search ? where('title LIKE ?', "%#{search}%") : all
  end
  # 例
  # Task.getStatus(@task)


  #
  # def self.getStatus(task)
  #   return "未着手" if task.nil?
  #
  #   if task.status == 0
  #     "未完了"
  #   elsif task.status == 1
  #     "未着手"
  #   else task.status == 2
  #     "完了"
  #   end
  # end

  # 例
  # # Task.getPriority(@task)
  # def self.getPriority(task)
  #   return "低" if task.nil?
  #   if task.priority == 0
  #     "低"
  #   elsif task.priority == 1
  #     "中"
  #   else task.priority == 2
  #     "高"
  #   end
  # end
end
