require 'test_helper'
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :dbfile => "dom_helper_test.sqlite3")
ActiveRecord::Migration.verbose = false
ActiveRecord::Schema.define(:version => 1) do
  create_table :books, :force => true do |t|
    t.string :name
  end
  
  create_table :cars, :force => true do |t|
    t.string :name
  end
  
end
ActiveRecord::Migration.verbose = true

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
    assert_equal("new-book", Book.new.dom_class("new"))
  end
end
