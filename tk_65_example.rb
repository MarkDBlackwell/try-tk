# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb June 25, 2018 - created

Note: method pack doesn't take a block well.

See:
Infinite Skills: Ruby Programming 65 - Introduction To Tk - Bui Kenny
https://youtu.be/8YbqtLRnrFs
=end

require 'tk'

root = TkRoot.new do
  title 'First example'
end

TkLabel.new root do
  text 'A sample GUI using Tk'
  pack padx: 15, pady: 15, side: :left
end

Tk.mainloop
