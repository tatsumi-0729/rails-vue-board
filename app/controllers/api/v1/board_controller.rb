class Api::V1::BoardController < ApplicationController

  def index
    @Articles = Article.all
    render json: @Articles
  end

  def show
    article = Article.find(params[:id])
    eyecatch = article.avatar #avatarは添付した画像ファイル
    # if eyecatch.present?
    article[:image] = encode_base64(eyecatch) # 画像ファイルを1.で定義したメソッドでBase64エンコードし、renderするデータに追加する
    render json: article
    # end
  end

  def create
    if session[:user_id] == nil
      render json: 'user false'
      return
    end

    @Article = Article.create(create_params)
    if @Article.save
      @Article.parse_base64 = create_params[:image]
      render "index", json: @Article, status: :created
    else
      render json: @Article.errors, status: :unprocessable_entity
    end

  end

  def destroy
    @Article = Article.find(params[:id])
    if @Article.destroy
    render "index" , json: 'No Content' 
    flash[:notice] = '削除が完了しました。'
    else
    render json: @Article.errors, status: :enprocessable_entitiy
    end
  end

  # 各モデルのレコードに添付された画像ファイルをBase64でエンコードする
  def encode_base64(eyecatch)
    image = Base64.encode64(eyecatch.download) # 画像ファイルをActive Storageでダウンロードし、エンコードする
    blob = ActiveStorage::Blob.find(eyecatch[:id]) # Blobを作成
    "data:#{blob[:content_type]};base64,#{image}" # Vue側でそのまま画像として読み込み出来るBase64文字列にして返す
  end

  private
  def create_params
    params.require(:article).permit(:title, :content, :user_id, :image)
  end

end
