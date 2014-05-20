class Contentful::SyncController < ApplicationController

  # GET /contentful/sync
  def index
    # Creating the client
    client = Contentful::Client.new(
      access_token: current_user.access_token,
      space: current_user.space
    )

    # Syncing
    url = current_user.next_sync_url || params[:page_url]
    sync = client.sync(url || { initial: true })

    sync.each_item { |item| (@items ||= []) << item }

    # Updating the next_sync_url for the current_user
    # Showed be initialed after calling "each_item"
    if sync.completed?
      current_user.update_attribute(:next_sync_url, sync.next_sync_url)
    else
      @next_page_url = sync.next_page_url
    end
  end
end
