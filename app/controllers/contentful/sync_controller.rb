class Contentful::SyncController < ApplicationController
  # GET /contentful/sync
  def index
    # Creating the client
    client = Contentful::Client.new(
      access_token: Rails.application.secrets.contentful_access_token,
      space: Rails.application.secrets.contentful_space
    )

    # Syncing
    @sync = client.sync(params[:sync_url] || { initial: true })
  end
end
