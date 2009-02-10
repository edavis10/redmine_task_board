module ScrumAlliance
  module Redmine
    module ProjectExtensions
      # Note that this method is also used in the other plugins and should probably be moved (somehow).
      def current_version
        versions.detect {|version| version.created_on.to_date <= Date.current && !version.effective_date.nil? && version.effective_date >= Date.current }
      end
    end # ProjectExtensions
  end # Redmine
end # ScrumAlliance
