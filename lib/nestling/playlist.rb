module Nestling
  class Playlist < Base
    METHOD_PREFIX = "playlist/"

    define_api_methods({
      :static       => { :collection => true,  :key => "songs" },
      :dynamic      => { :collection => true,  :key => "songs" },
      :session_info => { :collection => false, :key => "terms" }
    })

  end
end

