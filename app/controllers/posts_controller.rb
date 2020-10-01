class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id:"DESC")
  end

  def create
    post= Post.create(content:params[:content],checked: false)#メモ作成時に未読の情報を保存する
    render json:{ post: post }#レスポンスjson形式に変更
  end
end
