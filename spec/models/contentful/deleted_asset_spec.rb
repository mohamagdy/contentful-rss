require 'spec_helper'

describe Contentful::DeletedAsset do
  let(:contentful_deleted_asset) do
    client = Contentful::Client.new(
      space: "cfexampleapi",
      access_token: "b4c0n73n7fu1"
    )

    client.asset("nyancat")
  end

  context "display deleted asset fields" do
    it "should return openstruct that responds with main fields" do
      expect(
        contentful_deleted_asset.display.publication_date
      ).to eq(contentful_deleted_asset.updated_at)

      expect(
        contentful_deleted_asset.display.title
      ).to eq(contentful_deleted_asset.sys[:id])
    end
  end
end