R=0  # See https://github.com/clbustos/rinruby/blob/master/lib/rinruby.rb#L786 for details

require 'sinatra'
require 'rinruby'

# root page
get '/' do

  sample_size = 10

  html = "<html>"
  html += "<head><title>R Code Test</title></head>"
  html += "<body>"

  html += "<p>Running R code...</p>"

  begin

    r = RinRuby.new(:interactive => false)

    r.sample_size = sample_size
    r.eval "x <- rnorm(sample_size)"
    r.eval "summary(x)"
    r.eval "sd(x)"
    r.eval "print('Hello World from R')"

    html += "<p>Suceeded running R code...</p>"

  rescue
    html += "<p>Failed running R code...</p>"
  ensure
    r.quit
  end

  html += "</html>"

end
