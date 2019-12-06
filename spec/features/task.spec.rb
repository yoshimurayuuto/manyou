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
     User.create(name: "000@gmail.com", email: "000@gmail.com", password: "000@gmail.com", password_confirmation: "000@gmail.com")
   end
  # scenario（itのalias）の中に、確認したい各項目のテストの処理を書きます。
  scenario "タスク一覧のテスト" do
    visit new_session_path
    # save_and_open_page
    fill_in 'Email', with: '000@gmail.com'
    fill_in 'Password', with: '000@gmail.com'
    # ログインボタンをクリックする
    click_on 'Log in'
    # tasks_pathにvisitする（タスク一覧ページに遷移する）
    visit tasks_path
    expect(page).to have_content '未完了'
    expect(page).to have_content 'タイトル'
  end

  scenario "タスク作成のテスト" do
    visit new_session_path
    save_and_open_page
    fill_in 'Email', with: '000@gmail.com'
    fill_in 'Password', with: '000@gmail.com'
    click_on 'Log in'
    visit new_task_path
    task = Task.create(title: "1", content: "1", expiration_date: 1964)
    click_on "登録する"
  end

  scenario "タスク詳細のテスト" do
    visit new_session_path
    save_and_open_page
    fill_in 'Email', with: '000@gmail.com'
    fill_in 'Password', with: '000@gmail.com'
    click_on 'Log in'
    visit task_path(@task.id)
    expect(page).to have_content 'ブログ詳細画面'
    expect(page).to have_content 'ブログ詳細画面'
  end





end
