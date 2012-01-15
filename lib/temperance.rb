# -*- coding: utf-8 -*-

require 'rubygems'
require 'json'

$KCODE = "u" unless Object.const_defined? :Encoding
$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__)) ||
  $:.include?(File.expand_path(File.dirname(__FILE__)))

module  Temperance
  HOME_DIR = File.expand_path '~' unless defined? HOME_DIR
  STORAGE_FILE = File.join(Temperance::HOME_DIR, '.temperance') unless defined? STORAGE_FILE
  KIND_OF_TEMPERANCE = '酒' unless defined? KIND_OF_TEMPERANCE 
  require 'temperance/storage.rb'
  require 'temperance/utility.rb'
  require 'temperance/app.rb'
end
