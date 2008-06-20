#Hack URI::HTTP to include a method that gets us both the path and the querystring
#since path_query is private
module URI
  class HTTP < Generic
    def path_with_querystring
      path_query
    end
  end
end

[ 'jam_base4_rails/response',
  'jam_base4_rails/settings',
  'jam_base4_rails/errors',
  'jam_base4_rails/http_gateway',
  'jam_base4_rails/settings_methods',
  'jam_base4_rails/search',
  'jam_base4_rails/jam_base4_rails',
  'jam_base4_rails/jam_base_view_helper',
  'jam_base4_rails/models/model',
  'jam_base4_rails/models/converter',
  'jam_base4_rails/models/venue',
  'jam_base4_rails/models/event',
  'jam_base4_rails/models/events',
  'jam_base4_rails/models/artists',
  'jam_base4_rails/models/api'].each {|file| require file}
