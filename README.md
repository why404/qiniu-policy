# qiniu-policy

[![Build Status](https://travis-ci.org/why404/qiniu-policy.png?branch=master)](https://travis-ci.org/why404/qiniu-policy)
[![Dependency Status](https://gemnasium.com/why404/qiniu-policy.png)](https://gemnasium.com/why404/qiniu-policy)
[![Coverage Status](https://coveralls.io/repos/why404/qiniu-policy/badge.png)](https://coveralls.io/r/why404/qiniu-policy)
[![Code Climate](https://codeclimate.com/github/why404/qiniu-policy.png)](https://codeclimate.com/github/why404/qiniu-policy)
[![Gem Version](https://badge.fury.io/rb/qiniu-policy.png)](http://badge.fury.io/rb/qiniu-policy)

Authorization library used to generate upload/download tokens of Qiniu Cloud Storage.

## Installation

Add this line to your application's Gemfile:

    gem 'qiniu-policy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install qiniu-policy

## Usage

```ruby
require 'qiniu-policy'

mac = Qiniu::Kit::Mac.new('your_access_key', 'your_secret_key')

put_policy = Qiniu::Policy::Put.new(mac) do |f|
  f.scope = 'my_video_bucket'
  f.deadline = Time.now.to_i + 3600 # expires in one hour
  f.endUser = 'why404'
  f.callbackBody = 'fname=$(fname)&fsize=$(fsize)&ftype=$(mimeType)&uid=$(endUser)&myvar=$(x:myvar)'
  f.callbackUrl = 'http://example.com/callback?from=qiniu'
  f.persistentOps = 'avthumb/flash;avthumb/ipad_high;avthumb/iphone_high;avthumb/m3u8/segtime/10/preset/video_640k'
  f.persistentNotifyUrl = 'http://example.com/notify?from=qiniu'
  f.insertOnly = 1
  f.fsizeLimit = 1024**3 # 1GB
  f.saveKey = '$(endUser)/$(year)/$(mon)/$(day)/$(hour)-$(min)-$(sec).mp4'
  f.detectMime = 1
  f.mimeLimit = 'video/*'
  f.transform = 'avthumb/mp4'
  f.fopTimeout = 1800
end

uptoken = put_policy.token
```

Or you can configure your Qiniu account access credentials globally.

```ruby
require 'qiniu-policy'

Qiniu.config = {:access_key => '...', :secret_key => '...'}

put_policy = Qiniu::Policy::Put.new do |f|
  # ...
end

uptoken = put_policy.token
```

Additionally, the library will attempt to load these options from `ENV`:

    export QINIU_ACCESS_KEY='...'
    export QINIU_SECRET_KEY='...'

For more, go to [qiniu-kit](https://github.com/why404/qiniu-kit).

## API Reference

- [Qiniu::Policy::Put](http://developer.qiniu.com/docs/v6/api/reference/security/put-policy.html)
- [Qiniu::Policy::Get](http://developer.qiniu.com/docs/v6/api/reference/security/download-token.html)

## TODO

- Qiniu::Policy::Get

## Supported Ruby versions

This library aims to support and is [tested against](https://travis-ci.org/why404/qiniu-kit) the following Ruby implementations:

- MRI 2.1.0
- MRI 2.0.0
- MRI 1.9.3
- MRI 1.9.2
- MRI 1.8.7
- JRuby 1.7.9 in Ruby 1.8 mode
- JRuby 1.7.9 in Ruby 1.9 mode
- Ruby Enterprise Edition 1.8.7 2012.02
- Ruby (latest master)
- [JRuby](http://jruby.org/) (latest master)
- [Rubinius](http://rubini.us/)

If something doesn't work on one of these Ruby versions, it's a bug.

This library may inadvertently work (or seem to work) on other Ruby implementations, however support will only be provided for the versions listed above.

## Contributing

1. Fork it ( <http://github.com/why404/qiniu-policy/fork> )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
