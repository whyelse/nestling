require File.join(File.dirname(__FILE__), 'helper')

class TestArtist < MiniTest::Unit::TestCase
  include Nestling

  def setup
    @collection_response = <<-EOS
      {"response": {
        "status": {
          "version": "4.2",
          "code": 0,
          "message": "Success"
        },
        "start": 11,
        "total": 1393,
        "session_id": 123,
        "blogs": [{
          "title": "foo",
          "date": "2011-08-16T01:15:01"
        }]
      }}
    EOS
    @artist = Client.new('foo').artist('bar')
  end

  def test_superclass
    assert_equal Base, Artist.superclass
  end

  def test_method_prefix
    assert_equal "song/", Song::METHOD_PREFIX
  end

  def test_artist_with_id
    artist = Client.new('foo').artist :id => 'foo'
    assert_equal 'foo', artist.id
    assert_nil artist.name
  end

  def test_artist_with_name
    artist = Client.new('foo').artist 'bar'
    assert_equal 'bar', artist.name
    assert_nil artist.id
  end

  def test_passes_name
    expect_request @collection_response, 'artist/blogs', { :name => 'bar' }
    Client.new('foo').artist('bar').blogs
  end

  def test_passes_id
    expect_request @collection_response, 'artist/blogs', { :id => 'baz' }
    Client.new('foo').artist(:id => 'baz').blogs
  end

  def test_biographies_method
    assert_respond_to @artist, :biographies
  end
  
  def test_biographies_returns_collection
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "biographies": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}biographies"
    response = @artist.biographies
    assert_kind_of Nestling::Collection, response
    assert_equal 'bar', response[0][:foo]
  end
  
  def test_biographies_passes_options
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "biographies": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}biographies", { :foo => :bar, :name => 'bar' }
    @artist.biographies :foo => :bar
  end
  
  def test_blogs_method
    assert_respond_to @artist, :blogs
  end
  
  def test_blogs_returns_collection
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "blogs": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}blogs"
    response = @artist.blogs
    assert_kind_of Nestling::Collection, response
    assert_equal 'bar', response[0][:foo]
  end
  
  def test_blogs_passes_options
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "blogs": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}blogs", { :foo => :bar, :name => 'bar' }
    @artist.blogs :foo => :bar
  end
  
  def test_familiarity_method
    assert_respond_to @artist, :familiarity
  end
  
  def test_familiarity_returns_hash
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "artist": {
          "foo": "bar"
        }
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}familiarity"
    response = @artist.familiarity
    assert_kind_of Nestling::Hash, response
    assert_equal 'bar', response[:foo]
  end
  
  def test_familiarity_passes_options
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "artist": {
          "foo": "bar"
        }
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}familiarity", { :foo => :bar, :name => 'bar' }
    @artist.familiarity :foo => :bar
  end
  
  def test_hotttnesss_method
    assert_respond_to @artist, :hotttnesss
  end
  
  def test_hotttnesss_returns_hash
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "artist": {
          "foo": "bar"
        }
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}hotttnesss"
    response = @artist.hotttnesss
    assert_kind_of Nestling::Hash, response
    assert_equal 'bar', response[:foo]
  end
  
  def test_hotttnesss_passes_options
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "artist": {
          "foo": "bar"
        }
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}hotttnesss", { :foo => :bar, :name => 'bar' }
    @artist.hotttnesss :foo => :bar
  end
  
  def test_images_method
    assert_respond_to @artist, :images
  end
  
  def test_images_returns_collection
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "images": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}images"
    response = @artist.images
    assert_kind_of Nestling::Collection, response
    assert_equal 'bar', response[0][:foo]
  end
  
  def test_images_passes_options
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "images": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}images", { :foo => :bar, :name => 'bar' }
    @artist.images :foo => :bar
  end
  
  def test_list_terms_method
    assert_respond_to @artist, :list_terms
  end
  
  def test_list_terms_returns_collection
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "list_terms": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}list_terms"
    response = @artist.list_terms
    assert_kind_of Nestling::Collection, response
    assert_equal 'bar', response[0][:foo]
  end
  
  def test_list_terms_passes_options
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "list_terms": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}list_terms", { :foo => :bar, :name => 'bar' }
    @artist.list_terms :foo => :bar
  end
  
  def test_news_method
    assert_respond_to @artist, :news
  end
  
  def test_news_returns_collection
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "news": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}news"
    response = @artist.news
    assert_kind_of Nestling::Collection, response
    assert_equal 'bar', response[0][:foo]
  end
  
  def test_news_passes_options
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "news": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}news", { :foo => :bar, :name => 'bar' }
    @artist.news :foo => :bar
  end
  
  def test_profile_method
    assert_respond_to @artist, :profile
  end
  
  def test_profile_returns_hash
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "artist": {
          "foo": "bar"
        }
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}profile"
    response = @artist.profile
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
        "artist": {
          "foo": "bar"
        }
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}profile", { :foo => :bar, :name => 'bar' }
    @artist.profile :foo => :bar
  end
  
  def test_reviews_method
    assert_respond_to @artist, :reviews
  end
  
  def test_reviews_returns_collection
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "reviews": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}reviews"
    response = @artist.reviews
    assert_kind_of Nestling::Collection, response
    assert_equal 'bar', response[0][:foo]
  end
  
  def test_reviews_passes_options
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "reviews": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}reviews", { :foo => :bar, :name => 'bar' }
    @artist.reviews :foo => :bar
  end
  
  def test_search_method
    assert_respond_to @artist, :search
  end
  
  def test_search_returns_collection
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "artists": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}search"
    response = @artist.search
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
        "artists": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}search", { :foo => :bar, :name => 'bar' }
    @artist.search :foo => :bar
  end
  
  def test_extract_method
    assert_respond_to @artist, :extract
  end
  
  def test_extract_returns_collection
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "artist": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}extract"
    response = @artist.extract
    assert_kind_of Nestling::Collection, response
    assert_equal 'bar', response[0][:foo]
  end
  
  def test_extract_passes_options
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "artist": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}extract", { :foo => :bar, :name => 'bar' }
    @artist.extract :foo => :bar
  end
  
  def test_songs_method
    assert_respond_to @artist, :songs
  end
  
  def test_songs_returns_collection
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
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}songs"
    response = @artist.songs
    assert_kind_of Nestling::Collection, response
    assert_equal 'bar', response[0][:foo]
  end
  
  def test_songs_passes_options
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
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}songs", { :foo => :bar, :name => 'bar' }
    @artist.songs :foo => :bar
  end
  
  def test_similar_method
    assert_respond_to @artist, :similar
  end
  
  def test_similar_returns_collection
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "artists": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}similar"
    response = @artist.similar
    assert_kind_of Nestling::Collection, response
    assert_equal 'bar', response[0][:foo]
  end
  
  def test_similar_passes_options
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "artists": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}similar", { :foo => :bar, :name => 'bar' }
    @artist.similar :foo => :bar
  end
  
  def test_suggest_method
    assert_respond_to @artist, :suggest
  end
  
  def test_suggest_returns_collection
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "artists": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}suggest"
    response = @artist.suggest
    assert_kind_of Nestling::Collection, response
    assert_equal 'bar', response[0][:foo]
  end
  
  def test_suggest_passes_options
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "artists": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}suggest", { :foo => :bar, :name => 'bar' }
    @artist.suggest :foo => :bar
  end
  
  def test_terms_method
    assert_respond_to @artist, :terms
  end
  
  def test_terms_returns_collection
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "terms": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}terms"
    response = @artist.terms
    assert_kind_of Nestling::Collection, response
    assert_equal 'bar', response[0][:foo]
  end
  
  def test_terms_passes_options
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "terms": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}terms", { :foo => :bar, :name => 'bar' }
    @artist.terms :foo => :bar
  end
  
  def test_top_hottt_method
    assert_respond_to @artist, :top_hottt
  end
  
  def test_top_hottt_returns_collection
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "artists": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}top_hottt"
    response = @artist.top_hottt
    assert_kind_of Nestling::Collection, response
    assert_equal 'bar', response[0][:foo]
  end
  
  def test_top_hottt_passes_options
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "artists": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}top_hottt", { :foo => :bar, :name => 'bar' }
    @artist.top_hottt :foo => :bar
  end
  
  def test_top_terms_method
    assert_respond_to @artist, :top_terms
  end
  
  def test_top_terms_returns_collection
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "terms": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}top_terms"
    response = @artist.top_terms
    assert_kind_of Nestling::Collection, response
    assert_equal 'bar', response[0][:foo]
  end
  
  def test_top_terms_passes_options
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "terms": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}top_terms", { :foo => :bar, :name => 'bar' }
    @artist.top_terms :foo => :bar
  end
  
  def test_urls_method
    assert_respond_to @artist, :urls
  end
  
  def test_urls_returns_hash
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "urls": {
          "foo": "bar"
        }
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}urls"
    response = @artist.urls
    assert_kind_of Nestling::Hash, response
    assert_equal 'bar', response[:foo]
  end
  
  def test_urls_passes_options
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "urls": {
          "foo": "bar"
        }
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}urls", { :foo => :bar, :name => 'bar' }
    @artist.urls :foo => :bar
  end
  
  def test_video_method
    assert_respond_to @artist, :video
  end
  
  def test_video_returns_collection
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "video": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}video"
    response = @artist.video
    assert_kind_of Nestling::Collection, response
    assert_equal 'bar', response[0][:foo]
  end
  
  def test_video_passes_options
    json = <<-EOS
      {"response": {
        "status": {
          "code": "0",
          "message": "Success",
          "version": "4.2"
        },
        "video": [{
          "foo": "bar"
        }]
      }}
    EOS
    expect_request json, "#{Nestling::Artist::METHOD_PREFIX}video", { :foo => :bar, :name => 'bar' }
    @artist.video :foo => :bar
  end
end

