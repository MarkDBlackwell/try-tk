# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb June 25, 2018 - created

See:
Infinite Skills: Ruby Programming 66 - Introduction To Tk - Bui Kenny
https://youtu.be/ywVyPusaj_c
=end

require 'tk'

module Widgets
  extend self

  def begin
    root = TkRoot.new do
      title 'Multiple Widgets'
    end
    button       root
    widget_entry root
    label        root
    text         root
    message      root
    nil
  end

  private

  def button(root)
    TkButton.new root do
      text 'Button Caption'
      pack side: :right, fill: :y
    end
    nil
  end

  def label(root)
    TkLabel.new root do
      text 'Label text'
      pack side: :right
    end
    nil
  end

  def message(root)
    TkMessage.new root do
      text 'Message text'
      pack side: :bottom
    end
    nil
  end

  def text(root)
    TkText.new root do
      width 20
      height 5
      pack side: :left
      insert :end, 'Text field text'
    end
    nil
  end

  def widget_entry(root)
    TkEntry.new root do
      pack side: :top, fill: :x
      insert 0, 'Text in entry widget'
    end
    nil
  end
end

Widgets.begin
Tk.mainloop
