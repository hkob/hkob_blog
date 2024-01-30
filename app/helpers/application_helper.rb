module ApplicationHelper
  # @param [String] path path 名
  # @param [Symbol, nil] method メソッド名
  # @return [Hash] コントローラ名とアクション名およびパラメータのハッシュ
  def controller_action_and_params(path, method = :get)
    Rails.application.routes.recognize_path(path, method: method)
  end

  # @param [String] path path 名
  # @param [Symbol,nil] method メソッド名
  # @return [Array<String>] コントローラ名とアクション名の配列
  # @see https://hkob.hatenablog.com/entry/2024/01/01/050000
  def controller_and_action(path, method = :get)
    controller_action_and_params(path, method).values_at(:controller, :action)
  end

  # @param [String] path path 名
  # @param [Class] model モデルクラス
  # @param [String, nil] title タイトル
  # @param [Hash] option 追加オプション
  # @see https://hkob.hatenablog.com/entry/2024/01/08/050000
  def destroy_lotfp(path, model, title: nil, option: {})
    lotfp path, :delete, title: title, option: option.merge(confirm_destroy(model))
  end

  # @param [form] form
  # @param [Object] model
  # @param [Symbol] symbol
  # @param [String, nil] add_text
  # @return [Temple::HTML::SafeString] form 用の label
  # @note form_label_and_error
  # @note https://hkob.hatenablog.com/entry/2024/01/10/050000
  def form_label_and_error(form, model, symbol, add_text: nil)
    content_tag :div do
      concat form.label symbol
      if add_text
        concat content_tag(:span, add_text)
      end
      if (error_messages = model.errors.full_messages_for(symbol)).present?
        concat content_tag(:br)
        concat content_tag(:span, error_messages.join(", "), class: "error_message")
      end
    end
  end

  # @param [Hash] cap コントローラ名・アクション名・パラメータのハッシュ
  # @param [Symbol] key
  def key_from_cap(cap, key)
    t key, scope: cap.values_at(:controller, :action).map { |x| x.tr "/", "." }
  end

  # @param [Class] model モデルクラス
  # @param [Array<Symbol>] array アトリビュートkeyの配列
  # @param [Boolean] add_control 制御列を追加する時に true
  # @return [Temple::HTML::SafeString] ラベル行
  # @see https://hkob.hatenablog.com/entry/2023/12/31/050000
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

  # @param [Hash] cap コントローラ名・アクション名・パラメータのハッシュ
  # @return [String] リンクタイトル
  def link_title_from_cap(cap)
    ans = key_from_cap cap, :link_title
    ans = title_from_cap(cap) if ans =~ /translation_missing/
    ans
  end

  # @param [String] path path 名
  # @param [Symbol,nil] method メソッド名
  # @return [String] タイトル
  def link_title_from_path(path, method = :get)
    link_title_from_cap(controller_action_and_params(path, method))
  end

  # @param [String] path path 名
  # @param [Symbol,nil] method メソッド名
  # @return [Array<String>] タイトルとパスの配列
  def link_title_with_path(path, method = :get)
    [link_title_from_path(path, method), path]
  end

  # @param [String] path
  # @param [Symbol, nil] method
  # @return [ActiveSupport::SafeBuffer, String] リンクまたは文字列
  # @note lotfp -> link_or_title_from_path
  def lotfp(path, method = nil, cond: true, title: nil, option: {})
    cap = controller_action_and_params(path, method)
    # 権限周りはスキップ
    hp = true # controller.acp(privileges_from_cap(cap), cap)
    title ||= link_title_from_cap(cap)
    (cond && hp) ? link_to(title, path, {data: {turbo_method: method}}.merge(option)) : title
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

  # @param [Hash] cap コントローラ名・アクション名・パラメータのハッシュ
  # @return [String] タイトル
  def title_from_cap(cap)
    key_from_cap cap, :title
  end

  # @param [String] path path 名
  # @param [Symbol,nil] method メソッド名
  # @return [String] タイトル
  def title_from_path(path, method = :get)
    title_from_cap controller_action_and_params(path, method)
  end
end

