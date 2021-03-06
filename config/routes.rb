Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :blog_entries
  end
  
  resources :blog_entries

  get '/blog/tag/:tag', :to => 'blog_entries#tag', :as => :blog_tag
  get '/blog/category/:category', :to => 'blog_entries#category', :as => :blog_category
  get '/blog/author/:author', :to => 'blog_entries#author', :as => :blog_author
  get '/blog/:year/:month/:day/:slug', :to => 'blog_entries#show', :as => :blog_entry_permalink
  get '/blog/:year(/:month)(/:day)', :to => 'blog_entries#archive', :as => :news_archive,
    :constraints => {:year => /(19|20)\d{2}/, :month => /[01]?\d/, :day => /[0-3]?\d/}
  get '/blog/feed', :to => 'blog_entries#feed', :as => :blog_feed, :format => :rss
  get '/blog', :to => 'blog_entries#index', :as => :blog
end