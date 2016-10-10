require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def setup
    @message = users(:example).messages.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @message.valid?, @message.errors.full_messages
  end

  test "should not be blank" do
    @message.content = " "
    assert !@message.valid?
  end

  test "should find user mentions" do
    bob = users(:bob)
    @message.content = "Good afternoon, @#{bob.username}"
    assert_equal [bob], @message.mentions
  end

  test "should exclude mentions without users" do
    @message.content = "Good afternoon, @alice"
    assert_empty @message.mentions
  end
end
