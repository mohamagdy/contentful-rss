Rails.application.routes.draw do
  get 'spaces/index'

  root to: 'contentful/sync#index', defaults: { format: :rss }
end
