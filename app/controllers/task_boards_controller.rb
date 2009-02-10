class TaskBoardsController < ApplicationController
  unloadable
  menu_item :task_board
  
  before_filter :find_version_and_project, :authorize, :only => [:show]
  
  def show
    @statuses = IssueStatus.all(:order => "position asc")

    fixed_issues = @version.fixed_issues
    @stories_with_tasks = (Issue.instance_methods.include?("story")) ? fixed_issues.group_by(&:story) : { nil => fixed_issues }
    
    if @stories_with_tasks[nil]
      @stories_with_tasks[nil] = @stories_with_tasks[nil].reject {|issue| @stories_with_tasks.keys.include?(issue) }
    end
    
    @stories_with_tasks.each do |story, tasks|
      @stories_with_tasks[story] = tasks.group_by(&:status)
    end
  end
  
  def update_issue_status
    @status = IssueStatus.find(params[:status_id])
    
    @issue = Issue.find(params[:id])
    @issue.init_journal(User.current, "Automated status change from the Task Board")

    attrs = {:status_id => @status.id}
    attrs.merge!(:assigned_to_id => User.current.id) unless @issue.assigned_to_id?
    @issue.update_attributes(attrs)
    
    render :update do |page|
      page.remove dom_id(@issue)
      story = @issue.story if @issue.respond_to?(:story)
      page.insert_html :bottom, task_board_dom_id(story, @status, "list"), :partial => "issue", :object => @issue
    end
  end
  
private
  def find_version_and_project
    @project = Project.find(params[:id])
    @version = @project.current_version
    render_error(l(:task_board_text_no_sprint)) and return unless @version
  end
end
