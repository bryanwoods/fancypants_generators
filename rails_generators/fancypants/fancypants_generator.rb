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
      m.directory 'public/stylesheets/sass/fancypants'
      m.directory 'public/stylesheets/sass/fancypants/config'
      m.template "layout.html.haml", "app/views/layouts/#{file_name}.html.haml"
      m.file "stylesheet.sass",  "public/stylesheets/sass/#{file_name}.sass"
      m.file "/sass/_config.sass", "public/stylesheets/sass/fancypants/_config.sass"
      m.file "/sass/_default.sass", "public/stylesheets/sass/fancypants/_default.sass"
      m.file "/sass/_elements.sass", "public/stylesheets/sass/fancypants/_elements.sass"
      m.file "/sass/_messages.sass", "public/stylesheets/sass/fancypants/_messages.sass"
      m.file "/sass/_reset.sass", "public/stylesheets/sass/fancypants/_reset.sass"
      m.file "/sass/config/_colors.sass", "public/stylesheets/sass/fancypants/config/_colors.sass"
      m.file "/sass/config/_typography.sass", "public/stylesheets/sass/fancypants/config/_typography.sass"
      m.file "/sass/config/_utilities.sass", "public/stylesheets/sass/fancypants/config/_utilities.sass"
      m.file "javascript/fancypants.js", "public/javascripts/fancypants.js"
      m.file "helper.rb", "app/helpers/layout_helper.rb"
    end
  end
  
  def file_name
    @name.underscore
  end
end
