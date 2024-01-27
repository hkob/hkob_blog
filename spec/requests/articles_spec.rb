require "rails_helper"

RSpec.describe ArticlesController, type: :request do
  let!(:article) { articles :can_delete }
  let!(:object) { article }
  # let!(:attrs) { object.attributes }
  # let(:not_mine) { articles :not_mine }

  # let(:return_path) { articles_path }
  # context "login by hkob" do
  #   user_login :hkob

  describe "GET #index" do
    subject { -> { get articles_path } }
    it_behaves_like "レスポンスコード確認", 200
    it_behaves_like "描画結果に文字列が含まれている?", %w[記事一覧 タイトル]
  end

  describe "GET #show" do
    subject { -> { get article_path(object) } }
    it_behaves_like "レスポンスコード確認", 200
    it_behaves_like "描画結果に文字列が含まれている?", %w[This is the second article]
  end

  describe "GET #new" do
    subject { -> { get new_article_path } }
    it_behaves_like "レスポンスコード確認", 200
    it_behaves_like "描画結果に文字列が含まれている?", %w[記事作成 タイトル 本文]
  end

  # describe "POST #create" do
  #   before { object.destroy }
  #   subject { -> { post articles_path, params: {article: attrs} } }
  #   context "owned object" do
  #     let(:one) { article }
  #     context "正しいパラメータに対して" do
  #       it_behaves_like "レスポンスコード確認", 303
  #       it_behaves_like "オブジェクトが1増えるか?", Article
  #       it_behaves_like "リダイレクト確認"
  #       it_behaves_like "Notice メッセージ確認", "XXXを登録しました。"
  #     end

  #     context "不正なパラメータに対して" do
  #       before { attrs["name"] = "" }
  #       it_behaves_like "レスポンスコード確認", 422
  #       it_behaves_like "オブジェクト数が変化しない?", Article
  #       it_behaves_like "Alert メッセージ確認", "XXXの登録に失敗しました。"
  #     end
  #   end

  #   context "not owned object" do
  #     let(:attrs) { not_mine.attributes }
  #     it_behaves_like "レスポンスコード確認", 302
  #     it_behaves_like "rootリダイレクト確認"
  #   end
  # end

  # describe "GET #edit" do
  #   context "normal access" do
  #     subject { -> { get edit_article_path(one) } }
  #     context "owned object" do
  #       let(:one) { article }
  #       it_behaves_like "レスポンスコード確認", 200
  #       it_behaves_like "描画結果に文字列が含まれている?", "XXXの編集"
  #     end

  #     context "not owned object" do
  #       let(:one) { not_mine }
  #       it_behaves_like "レスポンスコード確認", 302
  #       it_behaves_like "rootリダイレクト確認"
  #     end
  #   end
  # end

  # describe "PATCH #update" do
  #   subject { -> { patch article_path(one), params: {article: attrs} } }
  #   context "owned object" do
  #     let(:one) { object }
  #     context "正しいパラメータに対して" do
  #       before { attrs["sort_order"] = 1 }
  #       it_behaves_like "レスポンスコード確認", 302
  #       it_behaves_like "オブジェクト属性が変化した?", Article, :sort_order, 1
  #       it_behaves_like "リダイレクト確認"
  #       it_behaves_like "Notice メッセージ確認", "XXXを更新しました。"
  #     end

  #     context "不正なパラメータに対して" do
  #       before { attrs["name"] = "" }
  #       it_behaves_like "レスポンスコード確認", 422
  #       it_behaves_like "オブジェクト属性が変化しない?", Article, :name
  #       it_behaves_like "Alert メッセージ確認", "XXXの更新に失敗しました。"
  #     end
  #   end

  #   context "not owned object" do
  #     let(:one) { not_mine }
  #     it_behaves_like "レスポンスコード確認", 302
  #     it_behaves_like "rootリダイレクト確認"
  #   end
  # end

  # describe "DELETE #destroy" do
  #   subject { -> { delete article_path(one) } }
  #   context "owned object" do
  #     let(:one) { article }
  #     it_behaves_like "レスポンスコード確認", 302
  #     it_behaves_like "オブジェクトが1減るか?", Article
  #     it_behaves_like "リダイレクト確認"
  #     it_behaves_like "Notice メッセージ確認", "XXXを削除しました。"
  #   end

  #   context "now owned object" do
  #     let(:one) { not_mine }
  #     it_behaves_like "レスポンスコード確認", 302
  #     it_behaves_like "rootリダイレクト確認"
  #   end
  # end

  # context "not login" do
  #  describe "GET #index" do
  #    subject { -> { get articles_path } }
  #    it_behaves_like "レスポンスコード確認", 302
  #    it_behaves_like "描画結果に文字列が含まれていない?", %w[表示されない文字列]
  #  end
  # end
end
