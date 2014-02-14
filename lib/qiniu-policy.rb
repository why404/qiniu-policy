# -*- encoding: utf-8 -*-
require 'qiniu-kit'

%w(
  qiniu/policy/version.rb
  qiniu/policy/get.rb
  qiniu/policy/put.rb
).each do |f|
  require File.join(File.dirname(__FILE__), f)
end
