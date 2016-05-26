module Corneal
  module Extensions
    module String
      def camel_case
        return self.gsub(/^./) { |l| l.capitalize } if !match(/[_-]/)
        altered_self = self.downcase.capitalize
        altered_self.scan(/[_-][a-zA-Z]/).each do |match|
          altered_self.gsub!(match, match[1].upcase)
        end

        altered_self
      end

      def camel_case!
        self.replace camel_case
      end

      def directory_name
        self.downcase.gsub(/[^a-z|\-|\_]/, '')
      end

      def file_name
        self.gsub(/[\-| ]/, '_').
             gsub(/([A-Z]+|[A-Z][a-z])/) { |x| "_#{x}" }.
             sub(/^_/, "").
             gsub(/_{2,}+/, "_").
             downcase
      end

      def file_name!
        self.replace file_name
      end
    end
  end
end

String.send(:include, Corneal::Extensions::String)
