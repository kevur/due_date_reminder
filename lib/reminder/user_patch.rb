module Reminder
  module UserPatch
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
        unloadable
      end
    end

    module InstanceMethods
      def reminder_notification_array
        reminder_notification.split(%r{[\s,]}).collect(&:to_i).select {|n| n > 0}.sort
      end
    end
  end
end