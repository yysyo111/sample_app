class ListsController < ApplicationController
  def new
    @list = List.new #list.newとすることで空のフォームを作る
  end
  
  def create
     # １.&2. データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 4. トップ画面へリダイレクト
    redirect_to list_path(list.id)  
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end
  
  private #「ここから下はこのcontrollerの中でしか呼び出せません」
  # ストロングパラメータ(「マスアサインメント脆弱性」というセキュリティ上の問題を防ぐことができる)
  def list_params
    params.require(:list).permit(:title, :body, :image) #ストロングパラメータ内にimageを追加し、imageのデータの取得を許可
  end
end


# params :formから送られてくるデータはparamsの中に入っています。
# require :送られてきたデータの中からモデル名(ここでは:list)を指定し、データを絞り込みます。
# permit :requireで絞り込んだデータの中から、保存を許可するカラムを指定します。
# privateより後に定義されたメソッドは、アクションとして認識されなくなり、URLと対応できなくなり,メソッドの呼び出しに制限をかけることができる
# privateメソッドの名前は、「モデル名_params」

# Listからallメソッドを呼び出しているので、listsテーブルに保存されている全てのデータを取得すること