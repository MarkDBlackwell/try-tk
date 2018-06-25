# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb June 25, 2018 - created

See:
Infinite Skills: Ruby Programming 67 - Using Common Widgets
https://youtu.be/OGU-OQD5aWY
=end

require 'tk'

class HelloName
  def initialize
    ph = padx: :y
end

root = TkRoot.new do
  title 'First example'
end

