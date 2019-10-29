

  describe 'User' do
    describe '#search' do
  # it "search_title_and_search_task" do
    # fill_in "task_title", with: '9'
    # fill_in "task_status", with: '1'
    before do
      @task = Task.create(title: "9", status: "1", content: "4", priority: 1)
    
    end

    # task = Task.new(title: "9", status: 1)
    # context "search" do
    context "search by '9'" do
      it "returns @task" do
        expect(Task.search_with_title("9")).to include(@task)
      end
      # it "doesn't return @task" do
      #   expect(Task.search_with_title("9")).to_not include(@task2)
      # end
    end

  end
end

# describe 'priority' do
#   it "priority" do
#     tasks = Task.order("priority desc")
#     expect(tasks).to have_content 1
#   end
# end
