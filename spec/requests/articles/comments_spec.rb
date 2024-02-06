require "rails_helper"

RSpec.describe Articles::CommentsController, type: :request do
  let!(:comment) { comments :can_delete }
  let!(:object) { comment }
  let!(:article) { object.article }
  let!(:attrs) { object.attributes }
  #    let(:not_mine) { comments :not_mine }

  let(:return_path) { article_path(article) }
  #    context "login by hkob" do
  #      user_login :hkob

  #      describe "GET #index" do
  #        subject { -> { get article_comments_path } }
  #        context "owned object" do
  #          let(:one) { comment }
  #          it_behaves_like "レスポンスコード確認", 200
  #          it_behaves_like "描画結果に文字列が含まれている?", %w[コメント一覧]
  #          it_behaves_like "描画結果に文字列が含まれていない?", "コメントの追加"
  #        end

  #        context "not owned object" do
  #          let(:one) { not_mine }
  #          it_behaves_like "レスポンスコード確認", 302
  #          it_behaves_like "rootリダイレクト確認"
  #        end
  #      end

  #    describe "GET #new" do
  #      subject { -> { get new_article_comment_path } }
  #      context "owned object" do
  #        let(:one) { comment }
  #        it_behaves_like "レスポンスコード確認", 200
  #        it_behaves_like "描画結果に文字列が含まれている?", %w[コメント一覧]
  #        it_behaves_like "描画結果に文字列が含まれていない?", "コメントの追加"
  #      end

  #      context "not owned object" do
  #        let(:one) { not_mine }
  #        it_behaves_like "レスポンスコード確認", 302
  #        it_behaves_like "rootリダイレクト確認"
  #      end
  #    end

  describe "POST #create" do
    before { object.destroy }
    subject { -> { post article_comments_path(article), params: {comment: attrs} } }
    context "正しいパラメータに対して" do
      it_behaves_like "レスポンスコード確認", 302
      it_behaves_like "オブジェクトが1増えるか?", Comment
      it_behaves_like "リダイレクト確認"
      it_behaves_like "Notice メッセージ確認", "コメントを登録しました。"
    end

    context "不正なパラメータに対して" do
      before { attrs["commenter"] = "" }
      it_behaves_like "レスポンスコード確認", 422
      it_behaves_like "オブジェクト数が変化しない?", Comment
      it_behaves_like "Alert メッセージ確認", "コメントの登録に失敗しました。"
    end
  end

  #      context "not owned object" do
  #        let(:attrs) { not_mine.attributes }
  #        it_behaves_like "レスポンスコード確認", 302
  #        it_behaves_like "rootリダイレクト確認"
  #      end
  #    end

  #    describe "GET #edit" do
  #      context "normal access" do
  #        subject { -> { get edit_article_comment_path(one) } }
  #        context "owned object" do
  #          let(:one) { comment }
  #          it_behaves_like "レスポンスコード確認", 200
  #          it_behaves_like "描画結果に文字列が含まれている?", "コメントの編集"
  #        end

  #        context "not owned object" do
  #          let(:one) { not_mine }
  #          it_behaves_like "レスポンスコード確認", 302
  #          it_behaves_like "rootリダイレクト確認"
  #        end
  #      end
  #    end

  #    describe "PATCH #update" do
  #      subject { -> { patch article_comment_path(one), params: {comment: attrs} } }
  #      context "owned object" do
  #        let(:one) { object }
  #        context "正しいパラメータに対して" do
  #          before { attrs["sort_order"] = 1 }
  #          it_behaves_like "レスポンスコード確認", 302
  #          it_behaves_like "オブジェクト属性が変化した?", Comment, :sort_order, 1
  #          it_behaves_like "リダイレクト確認"
  #          it_behaves_like "Notice メッセージ確認", "コメントを更新しました。"
  #        end

  #        context "不正なパラメータに対して" do
  #          before { attrs["name"] = "" }
  #          it_behaves_like "レスポンスコード確認", 422
  #          it_behaves_like "オブジェクト属性が変化しない?", Comment, :name
  #          it_behaves_like "Alert メッセージ確認", "コメントの更新に失敗しました。"
  #        end
  #      end

  #      context "not owned object" do
  #        let(:one) { not_mine }
  #        it_behaves_like "レスポンスコード確認", 302
  #        it_behaves_like "rootリダイレクト確認"
  #      end
  #    end

  #    describe "DELETE #destroy" do
  #      subject { -> { delete article_comment_path(one) } }
  #      context "owned object" do
  #        let(:one) { comment }
  #        it_behaves_like "レスポンスコード確認", 303
  #        it_behaves_like "オブジェクトが1減るか?", Comment
  #        it_behaves_like "リダイレクト確認"
  #        it_behaves_like "Notice メッセージ確認", "コメントを削除しました。"
  #      end

  #      context "now owned object" do
  #        let(:one) { not_mine }
  #        it_behaves_like "レスポンスコード確認", 302
  #        it_behaves_like "rootリダイレクト確認"
  #      end
  #    end

  #      describe "GET #show" do
  #        subject { -> { get article_comment_path(one) } }
  #        context "owned object" do
  #          let(:one) { comment }
  #          it_behaves_like "レスポンスコード確認", 200
  #          it_behaves_like "描画結果に文字列が含まれている?", %w[コメント表示: YYY]
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
  #       subject { -> { get article_comments_path } }
  #       it_behaves_like "レスポンスコード確認", 302
  #       it_behaves_like "描画結果に文字列が含まれていない?", %w[表示されない文字列]
  #     end
  #   end
end
