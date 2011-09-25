module Nestling
  class Track < Base
    METHOD_PREFIX = "track/"

    define_api_methods({
      :profile  => { :collection => false, :key => "track" },
    })

  end
end

