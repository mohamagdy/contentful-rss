# A wrapper to Contentful Sync API

module Contentful
  class DeletedAsset
    def display
      asset = OpenStruct.new(
        publication_date: self.updated_at,
        title: self.sys[:id]
      )
    end
  end
end