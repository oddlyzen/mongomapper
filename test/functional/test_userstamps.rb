require 'test_helper'

class UserstampsTest < Test::Unit::TestCase
  context "userstamping" do
    setup do
      @document = Doc do
        userstamps!
      end
      @document_alt_user = Doc do
        userstamps! :class_name => 'AltUser'
      end
      @document_alt_user_class = Doc do
        userstamps! :class => AltUser
      end
      @docs = [@document, @document_alt_user, @document_alt_user_class]
    end

    should "add creator_id key" do
      @docs.each{ |d| d.keys.should include('creator_id') }
    end

    should "add updater_id key" do
      @docs.each{ |d| d.keys.should include('updater_id') }
    end

    should "add belongs_to creator" do
      @docs.each{ |d| d.associations.keys.should include(:creator) }
    end

    should "add belongs_to updater" do
      @docs.each{ |d| d.associations.keys.should include(:updater) }
    end
  end
end