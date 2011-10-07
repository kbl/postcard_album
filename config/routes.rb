PostcardAlbum::Application.routes.draw do

  match 'login' => 'user_sessions#new'
  match 'logout' => 'user_sessions#destroy'
  match 'kontakt' => 'contact#index', as: :contact

  match 'zestawy/dodaj_do_zestawu' => 'postcard_sets#add_to_set', as: :add_to_set
  match 'zestawy/aktualny_zestaw' => 'postcard_sets#current_set', as: :current_set

  match '/publishers/:id' => redirect('/wydawcy/%{id}')
  match '/postcards/:id' => redirect('/widokowki/%{id}')
  match '/tags/:id' => redirect('/tagi/%{id}')

  resources :user_sessions
  resources :tags, path: 'tagi'
  resources :newsletter_account, path: 'newsletter', path_names: { new: 'zapisz' }

  scope path_names: { new: 'dodaj', edit: 'edytuj' } do
    resources :users, path: 'uzytkownicy'
    resources :publishers, path: 'wydawcy'
    resources :postcards, path: 'widokowki'
    resources :postcard_sets, path: 'zestawy'
  end

  match '/postcards/images/:id/:style.:format' => redirect('/widokowki/zdjecia/%{id}/%{style}.%{format}')
  match '/widokowki/zdjecia/:id/:style.:format' => 'images#show'

  root :to => 'index#index'

end
