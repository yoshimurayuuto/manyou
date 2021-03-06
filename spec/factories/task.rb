# 「FactoryBotを使用します」という記述
FactoryBot.define do

  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :task, class: Task do

    content { 'testtesttest' }
    title { 'testtesttest' }
    status{ 'testtesttest' }
    priority { 1 }
    expiration_date {Time.current}
    # created_at Time.current
  end

  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_task, class: Task do
    
    content { 'samplesample' }
    title { 'testtesttest' }
    status{ 'testtesttest' }
    priority { 1 }
    expiration_date {Time.current}
  #   created_at { '2019-10-23 11:51:39 +0900'}
  end
end
