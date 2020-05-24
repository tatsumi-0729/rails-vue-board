class Api::V1::BoardController < ApplicationController

  def index
    @Articles = Article.all
    render json: @Articles
  end

  def show
    @Article = Article.where(id: params[:id])
    # eyecatch = @Article.parse_base64 = (:image) #eyecatchは添付した画像ファイル
    # if eyecatch.present?
    #   @Article['image'] = encode_base64(eyecatch) # 画像ファイルを1.で定義したメソッドでBase64エンコードし、renderするデータに追加する
    # end
    render "index", json: @Article
  end

  def create
    if create_params[:image].present?
      @Article = Article.create(create_params)
      if @Article.save
        @Article.parse_base64 = create_params[:image]
        render "index", json: @Article, status: :created
      else
        render json: @Article.errors, status: :unprocessable_entity
      end
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
    blob = ActiveStorage::Blob.find(image[:id]) # Blobを作成
    "data:#{blob[:content_type]};base64,#{image}" # Vue側でそのまま画像として読み込み出来るBase64文字列にして返す
  end

  private
  def create_params
    params.require(:article).permit(:title, :content, :user_id, :image)
  end

end
