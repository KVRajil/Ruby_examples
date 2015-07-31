require "rubygems"
require "rack"

use Rack::Static,
  :root => "Rack"

  run lambda { |env|
    [
      200,
      {
        'Content-Type'  => 'text/html',
        'Cache-Control' => 'public, max-age=86400'
      },
      File.open('home.html', File::RDONLY)
    ]
  }
