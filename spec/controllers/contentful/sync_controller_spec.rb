require 'spec_helper'

describe Contentful::SyncController do
  let(:current_user) { FactoryGirl.create(:user) }

  let(:rss_content_type) { "application/rss+xml" }
  def valid_params
    { user_id: current_user.id }
  end

  describe "GET 'index'" do
    before(:each) do
      request.env["HTTP_ACCEPT"] = rss_content_type
    end

    it "returns http success" do
      get :index, valid_params

      expect(response).to be_success
      expect(response).to render_template("contentful/sync/index")
      expect(response.content_type).to eq(rss_content_type)
    end

    it "updates the next_sync_url for the current_user" do
      allow(controller).to receive(:current_user).and_return(current_user)

      expect(current_user.next_sync_url).to eq(nil)

      get :index, valid_params

      expect(current_user.next_sync_url).not_to eq(nil)
    end
  end
end
