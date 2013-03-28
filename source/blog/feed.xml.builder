xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title "EuRuKo 2013 Blog"
  xml.subtitle "The European Ruby Conference 2013 Blog"
  xml.id "http://euruko2013.org/blog"
  xml.link "href" => "http://euruko2013.org/blog"
  xml.link "href" => "http://euruko2013.org/blog/feed.xml", "rel" => "self"
  xml.updated blog.articles.first.date.to_time.iso8601
  xml.author { xml.name "EuRuKo 2013" }

  blog.articles[0..5].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => article.url
      xml.id "http://euruko2013.org#{article.url}"
      xml.published article.date.to_time.iso8601
      xml.updated article.date.to_time.iso8601
      xml.author { xml.name "EuRuKo 2013 Team" }
      xml.summary article.summary, "type" => "html"
      xml.content article.body, "type" => "html"
    end
  end
end
