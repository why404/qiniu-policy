# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'qiniu-policy'

if RUBY_VERSION >= "1.9"
  require 'coveralls'
  Coveralls.wear!
end
