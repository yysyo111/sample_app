Rails.application.routes.draw do
  get 'top' => 'homes#top'
  resources :lists #ルーティングを一括して自動生成してくれる機能
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
