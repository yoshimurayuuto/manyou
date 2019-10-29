  # このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do

  # background do
  #   @task = Task.create!(name: 'test_task_01', content: 'testtesttest')
  #   @task = Task.create!(name: 'test_task_02', content: 'samplesample')
  # end
  background do
     # あらかじめタスク一覧のテストで使用するためのタスクを二つ作成する
     # FactoryBot.create(:task)
     # FactoryBot.create(:second_task)
     @task = FactoryBot.create(:task)

     @task2 = FactoryBot.create(:second_task)

   end
  # scenario（itのalias）の中に、確認したい各項目のテストの処理を書きます。
  scenario "タスク一覧のテスト" do


    # tasks_pathにvisitする（タスク一覧ページに遷移する）
    visit tasks_path
    # save_and_open_page


    # visitした（到着した）expect(page)に（タスク一覧ページに）「testtesttest」「samplesample」という文字列が
    # have_contentされているか？（含まれているか？）ということをexpectする（確認・期待する）テストを書いている
    expect(page).to have_content 'test_task_01'
    expect(page).to have_content 'testtesttest'
  end

  scenario "タスク作成のテスト" do
    task = Task.new(content: 'testtesttesta', title: "1", priority: 1, expiration_date: 1964,)

    visit new_task_path


    fill_in "task_content", with: 'みなさん、こんにちは'
    click_button "登録"

    
    expect(page).to have_content 'みなさん、こんにちは'
  end

  scenario "タスク詳細のテスト" do
    # @task = Task.create!(name: 'test_task_03', content: 'testtesttestaaa')
    # visit task_path(@task)
    # save_and_open_page
    # expect(page).to have_content "ブログ詳細画面"
    #
    # expect(page).to have_content 'test_task_03'
    # expect(page).to have_content 'testtesttestaaa'
    visit task_path(id: @task.id)
    expect(page).to have_content 'test_task_01'
    expect(page).to have_content 'testtesttest'
  end




  # scenario "タスクが作成日時の降順に並んでいるかのテスト" do
  #   Task.create(id: 1, name: '1', content: '1', title: "1", priority: 1, expiration_date: 1964, created_at: Time.current + 1.days)
  #   Task.create(id: 2, name: '2', content: '2', title: "1", priority: 1, expiration_date: 1964, created_at: Time.current + 2.days)
  #   Task.create(id: 3, name: '3', content: '3', title: "1", priority: 1, expiration_date: 1964, created_at: Time.current + 3.days)
  #   Task.create(id: 4, name: '4', content: '4', title: "1", priority: 1, expiration_date: 1964, created_at: Time.current + 4.days)
  #   visit tasks_path
  #   save_and_open_page
  #   task = all('.task_list')
  #   task_0 = task[0]
  #   expect(task_0).to have_content "3"
  #   expect(task_0).to have_content "4"
  #
  #     # ここにテスト内容を記載する
  #
  # end
end
