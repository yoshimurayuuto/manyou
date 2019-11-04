require 'rails_helper'

RSpec.describe 'Tasks', type: :system do


describe 'Users' do
  describe '#sessions/new' do
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
  context "未ログインユーザーの場合" do
    it "redirects to the sign-in page" do
      get :index
      expect(response).to redirect_to "/sessions/new"
    end
  end
  end
end
end
