module Nestling
  class Song < Base
    METHOD_PREFIX = "song/"

    define_api_methods({
      :search   => { :collection => true, :key => "songs" },
      :profile  => { :collection => true, :key => "songs" },
      :identify => { :collection => true, :key => "songs" }
    })

  end
end

