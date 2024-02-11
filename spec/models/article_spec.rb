require "rails_helper"

RSpec.describe Article, type: :model do
  let(:article) { articles :article1 }
  let(:can_delete) { articles :can_delete }

  context "属性に関する共通テスト" do
    subject { can_delete }

    it_behaves_like "存在制約", %i[title body]
    it_behaves_like "値限定制約", :status, %w[public private archived], %w[NG]
    it_behaves_like "削除可能制約"

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


  #   describe "Article クラスについて" do
  #     context "order_sort_order" do
  #       subject { described_class.order_sort_order }
  #       it_behaves_like "昇順確認", 0, ->(o) { o.sort_order }
  #     end

  #     context "order_bar_desc" do
  #       subject { described_class.order_bar_desc }
  #       it_behaves_like "降順確認", 99999, ->(o) { o.bar }
  #     end
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
  #     end

  #     describe "get_or_create method" do
  #       subject { -> { described_class.get_or_create(*params) }}
  #       context '既存のものを取得' do
  #         let(:params) { [object.xxx, object.yyy] }
  #         it_behaves_like "オブジェクト数が変化しない?", Article
  #       end
  #
  #       context '新規作成' do
  #         let(:params) { [object.xxx, other.yyy] }
  #         it_behaves_like "オブジェクトが1増えるか?", Article
  #       end
  #     end
  #   end

  #   describe "一つの Article オブジェクトについて" do
  #     subject { article }

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

  context "複数の Article オブジェクトについて" do
    let!(:targets) { articles(*%i[article1 can_delete]) }
    subject { targets }

    it_behaves_like "配列メソッド呼び出し" do
      let(:test_set) do
        {
          archived?: [nil, [false, false]],
        }
      end
    end
  end
end