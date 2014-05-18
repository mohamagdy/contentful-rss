Rails.application.routes.draw do
  root to: 'contentful/sync#index', defaults: { format: :rss }
end
