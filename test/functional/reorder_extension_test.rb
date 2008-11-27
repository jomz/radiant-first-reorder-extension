require File.dirname(__FILE__) + '/../test_helper'

class ReorderExtensionTest < Test::Unit::TestCase
  
  def test_this_extension
    "This extension has it's tests in a patch that will soon be applied to Radiant Core."
  end
  
  def test_initialization
    assert_equal File.join(File.expand_path(RAILS_ROOT), 'vendor', 'extensions', 'reorder'), ReorderExtension.root
    assert_equal 'Reorder', ReorderExtension.extension_name
  end
  
end
