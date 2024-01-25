require "rails_helper"

describe ApplicationHelper, type: :helper do
  subject { helper }

  describe "common test" do
    it_behaves_like "単一メソッド呼び出し" do
      let(:test_set) do
        {
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
