require "rails_helper"

RSpec.describe ArticlesController, type: :request do
  let!(:article) { articles :can_delete }
  let!(:object) { article }
  let!(:attrs) { object.attributes }
  let(:not_mine) { articles :article1 }

  context "when not login" do
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
  end

  context "when login by cannot_delete" do
    user_login :cannot_delete

    describe "GET #new" do
      subject { -> { get new_article_path } }
      it_behaves_like "レスポンスコード確認", 200
      it_behaves_like "描画結果に文字列が含まれている?", %w[記事作成 タイトル 本文]
    end

    describe "POST #create" do
      before { object.destroy }
      subject { -> { post articles_path, params: {article: attrs} } }
      let(:return_path) { article_path(Article.order(created_at: :desc).first) }
      context "正しいパラメータに対して" do
        it_behaves_like "レスポンスコード確認", 302
        it_behaves_like "オブジェクトが1増えるか?", Article
        it_behaves_like "リダイレクト確認"
        it_behaves_like "Notice メッセージ確認", "記事を登録しました。"
      end

      context "不正なパラメータに対して" do
        before { attrs["title"] = "" }
        it_behaves_like "レスポンスコード確認", 422
        it_behaves_like "オブジェクト数が変化しない?", Article
        it_behaves_like "Alert メッセージ確認", "記事の登録に失敗しました。"
      end
    end

    describe "GET #edit" do
      subject { -> { get edit_article_path(one) } }
      context "when owned object" do
        let(:one) { object }
        it_behaves_like "レスポンスコード確認", 200
        it_behaves_like "描画結果に文字列が含まれている?", "記事更新"
      end

      context "when not owned object" do
        let(:one) { not_mine }
        it_behaves_like "レスポンスコード確認", 302
        it_behaves_like "rootリダイレクト確認"
      end
    end

    describe "PATCH #update" do
      subject { -> { patch article_path(one), params: {article: attrs} } }
      context "when owned object" do
        let(:one) { object }
        let(:return_path) { article_path(object) }
        context "正しいパラメータに対して" do
          before { attrs["title"] = "ABC" }
          it_behaves_like "レスポンスコード確認", 302
          it_behaves_like "オブジェクト属性が変化した?", Article, :title, "ABC"
          it_behaves_like "リダイレクト確認"
          it_behaves_like "Notice メッセージ確認", "記事を更新しました。"
        end

        context "不正なパラメータに対して" do
          before { attrs["title"] = "" }
          it_behaves_like "レスポンスコード確認", 422
          it_behaves_like "オブジェクト属性が変化しない?", Article, :title
          it_behaves_like "Alert メッセージ確認", "記事の更新に失敗しました。"
        end
      end

      context "when not owned object" do
        let(:one) { not_mine }
        it_behaves_like "レスポンスコード確認", 302
        it_behaves_like "rootリダイレクト確認"
      end
    end

    describe "DELETE #destroy" do
      subject { -> { delete article_path(one) } }
      context "when owned object" do
        let(:one) { object }
        let(:return_path) { articles_path }
        it_behaves_like "レスポンスコード確認", 303
        it_behaves_like "オブジェクトが1減るか?", Article
        it_behaves_like "リダイレクト確認"
        it_behaves_like "Notice メッセージ確認", "記事を削除しました。"
      end

      context "when not owned object" do
        let(:one) { not_mine }
        it_behaves_like "レスポンスコード確認", 302
        it_behaves_like "rootリダイレクト確認"
      end
    end

  end
end
