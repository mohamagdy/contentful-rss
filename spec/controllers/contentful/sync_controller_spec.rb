require 'spec_helper'

describe Contentful::SyncController do
  describe "GET 'index'" do
    it "returns http success" do
      request.env["HTTP_ACCEPT"] = 'application/rss+xml'

      get :index
      expect(response).to be_success
      expect(response).to render_template("contentful/sync/index")
      expect(response.content_type).to eq("application/rss+xml")
    end
  end
end
