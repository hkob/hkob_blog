module ApplicationHelper
  # @param [Class] model モデルクラス
  # @param [Array<Symbol>] array アトリビュートkeyの配列
  # @param [Boolean] add_control 制御列を追加する時に true
  # @return [Temple::HTML::SafeString] ラベル行
  def labels(model, array, add_control: false)
    content_tag :tr do
      t_ars(model, array).each do |w|
        concat(content_tag :th, w)
      end
      if add_control
        concat(content_tag :th, I18n.t("common.control"))
      end
    end
  end

  # @param [Class] model モデルクラス
  # @param [Array<Symbols>] attr アトリビュートkey
  # @return [String, Array<String>] attrs が空の場合はモデル名，そうでない場合は attrs のアトリビュート名の配列または一つの値
  def t_ars(model, attrs = nil)
    if attrs.nil?
      model.model_name.human
    elsif attrs.is_a? Array
      attrs.map { |k| model.human_attribute_name k }
    else
      model.human_attribute_name attrs
    end
  end
end

