require "rails_helper"

# RSpec.describe <%= class_name %>, type: :model do
#   let(:<%= singular_table_name %>) { <%= plural_table_name %> :<%= singular_table_name %> }
#   let(:can_delete) { <%= plural_table_name %> :can_delete }
#   let(:shinagawa) { campuses :shinagawa }
#   let(:arakawa) { campuses :arakawa }
#   let(:both) { campuses :both }

#   context "属性に関する共通テスト" do
#     subject { can_delete }
#     let(:another_object) { <%= plural_table_name %> :another_object }

#     it_behaves_like "存在制約", %i[]
#     it_behaves_like "一意制約", %i[]
#     it_behaves_like "複合一意制約", %i[]
#     it_behaves_like "削除可能制約"
#     it_behaves_like "削除不可制約"
#     it_behaves_like "関連確認", :<%= singular_table_name %>, has_many: %i[], has_one: %i[], children: :optional, child: :optional
#     it_behaves_like "親削除時に自分も削除", :<%= singular_table_name %>, %i[has_many has_one]
#     it_behaves_like "親は削除不可", :<%= singular_table_name %>, %i[has_many has_one]
#     it_behaves_like "親削除時にnullを設定", :<%= singular_table_name %>, %i[has_many has_one]
#   end

#   describe "<%= class_name %> クラスについて" do
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
#         it_behaves_like "オブジェクト数が変化しない?", <%= class_name %>
#       end
#
#       context '新規作成' do
#         let(:params) { [object.xxx, other.yyy] }
#         it_behaves_like "オブジェクトが1増えるか?", <%= class_name %>
#       end
#     end
#   end

#   describe "一つの <%= class_name %> オブジェクトについて" do
#     subject { <%= singular_table_name %> }

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

#   context "複数の <%= class_name %> オブジェクトについて" do
#     let!(:targets) { <%= plural_table_name %>(*%i[foo bar baz]) }
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