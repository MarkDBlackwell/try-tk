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
    pack_standard = {padx: 50, pady: 30}
    proc_hello = proc do
      hello
    end
    @text = TkVariable.new

    root = TkRoot.new do
      title 'Hello, name'
    end

    top = TkFrame.new root

    TkLabel.new top do
      text 'Name?'
      pack pack_standard
    end

    @entry = TkEntry.new top, textvariable: @text do
      pack pack_standard
    end

    TkButton.new top do
      text 'Say Hello'
      command proc_hello
      pack pack_standard
    end

    TkButton.new top do
      text 'Exit'
      command do
        proc exit
      end
      pack pack_standard
    end

    top.pack fill: :both, side: :top
  end

  private

  def hello
# Simply prepending to @text.value didn't work, here.
    @text.value = @text.value.prepend 'Hello, '
  end
end

HelloName.new
Tk.mainloop
