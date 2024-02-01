require "rails_helper"

# RSpec.describe Comment, type: :model do
#   let(:comment) { comments :comment }
#   let(:can_delete) { comments :can_delete }
#   let(:shinagawa) { campuses :shinagawa }
#   let(:arakawa) { campuses :arakawa }
#   let(:both) { campuses :both }

#   context "属性に関する共通テスト" do
#     subject { can_delete }
#     let(:another_object) { comments :another_object }

#     it_behaves_like "存在制約", %i[]
#     it_behaves_like "一意制約", %i[]
#     it_behaves_like "複合一意制約", %i[]
#     it_behaves_like "削除可能制約"
#     it_behaves_like "削除不可制約"
#     it_behaves_like "関連確認", :comment, has_many: %i[], has_one: %i[], children: :optional, child: :optional
#     it_behaves_like "親削除時に自分も削除", :comment, %i[has_many has_one]
#     it_behaves_like "親は削除不可", :comment, %i[has_many has_one]
#     it_behaves_like "親削除時にnullを設定", :comment, %i[has_many has_one]
#   end

#   describe "Comment クラスについて" do
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
# end