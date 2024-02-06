# rubocop:disable all
require "rails_helper"

# RSpec.describe <%= class_name.pluralize %>Controller, type: :request do
#    let!(:<%= singular_table_name %>) { <%= plural_table_name %> :can_delete }
#    let!(:object) { <%= singular_table_name %> }
#    let!(:attrs) { object.attributes }
#    let(:not_mine) { <%= plural_table_name %> :not_mine }

#    let(:return_path) { <%= plural_table_name %>_path }
#    context "login by hkob" do
#      user_login :hkob

#      describe "GET #index" do
#        subject { -> { get <%= plural_table_name %>_path } }
#        context "owned object" do
#          let(:one) { <%= singular_table_name %> }
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
#      subject { -> { get new_<%= singular_table_name %>_path } }
#      context "owned object" do
#        let(:one) { <%= singular_table_name %> }
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
#      subject { -> { post <%= plural_table_name %>_path, params: {<%= singular_table_name %>: attrs} } }
#      context "owned object" do
#        let(:one) { <%= singular_table_name %> }
#        context "正しいパラメータに対して" do
#          it_behaves_like "レスポンスコード確認", 302
#          it_behaves_like "オブジェクトが1増えるか?", <%= class_name.singularize %>
#          it_behaves_like "リダイレクト確認"
#          it_behaves_like "Notice メッセージ確認", "XXXを登録しました。"
#        end

#        context "不正なパラメータに対して" do
#          before { attrs["name"] = "" }
#          it_behaves_like "レスポンスコード確認", 422
#          it_behaves_like "オブジェクト数が変化しない?", <%= class_name.singularize %>
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
#        subject { -> { get edit_<%= singular_table_name %>_path(one) } }
#        context "owned object" do
#          let(:one) { <%= singular_table_name %> }
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
#      subject { -> { patch <%= singular_table_name %>_path(one), params: {<%= singular_table_name %>: attrs} } }
#      context "owned object" do
#        let(:one) { object }
#        context "正しいパラメータに対して" do
#          before { attrs["sort_order"] = 1 }
#          it_behaves_like "レスポンスコード確認", 302
#          it_behaves_like "オブジェクト属性が変化した?", <%= class_name.singularize %>, :sort_order, 1
#          it_behaves_like "リダイレクト確認"
#          it_behaves_like "Notice メッセージ確認", "XXXを更新しました。"
#        end

#        context "不正なパラメータに対して" do
#          before { attrs["name"] = "" }
#          it_behaves_like "レスポンスコード確認", 422
#          it_behaves_like "オブジェクト属性が変化しない?", <%= class_name.singularize %>, :name
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
#      subject { -> { delete <%= singular_table_name %>_path(one) } }
#      context "owned object" do
#        let(:one) { <%= singular_table_name %> }
#        it_behaves_like "レスポンスコード確認", 303
#        it_behaves_like "オブジェクトが1減るか?", <%= class_name.singularize %>
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
#        subject { -> { get <%= singular_table_name %>_path(one) } }
#        context "owned object" do
#          let(:one) { <%= singular_table_name %> }
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
#       subject { -> { get <%= plural_table_name %>_path } }
#       it_behaves_like "レスポンスコード確認", 302
#       it_behaves_like "描画結果に文字列が含まれていない?", %w[表示されない文字列]
#     end
#   end
# end
