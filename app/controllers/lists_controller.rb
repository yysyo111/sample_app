class ListsController < ApplicationController
  def new
    @list = List.new #list.newとすることでlistモデルのtitle,bodyを格納できる
  end
  
  def create
     # １.&2. データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 4. トップ画面へリダイレクト
    redirect_to '/top'
  end

  def index
  end

  def show
  end

  def edit
  end
  
  private #「ここから下はこのcontrollerの中でしか呼び出せません」
  # ストロングパラメータ(「マスアサインメント脆弱性」というセキュリティ上の問題を防ぐことができる)
  def list_params
    params.require(:list).permit(:title, :body)
  end
end


# params :formから送られてくるデータはparamsの中に入っています。
# require :送られてきたデータの中からモデル名(ここでは:list)を指定し、データを絞り込みます。
# permit :requireで絞り込んだデータの中から、保存を許可するカラムを指定します。
# privateより後に定義されたメソッドは、アクションとして認識されなくなり、URLと対応できなくなり,メソッドの呼び出しに制限をかけることができる
# privateメソッドの名前は、「モデル名_params」