class Task < ApplicationRecord
  # validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :title, presence: true
  validates :content, presence: true
  validates :status, presence: true
  validates :priority, presence: true
  paginates_per 4
  # enum priority:{低: 0, 中: 1, 高: 2 }
  # scope :custom_scope, -> (boolean=true) {
  #   joins(:task).where(active: boolean)
  # }

  private

  # for ransack scope
  # def self.ransackable_scopes(auth_object=nil)
  #   %i(custom_scope)
  # end
  enum priority: { 低: 0, 中: 1, 高: 2}
  # enum status:{attack: 0,spells:1,defend:2,item:3, abilities:4}
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
  # Task.getPriority(task)
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
