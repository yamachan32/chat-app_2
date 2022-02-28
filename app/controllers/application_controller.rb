class ApplicationController < ActionController::Base
    # deviseアクション ユーザーのサインイン状態で画面遷移振り分け
    before_action :authenticate_user! 

    # deviseカラムのパラメータ設定 deviseコントローラーへ振り分ける時に実行
    before_action :configure_permitted_parameters, if: :devise_controller?

    private
    # sanitizerメソッド deviseコントローラーはパラメーター設定編集ができない
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
