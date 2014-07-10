require "test_helper"

class ErbAssetsTest < Minitest::Test
  def test_render_html
    asset = Rails.application.assets["template.html.erb"]
    assert_equal "text/html", asset.content_type

    html = asset.to_s
    assert_match '<a href="/posts">posts</a>', html
    assert_match 'partial data', html
    assert_match 'custom helper data', html
    assert_match 'mod helper data', html
  end

  def test_render_jst
    asset = Rails.application.assets["template.jst.erb"]
    assert_equal "application/javascript", asset.content_type

    html = asset.to_s
    assert_match '<a href="/posts">posts</a>', html
    assert_match 'partial data', html
    assert_match 'custom helper data', html
    assert_match 'mod helper data', html
  end

  def test_render_javascript
    asset = Rails.application.assets["template.js.erb"]
    assert_equal "application/javascript", asset.content_type
    assert_match 'var posts_url = "/posts";', asset.to_s
  end
end
