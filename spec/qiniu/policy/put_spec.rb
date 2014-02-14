require 'spec_helper'

describe Qiniu::Policy::Put do

  context '.token' do
    it 'should works' do
      # cuz json string no sort
      expected_result = [
        'access_key:kyLwxo3HWXBn7ZY884IpS_DVjuM=:eyJkZWFkbGluZSI6MCwic2NvcGUiOiJteV92aWRlb19idWNrZXQifQ==',
        'access_key:wyz1S9nF7Sg-KWyQqn6UxjSr4kY=:eyJzY29wZSI6Im15X3ZpZGVvX2J1Y2tldCIsImRlYWRsaW5lIjowfQ=='
      ]
      mac = Qiniu::Kit::Mac.new('access_key', 'secret_key')
      put_policy = Qiniu::Policy::Put.new(mac) do |f|
        # let ruby 1.8.x and ruby 1.9.x both follow the in insertion order
        f.deadline = 0
        f.scope = 'my_video_bucket'
      end
      result = put_policy.token
      expected_result.include?(result).should be_true
    end
  end

end
