class SpacesController < ApplicationController
  # GET /spaces
  def index
    HTTParty.get(
      "https://api.contentful.com/spaces",
      headers: {
        "Authorization" => "Bearer #{session[:access_token]}",
        "Content-Type" => "application/vnd.contentful.management.v1+json"
      }
    )
  end
end
