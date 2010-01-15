class FancypantsGenerator < Rails::Generator::Base
  def initialize(runtime_args, runtime_options = {})
    super
    @name = @args.first || 'application'
  end
  
  def manifest
    record do |m|
      m.directory 'app/views/layouts'
      m.directory 'public/stylesheets'
      m.directory 'app/helpers'
      m.directory 'public/stylesheets/sass'
      m.template "haml/layout.html.haml", "app/views/layouts/#{file_name}.html.haml"
      m.file "sass/stylesheet.sass",  "public/stylesheets/sass/#{file_name}.sass"
      m.file "javascript/fancypants.js", "public/javascripts/fancypants.js"
      m.file "helper.rb", "app/helpers/layout_helper.rb"
    end
  end
  
  def file_name
    @name.underscore
  end
end
