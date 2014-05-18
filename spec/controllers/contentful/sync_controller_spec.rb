require 'spec_helper'

describe Contentful::SyncController do
  before :each do
    request.env["HTTP_ACCEPT"] = 'application/rss+xml'
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

end
