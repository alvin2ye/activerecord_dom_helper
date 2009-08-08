require 'test_helper'

class Book < ActiveRecord::Base
  def new_record?
    false
  end

  def id
    123
  end
end

class Car < ActiveRecord::Base
  def new_record?
    true
  end
end

class ActiverecordDomHelperTest < ActiveSupport::TestCase
  test "dom_id" do
    assert_equal("book-123", Book.new.dom_id)
    assert_equal("car-new", Car.new.dom_id)
  end

  test "dom_class" do
    assert_equal("book", Book.new.dom_class)
  end
end
