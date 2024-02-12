# rubocop:disable all
require "rails_helper"

# RSpec.describe Users::OmniauthCallbacksController, type: :request do
#    let!(:users_omniauth_callback) { users_omniauth_callbacks :can_delete }
#    let!(:object) { users_omniauth_callback }
#    let!(:attrs) { object.attributes }
#    let(:not_mine) { users_omniauth_callbacks :not_mine }

#    let(:return_path) { users_omniauth_callbacks_path }
#    context "login by hkob" do
#      user_login :hkob

#      describe "GET #index" do
#        subject { -> { get users_omniauth_callbacks_path } }
#        context "owned object" do
#          let(:one) { users_omniauth_callback }
#          it_behaves_like "レスポンスコード確認", 200
#          it_behaves_like "描画結果に文字列が含まれている?", %w[XXX一覧]
#          it_behaves_like "描画結果に文字列が含まれていない?", "XXXの追加"
#        end

#        context "not owned object" do
#          let(:one) { not_mine }
#          it_behaves_like "レスポンスコード確認", 302
#          it_behaves_like "rootリダイレクト確認"
#        end
#      end

#    describe "GET #new" do
#      subject { -> { get new_users_omniauth_callback_path } }
#      context "owned object" do
#        let(:one) { users_omniauth_callback }
#        it_behaves_like "レスポンスコード確認", 200
#        it_behaves_like "描画結果に文字列が含まれている?", %w[XXX一覧]
#        it_behaves_like "描画結果に文字列が含まれていない?", "XXXの追加"
#      end

#      context "not owned object" do
#        let(:one) { not_mine }
#        it_behaves_like "レスポンスコード確認", 302
#        it_behaves_like "rootリダイレクト確認"
#      end
#    end

#    describe "POST #create" do
#      before { object.destroy }
#      subject { -> { post users_omniauth_callbacks_path, params: {users_omniauth_callback: attrs} } }
#      context "owned object" do
#        let(:one) { users_omniauth_callback }
#        context "正しいパラメータに対して" do
#          it_behaves_like "レスポンスコード確認", 302
#          it_behaves_like "オブジェクトが1増えるか?", Users::OmniauthCallback
#          it_behaves_like "リダイレクト確認"
#          it_behaves_like "Notice メッセージ確認", "XXXを登録しました。"
#        end

#        context "不正なパラメータに対して" do
#          before { attrs["name"] = "" }
#          it_behaves_like "レスポンスコード確認", 422
#          it_behaves_like "オブジェクト数が変化しない?", Users::OmniauthCallback
#          it_behaves_like "Alert メッセージ確認", "XXXの登録に失敗しました。"
#        end
#      end

#      context "not owned object" do
#        let(:attrs) { not_mine.attributes }
#        it_behaves_like "レスポンスコード確認", 302
#        it_behaves_like "rootリダイレクト確認"
#      end
#    end

#    describe "GET #edit" do
#      context "normal access" do
#        subject { -> { get edit_users_omniauth_callback_path(one) } }
#        context "owned object" do
#          let(:one) { users_omniauth_callback }
#          it_behaves_like "レスポンスコード確認", 200
#          it_behaves_like "描画結果に文字列が含まれている?", "XXXの編集"
#        end

#        context "not owned object" do
#          let(:one) { not_mine }
#          it_behaves_like "レスポンスコード確認", 302
#          it_behaves_like "rootリダイレクト確認"
#        end
#      end
#    end

#    describe "PATCH #update" do
#      subject { -> { patch users_omniauth_callback_path(one), params: {users_omniauth_callback: attrs} } }
#      context "owned object" do
#        let(:one) { object }
#        context "正しいパラメータに対して" do
#          before { attrs["sort_order"] = 1 }
#          it_behaves_like "レスポンスコード確認", 302
#          it_behaves_like "オブジェクト属性が変化した?", Users::OmniauthCallback, :sort_order, 1
#          it_behaves_like "リダイレクト確認"
#          it_behaves_like "Notice メッセージ確認", "XXXを更新しました。"
#        end

#        context "不正なパラメータに対して" do
#          before { attrs["name"] = "" }
#          it_behaves_like "レスポンスコード確認", 422
#          it_behaves_like "オブジェクト属性が変化しない?", Users::OmniauthCallback, :name
#          it_behaves_like "Alert メッセージ確認", "XXXの更新に失敗しました。"
#        end
#      end

#      context "not owned object" do
#        let(:one) { not_mine }
#        it_behaves_like "レスポンスコード確認", 302
#        it_behaves_like "rootリダイレクト確認"
#      end
#    end

#    describe "DELETE #destroy" do
#      subject { -> { delete users_omniauth_callback_path(one) } }
#      context "owned object" do
#        let(:one) { users_omniauth_callback }
#        it_behaves_like "レスポンスコード確認", 303
#        it_behaves_like "オブジェクトが1減るか?", Users::OmniauthCallback
#        it_behaves_like "リダイレクト確認"
#        it_behaves_like "Notice メッセージ確認", "XXXを削除しました。"
#      end

#      context "now owned object" do
#        let(:one) { not_mine }
#        it_behaves_like "レスポンスコード確認", 302
#        it_behaves_like "rootリダイレクト確認"
#      end
#    end

#      describe "GET #show" do
#        subject { -> { get users_omniauth_callback_path(one) } }
#        context "owned object" do
#          let(:one) { users_omniauth_callback }
#          it_behaves_like "レスポンスコード確認", 200
#          it_behaves_like "描画結果に文字列が含まれている?", %w[XXX表示: YYY]
#        end

#        context "now owned object" do
#          let(:one) { not_mine }
#          it_behaves_like "レスポンスコード確認", 302
#          it_behaves_like "rootリダイレクト確認"
#        end
#      end
#    end

#    context "not login" do
#     describe "GET #index" do
#       subject { -> { get users_omniauth_callbacks_path } }
#       it_behaves_like "レスポンスコード確認", 302
#       it_behaves_like "描画結果に文字列が含まれていない?", %w[表示されない文字列]
#     end
#   end
# end
