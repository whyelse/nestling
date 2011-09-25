require File.join(File.dirname(__FILE__), 'helper')

class TestSong < MiniTest::Unit::TestCase
  include Nestling

  def setup
    @song = Nestling.new('foo').song
  end

  def test_superclass
    assert_equal Base, Song.superclass
  end

  def test_method_prefix
    assert_equal "song/", Song::METHOD_PREFIX
  end

  def test_search_method
    assert_respond_to @song, :search
  end

  def test_search_returns_collection
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
    expect_request json, "#{Nestling::Song::METHOD_PREFIX}search"
    response = @song.search
    assert_kind_of Nestling::Collection, response
    assert_equal 'bar', response[0][:foo]
  end

  def test_search_passes_options
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
    expect_request json, "#{Nestling::Song::METHOD_PREFIX}search", { :foo => :bar }
    @song.search :foo => :bar
  end

  def test_profile_method
    assert_respond_to @song, :profile
  end

  def test_profile_returns_collection
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
    expect_request json, "#{Nestling::Song::METHOD_PREFIX}profile"
    response = @song.profile
    assert_kind_of Nestling::Collection, response
    assert_equal 'bar', response[0][:foo]
  end

  def test_profile_passes_options
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
    expect_request json, "#{Nestling::Song::METHOD_PREFIX}profile", { :foo => :bar }
    @song.profile :foo => :bar
  end

  def test_identify_method
    assert_respond_to @song, :identify
  end

  def test_identify_returns_collection
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
    expect_request json, "#{Nestling::Song::METHOD_PREFIX}identify"
    response = @song.identify
    assert_kind_of Nestling::Collection, response
    assert_equal 'bar', response[0][:foo]
  end

  def test_identify_passes_options
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
    expect_request json, "#{Nestling::Song::METHOD_PREFIX}identify", { :foo => :bar }
    @song.identify :foo => :bar
  end
end

