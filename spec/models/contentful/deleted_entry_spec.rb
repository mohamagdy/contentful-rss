module Contentful
  describe DeletedEntry do
    let(:contentful_deleted_entry) do
      client = Contentful::Client.new(
        space: "cfexampleapi",
        access_token: "b4c0n73n7fu1"
      )

      client.entry("nyancat")
    end

    context "display deleted entry fields" do
      it "should return openstruct that responds with main fields" do
        expect(
          contentful_deleted_entry.display.publication_date
        ).to eq(contentful_deleted_entry.updated_at)

        expect(
          contentful_deleted_entry.display.title
        ).to eq(contentful_deleted_entry.sys[:id])
      end
    end
  end
end