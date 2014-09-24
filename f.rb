require 'open3'   # => true
require 'pty'     # => true
require 'expect'  # => true
require 'pry'

Dir.chdir "/Users/josh/deleteme/rails-project-deleteme"  # => 0

PTY.spawn('bash', '-i', ) { |read, write, pid|           # => PTY
  write.puts "source /usr/local/share/chruby/chruby.sh"  # => nil
  write.puts "chruby 2.1.1"                              # => nil
  write.puts "bin/rails console"                         # => nil
  write.puts "binding.pry"                               # => nil
  write.puts "printf 'PID=%d\n', Process.pid"            # => nil

  until (line = read.gets) =~ /PID/
    puts "LINE: #{line}"
  end
  require "pry"
  binding.pry
  # read.expect(/^PID=.*?(\d+)/) { |output, actual|        # => #<File:/dev/ttys018>
  #   # Process.kill 18, pid
  #   output                                               # => "source /usr/local/share/chruby/chruby.sh\r\nchruby 2.1.1\r\nbin/rails console\r\nbinding.pry\r\nprintf 'PID=%d\r\n', Process.pid\r\nbash-3.2$ source /usr/local/share/chruby/chruby.sh\r\nbash-3.2$ chruby 2.1.1\r\nbash-3.2$ bin/rails console\r\nLoading development environment (Rails 4.1.0)\r\nirb(main):001:0> binding.pry\r\n\e[0G[1] pry(main)> printf 'PID=%d\r\n[1] pry(main)* ', Process.pid...
  #   output[/.*\Z/]                                       # => "PID=5"
  #   actual                                               # => "5"
  # }                                                      # => nil
}                                                        # => nil

