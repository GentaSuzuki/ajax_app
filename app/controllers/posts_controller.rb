class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC")
  end

  def create
    post = Post.create(content: params[:content], checked: false)#メモ作成時に情報保存する
    render json:{ post: post }#レスぽんんすをjsonに変更
  end
  def checked
    # binding.pry
    post = Post.find(params[:id])#既読したメモの該当するidを取得する
    if post.checked then#既読か否かを判定するプロパティ
      post.update(checked: false)#既読であれば解除する
    else
      post.update(checked: true)#既読じゃなければ既読にするためtrueへ
    end
    item = Post.find(params[:id])#更新したレコードを取得し直し
    render json: { post: item }#json形式としてchecked.jsに返却している
  end

end