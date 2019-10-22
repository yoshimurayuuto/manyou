# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do
  # scenario（itのalias）の中に、確認したい各項目のテストの処理を書きます。
  scenario "タスク一覧のテスト" do
    @task = Task.create!(name: 'test_task_01', content: 'testtesttest')
    @task = Task.create!(name: 'test_task_02', content: 'samplesample')

    # tasks_pathにvisitする（タスク一覧ページに遷移する）
    visit tasks_path


    # visitした（到着した）expect(page)に（タスク一覧ページに）「testtesttest」「samplesample」という文字列が
    # have_contentされているか？（含まれているか？）ということをexpectする（確認・期待する）テストを書いている
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end
  scenario "タスク作成のテスト" do
    @task = Task.create!(name: 'test_task_01', content: 'testtesttest')
    @task = Task.create!(name: 'test_task_02', content: 'samplesample')

    visit new_task_path


    fill_in "task_name", with: @task.name
    fill_in "task_content", with: @task.content

    click_button "Create Task"
    save_and_open_page
    expect(page).to have_content 'ブログ'
    expect(page).to have_content 'samplesample'

  end

  scenario "タスク詳細のテスト" do

    end
end
