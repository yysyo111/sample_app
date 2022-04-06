Rails.application.routes.draw do
  get 'top' => 'homes#top'
  resources :lists #ルーティングを一括して自動生成してくれる機能　ターミナル：rails routesで確認する
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


# 項目	意味
# Prefix	パスが入った変数のようなもの。resourcesメソッドを使ってルーティングを定義すると自動で作成されます。
# Verb	HTTPメソッドを表します。URI Patternのパスにどのhttpリクエストでアクセスするかを示しています。
# URI Pattern	ルーティングのパスを表します
# Controller#Action	httpリクエストでパスが送られた際に処理が行われるコントローラとアクションを表します。#左がコントローラ名、右がアクション名を示します。