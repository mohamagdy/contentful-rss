require 'spec_helper'

describe "contentful/sync/index.rss.builder" do
  context "Next Page link" do
    let(:client) do
      client = Contentful::Client.new(
        space: "cfexampleapi",
        access_token: "b4c0n73n7fu1"
      )
    end

    it "should not display the next page link" do
      @sync = client.sync(initial: true)

      render

      expect(
        Nokogiri::XML(response).xpath("//rss//channel//item//title").last.text
      ).not_to eq("Next Page")
    end

    it "should display the next page link" do
      @sync = client.sync(initial: true)
      allow(@sync).to receive(:next_page_url).and_return("api.contentful.com?sync_token=abc")

      render

      expect(
        Nokogiri::XML(response).xpath("//rss//channel//item//title").last.text
      ).to eq("Next Page")
    end
  end
end