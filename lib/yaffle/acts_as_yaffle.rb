# yaffle/lib/yaffle/acts_as_yaffle.rb

module Yaffle
  module ActsAsYaffle
    # your code will go here
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def acts_as_yaffle(options = {})
        # your code will go here
        cattr_accessor :yaffle_text_field
        self.yaffle_text_field = (options[:yaffle_text_field] || :last_squawk).to_s
        include Yaffle::ActsAsYaffle::LocalInstanceMethods
      end
    end
    module LocalInstanceMethods
      def squawk(string)
        write_attribute(self.class.yaffle_text_field, string.to_squawk)
      end
    end
  end
end
