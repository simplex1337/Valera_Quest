#!/bin/ruby 

path = File.join(File.dirname(__FILE__), '../src')
$LOAD_PATH.unshift(path)

require 'executor'

ValeraQuest::Executor.new
