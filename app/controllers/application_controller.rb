class ApplicationController < ActionController::Base

  # @param [Class] model モデルクラス
  # @return [Object] オブジェクト
  def object_from_params_id(model)
    params[:id].try { |id| model.find id }
  end
end
