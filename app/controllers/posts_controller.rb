class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id:"DESC")
  end

  def create
    Post.create(content:params[:content])
    redirect_to action: :index#メッセージが送信されたとき
  end

  def checked
    post = Post.find(params[:id])#既読したメモの該当するidを取得する
    if post.checked#既読か否かを判定するプロパティ
      post.update(checked: false)#既読であれば解除する
    else
      post.update(cheked: true)#既読じゃなければ既読にするためtrueへ
    end

    item = Post.find(params[:id])#更新したレコードを取得し直し
    render json: { post: item }#json形式としてchecked.jsに返却している
end
