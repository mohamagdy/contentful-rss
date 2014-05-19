class OauthController < ApplicationController
  # GET /oauth
  def index
    client = OAuth2::Client.new(
      access_token: Rails.application.secrets.contentful_uid,
      space: Rails.application.secrets.contentful_secret,
      site: Rails.application.secrets.contentful_site
    )

    client.options[:token_url] = "/oauth/token"

    token = client.auth_code.get_token(
      params[:code], :redirect_uri => redirect_uri
    )

    session[:access_token] = token.token

    redirect_to spaces_path
  end
end
