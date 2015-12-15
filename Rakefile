# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'afmotion'
require 'bubble-wrap'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name                 = 'SintjansGemeente'
  app.codesign_certificate = 'iPhone Distribution: Andre Heijstek (NHACADXY3R)'
  app.identifier           = 'com.ifocus.SintjansGemeente'
  app.provisioning_profile = '/Users/andreheijstek/Library/MobileDevice/Provisioning Profiles/a517cbe0-5978-4ded-9b17-0d913230abbe.mobileprovision'
  # app.deployment_target    = '8.0.0'
end
