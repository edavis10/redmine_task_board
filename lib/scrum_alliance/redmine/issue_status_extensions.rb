module ScrumAlliance
  module Redmine
    module IssueStatusExtensions
      def class_name
        name.gsub(" ",'').underscore
      end
    end # IssueStatusExtensions
  end # Redmine
end # ScrumAlliance