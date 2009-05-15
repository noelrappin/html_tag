require 'test/unit'

parent_dir = "#{File.dirname(__FILE__)}/.."
plugin_dir = "#{File.dirname(__FILE__)}/../.."
RAILS_ROOT = "#{plugin_dir}/../../"
require "#{RAILS_ROOT}/vendor/rails/activesupport/lib/active_support"
require "#{RAILS_ROOT}/vendor/rails/actionpack/lib/action_pack"
require "#{RAILS_ROOT}/vendor/rails/actionpack/lib/action_controller"
require "#{RAILS_ROOT}/vendor/rails/actionpack/lib/action_controller/test_process"
require "#{RAILS_ROOT}/vendor/rails/actionpack/lib/action_view"

require File.dirname(__FILE__) + '/../lib/html.rb'

class HtmlTagTest < Test::Unit::TestCase
  
  def test_basic_behavior
    actual = Html.div("Content")
    assert_equal("<div>Content</div>", actual.to_str)
  end
  
  def test_content_and_options
    actual = Html.div("Content", :class => "thing", :id => "fred")
    assert_equal('<div class="thing" id="fred">Content</div>', actual.to_str)
  end
  
  def test_with_block
    actual = Html.div do |div|
      div << "Content"
    end
    assert_equal("<div>\nContent</div>", actual.to_str)
  end
  
  def test_multiple_with_block
    actual = Html.div do |div|
      div << "Content"
      div << "More"
    end
    assert_equal("<div>\nContent\nMore</div>", actual.to_str)
  end
  
end
