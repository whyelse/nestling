require File.join(File.dirname(__FILE__), 'helper')

class TestTrack < MiniTest::Unit::TestCase
  include Nestling

  def setup
    @track = Nestling.new('foo').track
  end

  def test_superclass
    assert_equal Base, Track.superclass
  end

  def test_method_prefix
    assert_equal "track/", Track::METHOD_PREFIX
  end

  def test_profile_method
    assert_respond_to @track, :profile
  end

  def test_profile_returns_hash
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "track": {
          "foo": "bar"
        }
      }}
    EOS
    expect_request json, "#{Nestling::Track::METHOD_PREFIX}profile"
    response = @track.profile
    assert_kind_of Nestling::Hash, response
    assert_equal 'bar', response[:foo]
  end

  def test_profile_passes_options
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "track": {
          "foo": "bar"
        }
      }}
    EOS
    expect_request json, "#{Nestling::Track::METHOD_PREFIX}profile", { :foo => :bar }
    @track.profile :foo => :bar
  end
end

