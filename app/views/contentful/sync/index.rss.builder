xml.instruct! :xml, version: "1.0", encoding: "UTF-8"

xml.rss version: "2.0" do
  xml.channel do
    xml.title "Contentful Sync API"
    xml.description "Syncing resources (Entries and Assets) from Contentful API"
    xml.link root_url

    (@items || []).each do |item|
      xml.item do
        xml.category item.type
        xml.pubDate item.display.publication_date

        xml.title "#{item.display.title} (#{item.type})"
        xml.description item.display.description
        xml.enclosure item.display.url
      end
    end

    if @next_page_url.present?
      xml.item do
        xml.title "Next Page"
        xml.link root_url(user_id: current_user.id, page_url: @next_page_url)
      end
    end
  end
end