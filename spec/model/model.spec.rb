
RSpec.feature "バリデーション", type: :feature do
  it "is invalid without a name" do
    task = Task.new(name: nil)
    task.valid?
    expect(task.errors[:name]).to include("を入力してください")
    fill_in "task_name", with: 'nil'
    fill_in "task_content", with: 'コンテントテスト'
    click_button "登録"

    expect(page).to have_content 'nil'
    expect(page).to have_content 'コンテントテスト'
  end
end
