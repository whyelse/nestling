require File.join(File.dirname(__FILE__), '..', 'lib', 'nestling')

require 'minitest/autorun'
require 'mocha'
require 'ostruct'

def stub_http_get(ret)
  response = OpenStruct.new({:body => ret})
  Net::HTTP.any_instance.stubs(:get).returns(response)
end

def expect_request(resp, req, opts = nil)
  resp = MultiJson.decode(resp)
  if opts
    Nestling::Client.any_instance.expects(:get).with(req, opts).returns(resp)
  else
    Nestling::Client.any_instance.expects(:get).with(req, anything).returns(resp)
  end
end

