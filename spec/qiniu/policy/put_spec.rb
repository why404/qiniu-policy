require 'spec_helper'

describe Qiniu::Policy::Put do

  context '.token' do
    it 'should works' do
      expect_uptoken = 'access_key:wyz1S9nF7Sg-KWyQqn6UxjSr4kY=:eyJzY29wZSI6Im15X3ZpZGVvX2J1Y2tldCIsImRlYWRsaW5lIjowfQ=='
      mac = Qiniu::Kit::Mac.new('access_key', 'secret_key')
      put_policy = Qiniu::Policy::Put.new(mac) do |f|
        f.scope = 'my_video_bucket'
        f.deadline = 0 # Time.now.to_i + 3600
      end
      put_policy.token.should eq(expect_uptoken)
    end
  end

end
