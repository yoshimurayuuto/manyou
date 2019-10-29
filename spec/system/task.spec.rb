

require 'rails_helper'

RSpec.describe 'Tasks', type: :system do
  it 'priority' do
    visit tasks_path


  end
end
describe 'Tasks' do
  describe '#priority' do
# it "search_title_and_search_task" do
  # fill_in "task_title", with: '9'
  # fill_in "task_status", with: '1'
  before do



  end

  # task = Task.new(title: "9", status: 1)
  # context "search" do
  context "優先順位でソートする'" do
    it "高中低で適切に並び替えられる" do
      Task.create!(title: "9", status: "1", content: "4", priority: 1, expiration_date: "2019-10-24")
      Task.create!(title: "9", status: "1", content: "4", priority: 2, expiration_date: "2019-10-24")
      Task.create!(title: "9", status: "1", content: "4", priority: 0, expiration_date: "2019-10-24")

      visit tasks_path
      # save_and_open_page

      page.find("#sort_priority").click
      expect(page).to have_text /.*高.*中.*低.*/
    end
    # it "doesn't return @task" do
    #   expect(Task.search_with_title("9")).to_not include(@task2)
    # end
  end

end
end
