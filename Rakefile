require 'bundler/setup'
require 'padrino-core/cli/rake'


APP_FILE  = 'app/app.rb'
APP_CLASS = 'BoilerplateStarter::App'

require 'sinatra/assetpack/rake'

require File.expand_path('config/boot.rb')


PadrinoTasks.use(:database)
PadrinoTasks.use(:activerecord)
PadrinoTasks.init
