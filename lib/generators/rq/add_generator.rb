# for Rails 3
if Rails::VERSION::MAJOR >= 3

  module Rq
    class AddGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)

      def add_files
        file_name.sub!('rq_', '')

        template "consumer.rb", "app/workers/rq_#{file_path}.rb"
        template "spec.rb", "spec/workers/rq_#{file_path}_spec.rb"
      end
    end
  end

end

# for Rails 2.3
if Rails::VERSION::MAJOR == 2

  class RqAddGenerator < Rails::Generator::NamedBase
    def manifest
      record do |m|
        file_name.sub!('rq_', '')

        m.template "consumer.rb", "app/workers/rq_#{file_path}.rb"
        m.template "spec.rb", "spec/workers/rq_#{file_path}_spec.rb"
      end
    end
  end

end