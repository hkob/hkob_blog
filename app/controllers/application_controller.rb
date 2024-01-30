class ApplicationController < ActionController::Base

  # @param [Class] klass 表示するクラス
  # @return [String] 表示する alert message
  # @see https://hkob.hatenablog.com/entry/2023/12/17/050000
  def alert_message(klass, acn = nil)
    I18n.t "flash.#{acn || action_name}.alert", **{obj: klass.model_name.human}
  end

  # @param [Class] klass 表示するクラス
  # @param [String, nil] turbo_frame Turbo Frame 名
  # @return [Hash] Turbo Frame 用の Hash (data あり)
  # @see https://hkob.hatenablog.com/entry/2023/12/18/050000
  def confirm_destroy(klass, turbo_frame: nil)
    ans = {data: {turbo_method: :delete, turbo_confirm: confirm_destroy_message(klass)}}
    ans[:data][:turbo_frame] = turbo_frame if turbo_frame
    ans
  end
  helper_method :confirm_destroy

  # @param [Class] klass 表示するクラス
  # @return [String] 表示する notice message
  # @see https://hkob.hatenablog.com/entry/2023/12/18/050000
  def confirm_destroy_message(klass)
    I18n.t "confirm.destroy", **{obj: klass.model_name.human}
  end

  # @param [Class] model モデルクラス
  # @return [Object] オブジェクト
  # @see https://hkob.hatenablog.com/entry/2023/12/19/050000
  def object_from_params_id(model)
    params[:id].try { |id| model.find id }
  end

  # @param [Class] klass 表示するクラス
  # @return [String] 表示する notice message
  # @see https://hkob.hatenablog.com/entry/2023/12/17/050000
  def notice_message(klass, acn = nil)
    I18n.t "flash.#{acn || action_name}.notice", **{obj: klass.model_name.human}
  end
  helper_method :notice_message
end
