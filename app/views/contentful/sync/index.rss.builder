xml.instruct! :xml, version: "1.0", encoding: "UTF-8"

xml.rss version: "2.0" do
  xml.channel do
    xml.title "Contentful Sync API"
    xml.description "Syncing resources (Entries and Assets) from Contentful API"
    xml.link root_url

    @sync.each_item do |item|
      xml.item do
        xml.category item.type
        xml.pubDate item.updated_at

        if item.is_a?(Contentful::Asset)
          item.fields.each do |key, value|
            xml.title key.to_s
            xml.description value
          end
        else
          xml.title "Entry"
          xml.description "Why not?"
        end
      end
    end
  end
end