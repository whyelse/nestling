require File.join(File.dirname(__FILE__), 'helper')

class TestPlaylist < MiniTest::Unit::TestCase
  include Nestling

  def setup
    @playlist = Nestling.new('foo').playlist
  end

  def test_superclass
    assert_equal Base, Playlist.superclass
  end

  def test_method_prefix
    assert_equal "playlist/", Playlist::METHOD_PREFIX
  end

  def test_static_method
    assert_respond_to @playlist, :static
  end

  def test_static_returns_collection
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "songs": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Playlist::METHOD_PREFIX}static"
    response = @playlist.static
    assert_kind_of Nestling::Collection, response
    assert_equal 'bar', response[0][:foo]
  end

  def test_static_passes_options
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "songs": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Playlist::METHOD_PREFIX}static", { :foo => :bar }
    @playlist.static :foo => :bar
  end

  def test_dynamic_method
    assert_respond_to @playlist, :dynamic
  end

  def test_dynamic_returns_collection
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "songs": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Playlist::METHOD_PREFIX}dynamic"
    response = @playlist.dynamic
    assert_kind_of Nestling::Collection, response
    assert_equal 'bar', response[0][:foo]
  end

  def test_dynamic_passes_options
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "songs": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Playlist::METHOD_PREFIX}dynamic", { :foo => :bar }
    @playlist.dynamic :foo => :bar
  end

  def test_session_info_method
    assert_respond_to @playlist, :session_info
  end

  def test_session_info_returns_hash
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "terms": {
          "foo": "bar"
        }
      }}
    EOS
    expect_request json, "#{Nestling::Playlist::METHOD_PREFIX}session_info"
    response = @playlist.session_info
    assert_kind_of Nestling::Hash, response
    assert_equal 'bar', response[:foo]
  end

  def test_session_info_passes_options
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "terms": {
          "foo": "bar"
        }
      }}
    EOS
    expect_request json, "#{Nestling::Playlist::METHOD_PREFIX}session_info", { :foo => :bar }
    @playlist.session_info :foo => :bar
  end
end

