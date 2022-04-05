Rails.application.routes.draw do
  get 'lists/new'
  post 'lists' => 'lists#create' #List.newといった新しい情報がmodelオプションに設定されている場合は、CreateアクションのURLへ送信といった風に、データの送信先を自動的に判別することができます
  get 'lists' => 'lists#index'
  get 'lists/:id' => 'lists#show', as: 'list'
  get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'
  get 'top' => 'homes#top'
  patch 'lists/:id' => 'lists#update', as: 'update_list'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
