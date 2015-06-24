module BoilerplateStarter
  class Admin < Padrino::Application
    use ActiveRecord::ConnectionAdapters::ConnectionManagement
    register Padrino::Mailer
    register Padrino::Helpers
    register Padrino::Admin::AccessControl
    register Sinatra::AssetPack


    assets {
      serve '/admin/js',     from: '../assets/admin/javascripts'        # Default
      serve '/admin/css',    from: '../assets/admin/stylesheets'       # Default
      serve '/admin/images', from: '../assets/admin/images'    # Default

      # The second parameter defines where the compressed version will be served.
      # (Note: that parameter is optional, AssetPack will figure it out.)
      # The final parameter is an array of glob patterns defining the contents
      # of the package (as matched on the public URIs, not the filesystem)
      js :app, '/js/application.js',
         [
             # '/js/vendor/jquery-1.11.2.min.js',
             '/js/vendor/bootstrap.min.js',
             '/js/jquery-ujs.js',
             '/js/main.js'
         ]
      js :modernizr, ['/js/vendor/modernizr-2.8.3.min.js']


      css :app, '/css/application.css', [
                  '/css/bootstrap/bootstrap.css',
                  '/css/bootstrap/bootstrap.css.map',
                  '/css/bootstrap/bootstrap-theme.css',
                  '/css/bootstrap/bootstrap-theme.css.map',
                  '/css/components/*.css',
                  '/css/main.css'
              ]

      css :admin, '/css/admin.css', ['/css/lib/bootstrap3-editable/css/bootstrap-editable.css']
      # js :libs, ['/bower_components/bootstrap/dist/js/bootstrap.js']

      cache_dynamic_assets true

      js_compression  :uglify    # :jsmin | :yui | :closure | :uglify
      css_compression :sass   # :simple | :sass | :yui | :sqwish
    }







    ##
    # Application configuration options
    #
    # set :raise_errors, true         # Raise exceptions (will stop application) (default for test)
    # set :dump_errors, true          # Exception backtraces are written to STDERR (default for production/development)
    # set :show_exceptions, true      # Shows a stack trace in browser (default for development)
    # set :logging, true              # Logging in STDOUT for development and file for production (default only for development)
    # set :public_folder, "foo/bar"   # Location for static assets (default root/public)
    # set :reload, false              # Reload application files (default in development)
    # set :default_builder, "foo"     # Set a custom form builder (default 'StandardFormBuilder')
    # set :locale_path, "bar"         # Set path for I18n translations (default your_app/locales)
    # disable :sessions               # Disabled sessions by default (enable if needed)
    # disable :flash                  # Disables sinatra-flash (enabled by default if Sinatra::Flash is defined)
    # layout  :my_layout              # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)
    #

    set :admin_model, 'Account'
    set :login_page,  '/sessions/new'

    enable  :sessions
    disable :store_location

    access_control.roles_for :any do |role|
      role.protect '/'
      role.allow   '/sessions'
    end

    access_control.roles_for :admin do |role|
      role.project_module :accounts, '/accounts'
    end

    # Custom error management 
    error(403) { @title = "Error 403"; render('errors/403', :layout => :error) }
    error(404) { @title = "Error 404"; render('errors/404', :layout => :error) }
    error(500) { @title = "Error 500"; render('errors/500', :layout => :error) }
  end
end
