module Nursys
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      desc "Creates Nursys initializer for your application"

      def copy_initializer
        template "nursys_initializer.rb", "config/initializers/nursys.rb"

        puts "Install complete! Truly Outrageous!"
      end
    end
  end
end