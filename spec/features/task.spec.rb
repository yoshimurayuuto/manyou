  # このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do


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

    visit task_path(id: @task.id)
    expect(page).to have_content 'test_task_01'
    expect(page).to have_content 'testtesttest'
  end





end
