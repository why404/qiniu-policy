require 'spec_helper'

describe Qiniu::Policy::Put do

  context '.token' do
    it 'should works' do
      expect_uptoken = 'access_key:kyLwxo3HWXBn7ZY884IpS_DVjuM=:eyJkZWFkbGluZSI6MCwic2NvcGUiOiJteV92aWRlb19idWNrZXQifQ=='
      mac = Qiniu::Kit::Mac.new('access_key', 'secret_key')
      put_policy = Qiniu::Policy::Put.new(mac) do |f|
        # let ruby 1.8.x and ruby 1.9.x both follow the in insertion order
        f.deadline = 0
        f.scope = 'my_video_bucket'
      end
      put_policy.token.should eq(expect_uptoken)
    end
  end

end
