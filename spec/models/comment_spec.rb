require "rails_helper"

RSpec.describe Comment, type: :model do
  let(:comment) { comments :comment }
  let(:can_delete) { comments :can_delete }

  context "属性に関する共通テスト" do
    subject { can_delete }
    it_behaves_like "存在制約", %i[commenter body article_id status]
    it_behaves_like "削除可能制約"
    it_behaves_like "関連確認", :comment, has_many: %i[article]
    it_behaves_like "親削除時に自分も削除", :comment, %i[article]

    describe "body length check" do
      context "body is 10 characters" do
        before { subject.body = "a" * 10 }
        it { is_expected.to be_valid }
      end

      context "body is 9 characters" do
        before { subject.body = "a" * 9 }
        it { is_expected.to be_invalid }
      end
    end
  end

  describe "Comment クラスについて" do
    context "order_bar_desc" do
      subject { described_class.order_created_at_desc }
      it_behaves_like "降順確認", Date.today + 1, ->(o) { o.created_at }
    end
  end

  #
  #     context "Class methods" do
  #       subject { described_class }
  #       it_behaves_like "gp"
  #
  #       it_behaves_like "単一メソッド呼び出し" do
  #         let(:test_set) do
  #           {
  #               foo: [nil, [true, false, true]],
  #           }
  #         end
  #       end
  # end

  #     describe "get_or_create method" do
  #       subject { -> { described_class.get_or_create(*params) }}
  #       context '既存のものを取得' do
  #         let(:params) { [object.xxx, object.yyy] }
  #         it_behaves_like "オブジェクト数が変化しない?", Comment
  #       end
  #
  #       context '新規作成' do
  #         let(:params) { [object.xxx, other.yyy] }
  #         it_behaves_like "オブジェクトが1増えるか?", Comment
  #       end
  #     end
  #   end

  #   describe "一つの Comment オブジェクトについて" do
  #     subject { comment }

  #     it_behaves_like "配列内に存在?", %w[
  #       described_class.foo\ bar
  #     ]
  #     it_behaves_like "同じ?", %w[
  #       described_class.foo\ bar
  #     ]
  #     it_behaves_like "配列内に存在しない?", %w[
  #       described_class.foo\ bar
  #     ]
  #     it_behaves_like "一致しない?", %w[
  #       described_class.foo\ bar
  #     ]
  #   end

  #   context "複数の Comment オブジェクトについて" do
  #     let!(:targets) { comments(*%i[foo bar baz]) }
  #     subject { targets }

  #     it_behaves_like "配列メソッド呼び出し" do
  #       let(:test_set) do
  #         {
  #             foo: [nil, [true, false, true]],
  #         }
  #       end
  #     end
  #   end
end