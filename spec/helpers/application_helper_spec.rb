require "rails_helper"

describe ApplicationHelper, type: :helper do
  subject { helper }

  describe "common test" do
    it_behaves_like "単一メソッド呼び出し" do
      let(:article) { articles :can_delete }
      let(:test_set) do
        {
          controller_action_and_params: [
            articles_path, {controller: "articles", action: "index"},
            article_path(article), {controller: "articles", action: "show", id: article.id.to_s},
            new_article_path, {controller: "articles", action: "new"},
            [articles_path, :post], {controller: "articles", action: "create"},
            edit_article_path(article), {controller: "articles", action: "edit", id: article.id.to_s},
            [article_path(article), :patch], {controller: "articles", action: "update", id: article.id.to_s},
            [article_path(article), :delete], {controller: "articles", action: "destroy", id: article.id.to_s},
          ],
          controller_and_action: [
            articles_path, %w[articles index],
            article_path(article), %w[articles show],
            new_article_path, %w[articles new],
            [articles_path, :post],  %w[articles create],
            edit_article_path(article),  %w[articles edit],
            [article_path(article), :patch],  %w[articles update],
            [article_path(article), :delete],  %w[articles destroy],
          ],
          key_from_cap: [
            [{controller: "articles", action: "index"}, :title], "記事一覧",
            [{controller: "articles", action: "show"}, :link_title], "表示",
          ],
          link_title_from_cap: [
            [{controller: "articles", action: "index"}], "記事一覧",
            [{controller: "articles", action: "show"}], "表示",
          ],
          link_title_from_path: [
            articles_path, "記事一覧",
            article_path(article), "表示",
          ],
          link_title_with_path: [
            articles_path, ["記事一覧", articles_path],
            article_path(article), ["表示", article_path(article)],
          ],
          title_from_cap: [
            [{controller: "articles", action: "index"}], "記事一覧",
            [{controller: "articles", action: "show"}], "記事詳細",
          ],
          title_from_path: [
            articles_path, "記事一覧",
            article_path(article), "記事詳細",
          ],
          t_ars: [
            [Article], "記事",
            [Article, :title], "タイトル",
            [Article, :body], "本文",
            [Article, %i[title body]], %w[タイトル 本文],
          ]
        }
      end
    end

    it_behaves_like "単一メソッド呼び出し(キーワード引数あり)" do
      let(:test_set) do
        {
          labels: [
            [Article, %i[title body]], {}, "<tr><th>タイトル</th><th>本文</th></tr>",
            [Article, %i[title]], {add_control: true}, "<tr><th>タイトル</th><th>制御</th></tr>",
          ],
        }
      end
    end
  end
end
