# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb June 25, 2018 - created

See:
Infinite Skills: Ruby Programming 66 - Introduction To Tk - Bui Kenny
https://youtu.be/ywVyPusaj_c
=end

require 'tk'

root = TkRoot.new do
  title 'Multiple Widgets'
end

TkButton.new root do
  text 'Button Caption'
  pack side: :right, fill: :y
end

TkEntry.new root do
  pack side: :top, fill: :x
  insert 0, 'Text in entry widget'
end

TkLabel.new do
  text 'Label text'
  pack side: :right
end

TkText.new root do
  width 20
  height 5
  pack side: :left
  insert 'end', 'Text field text'
end

TkMessage.new root do
  text 'Message text'
  pack side: :bottom
end

Tk.mainloop
