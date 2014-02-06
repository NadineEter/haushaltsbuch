require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "task can not be saved without name" do
 task = Task.new
 assert !task.save
end
end
