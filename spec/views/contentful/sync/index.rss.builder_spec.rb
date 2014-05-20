require 'spec_helper'

describe "contentful/sync/index.rss.builder" do
  context "Next Page link" do
    let(:current_user) { FactoryGirl.create(:user) }

    let(:client) do
      client = Contentful::Client.new(
        access_token: current_user.access_token,
        space: current_user.space
      )
    end

    let(:rss_path) { "//rss//channel//item//title" }
    let(:next_page_text) { "Next Page" }

    before(:each) do
      sync = client.sync(initial: true)
      sync.each_item { |item| (@items ||= []) << item }
    end

    it "should not display the next page link" do
      render

      expect(
        Nokogiri::XML(response).xpath(rss_path).last.text
      ).not_to eq(next_page_text)
    end

    it "should display the next page link" do
      @next_page_url = "http://contentful.com/nextpage"
      allow(view).to receive(:current_user).and_return(current_user)

      render

      expect(
        Nokogiri::XML(response).xpath(rss_path).last.text
      ).to eq(next_page_text)
    end
  end
end