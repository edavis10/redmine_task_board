require File.join(File.dirname(__FILE__), '..', 'test_helper')


class IssueExtensionsTest < Test::Unit::TestCase

  context "issue without tasks" do
    setup do
      @issue = Issue.new(:done_ratio => 50)
    end
    should "use issue's done_ratio attribute" do
      assert_equal 50, @issue.done_ratio
    end
  end

  context "issue with tasks" do
    setup do
      @issue = Issue.new
      with_tasks([Issue.new(:estimated_hours => 4, :done_ratio => 50), Issue.new(:estimated_hours => 6, :done_ratio => 100), Issue.new])
    end

    should "sum up the done_ratio of all the tasks" do
      assert_equal 80, @issue.done_ratio
    end

    context "without estimates" do
      setup { with_tasks( [Issue.new, Issue.new]) }

      should "have a done ratio of 0%" do
        assert_equal 0, @issue.done_ratio
      end
    end

    context "with decimal estimates" do
      setup { with_tasks([Issue.new(:estimated_hours => 0.5, :done_ratio => 50)]) }
      should "be fine with the floating point stuff" do
        assert_equal 50, @issue.done_ratio 
      end
    end
  end


  protected

  def with_tasks(tasks)
    @issue.stubs(:tasks).returns(tasks)
  end
end
