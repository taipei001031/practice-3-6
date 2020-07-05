class TodolistsController < ApplicationController
  def new
  	@list = List.new
  end

  def index
  	@lists = List.all
  end

  def show
  	@list = List.find(params[:id])
  end

    def create
    # ストロングパラメーターを使用
    list = List.new(list_params)
    # DBへ保存する
    list.save
    # トップ画面へリダイレクト
    redirect_to todolist_path(list.id)
  end
  
  private
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
