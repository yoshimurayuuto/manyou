

require 'rails_helper'

RSpec.describe 'Tasks', type: :system do


describe 'Tasks' do
  describe '#priority' do
# it "search_title_and_search_task" do
  # fill_in "task_title", with: '9'
  # fill_in "task_status", with: '1'
  before do
    Task.create!(title: "9", status: "完了", content: "4", priority: 1, expiration_date: "2019-10-24")
    Task.create!(title: "5", status: "未完了", content: "4", priority: 2, expiration_date: "2019-10-24")
    Task.create!(title: "19", status: "未着手", content: "4", priority: 0, expiration_date: "2019-10-24")
  end

  # task = Task.new(title: "9", status: 1)
  # context "search" do
  context "優先順位でソートする" do
    it "高中低で適切に並び替えられる" do
      visit tasks_path
    page.find("#sort_priority").click
      expect(page).to have_text /.*高.*中.*低.*/
    end

  end
  context "検索する" do
    it "タイトルで検索できる" do
      visit tasks_path
      page.find("#task_title").click
      expect(page).to have_text /.*9.*5.*19.*/
    end
  end
    context "検索する" do
      it "ステータスで検索できる" do
        visit tasks_path
        page.find("#task_status").click
        expect(page).to have_text /.*完了.*未完了.*未着手.*/
      end
    end

    context "タスクラベル" do
      it "ラベル実装" do
        visit new_task_path
        click_button "登録"
        expect(page).to have_content '登録する'
      end

    end

  end
end
end
