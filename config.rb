
###
# Compass
###

# Susy grids in Compass
# First: gem install susy --pre
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###
page "/" do
  @body_class = 'homepage-body'
end
# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Blog
###

Time.zone = "Europe/Athens"

activate :blog do |blog|
  blog.prefix = "blog"
  blog.permalink = ":year-:month-:day-:title"
  # blog.sources = ":year-:month-:day-:title.html"
  # blog.taglink = "tags/:tag.html"
  blog.layout = "blog"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "blog/tag.html"
  blog.calendar_template = "blog/calendar.html"

  blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/:num"
end

# Blog feed
page "/blog/feed.xml", :layout => false

# Schedule calendar
page "/schedule.ics", :layout => false

# Schedule JSON
page "/schedule.json", :layout => false

# News JSON
page "/news.json", :layout => false

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Directory indexes
activate :directory_indexes

# Methods defined in the helpers block are available in templates
helpers do
  def link_to_top
    link_to 'to the top ^', '#', class: 'back_top'
  end

  def link_to_section(section, link)
    if current_page.url == '/'
      link_to section, link
    else
      link_to section, '/' + link
    end
  end

  def twitter_button(username)
    link_to "Follow @#{username}", "https://twitter.com/#{username}", class: "twitter-follow-button", :'data-show-count' => 'false', :'data-dnt' => 'true'
  end

  def github_button(username)
    link_to "@#{username}", "https://github.com/#{username}"
  end

  def find_speaker(id)
    data.speakers.find { |s| s.id == id }
  end

end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :js_assets_paths, ["#{root}/vendor/assets/"]

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Enable asset hashing
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end
