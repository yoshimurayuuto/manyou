

require 'rails_helper'

RSpec.describe 'Tasks', type: :system do


describe 'Tasks' do

  before do
    @password = "000@gmail.com"
    @user = User.create(name: "000@gmail.com", email: "000@gmail.com", password: @password, password_confirmation: "000@gmail.com")
    visit new_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @password
    click_on 'Log in'
    @label = Label.create(name: "レナ")
    @task = Task.create(title: "111", status: "未着手", content: "4", priority: 1, expiration_date: "2019-10-24", user_id: @user.id, label: @label.name)
  end

  context "優先順位でソートする" do
    it "高中低で適切に並び替えられる" do
      visit new_task_path
      select "中", from: "task_priority"
      page.find("#task_priority").click
      expect(page).to have_text /.*高.*中.*低.*/
    end
  end

  context "検索する" do
    it "ステータスで検索できる" do
      visit tasks_path
      select "未着手", from: "task_status"
      click_button "検索する"
       expect(page).to have_content @task.status
    end
  end

  context "検索する" do
    it "タイトルで検索できる" do
      visit tasks_path
      fill_in "task_title", with: @task.title
      click_button "検索する"
      expect(page).to have_content @task.title
    end
  end

  context "タスクラベル" do
    it "ラベルにチェックが入っているかどうか" do
      visit new_task_path
      check @task.label
      expect(page).to have_checked_field('task[label_ids][]')
      click_button "登録する"
      expect(page).to have_content @task.label
    end
  end

  end
end
