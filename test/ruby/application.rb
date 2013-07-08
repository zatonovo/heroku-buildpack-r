puts ENV['R_HOME']
puts ENV['R_INCLUDE']

require 'sinatra'
require 'rsruby'

# root page
get '/' do

  sample_size = 10

  html = "<html>"
  html += "<head><title>R Code Test</title></head>"
  html += "<body>"

  html += "<p>Running R code...</p>"

  begin

    r = RSRuby.instance

    r.assign('sample_size', sample_size)
    r.eval_R("x <- rnorm(sample_size)")
    r.eval_R("summary(x)")
    r.eval_R("sd(x)")
    r.eval_R("print('Hello World from R')")

    html += "<p>Suceeded running R code...</p>"

  rescue
    html += "<p>Failed running R code:</p>"
  ensure
    r.shutdown
  end

  html += "</html>"

end
