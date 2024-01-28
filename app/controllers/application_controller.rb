class ApplicationController < ActionController::Base

  # @param [Class] klass 表示するクラス
  # @return [String] 表示する alert message
  # @see https://hkob.hatenablog.com/entry/2023/12/17/050000
  def alert_message(klass, acn = nil)
    I18n.t "flash.#{acn || action_name}.alert", **{obj: klass.model_name.human}
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
