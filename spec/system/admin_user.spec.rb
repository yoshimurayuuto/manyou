# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています

  require 'rails_helper'
  RSpec.describe 'Tasks', type: :system do
    describe 'Tasks' do
      describe '#priority' do

      before do
        Task.create!(title: "9", status: "完了", content: "4", priority: 1, expiration_date: "2019-10-24")
        Task.create!(title: "5", status: "未完了", content: "4", priority: 2, expiration_date: "2019-10-24")
        Task.create!(title: "19", status: "未着手", content: "4", priority: 0, expiration_date: "2019-10-24")
      end


      context "ユーザ一覧のテスト" do
        it "一覧" do
          visit admin_users_path
          expect(page).to have_content '名前'
          expect(page).to have_content 'メールアドレス'
        end
      end
      context "ユーザー作成のテスト" do
        it "作成" do
          task = Task.new(name: 'アテネ', email: "000@gmail.com", password: "000@gmail.com", password_confirmation: "000@gmail.com")
          visit new_admin_user_path
          fill_in "admin_user_name", with: 'ミカエル'
          click_button "登録"
          expect(page).to have_content 'ミカエル'
        end
      end
        context "ユーザー詳細のテスト" do
          it "詳細" do
            visit admin_user_path(id: @user.id)
            expect(page).to have_content '作成したタスクのタイトル:'
            expect(page).to have_content '作成したタスクのステータス:'
          end
        end
        context "ユーザー更新のテスト" do
          it "更新" do
            # task = Task.update(name: 'アテネ', email: "000@gmail.com", password: "000@gmail.com", password_confirmation: "000@gmail.com")
            visit admin_user_path(id: @user.id)
            patch :update, params: {name: 'アテネ', email: "000@gmail.com", password: "000@gmail.com", password_confirmation: "000@gmail.com"}
            fill_in "admin_user_name", with: 'ミカエル'
            click_button "更新"
            expect(page).to have_content 'ミカエル'
          end
        end
        context "ユーザー削除のテスト" do
          it "削除" do
            visit admin_user_path(id: @user.id)
            delete :destroy, params: { id: @user.id }
            click_button "削除"
            expect(page).to have_content 'ミカエル'
          end
        end

      end
    end
  end
