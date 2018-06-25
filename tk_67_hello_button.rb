# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb June 25, 2018 - created

See:
Infinite Skills: Ruby Programming 67 - Using Common Widgets
https://youtu.be/OGU-OQD5aWY
=end

require 'tk'

module HelloName

  extend self

  def begin(pack_standard)
    root = window_set
    top = TkFrame.new root
    @text = TkVariable.new

    prompt_name  top, pack_standard
    entry_name   top, pack_standard, @text
    button_hello top, pack_standard
    button_exit  top, pack_standard

    top.pack fill: :both, side: :top
    nil
  end

  private

  def button_exit(top, pack_standard)
    TkButton.new top do
      text 'Exit'
      command do
        proc exit
      end
      pack pack_standard
    end
    nil
  end

  def button_hello(top, pack_standard)
    proc_hello = proc do
      hello
    end
    TkButton.new top do
      text 'Say Hello'
# The syntax, 'command{proc hello}' didn't work, here.
      command proc_hello
      pack pack_standard
    end
    nil
  end

  def entry_name(top, pack_standard, text)
    TkEntry.new top, textvariable: text do
      pack pack_standard
    end
    nil
  end

  def hello
# Simply prepending to @text.value didn't work, here.
    @text.value = @text.value.prepend 'Hello, '
    nil
  end

  def prompt_name(top, pack_standard)
    TkLabel.new top do
      text 'Name?'
      pack pack_standard
    end
    nil
  end

  def window_set
    TkRoot.new do
      title 'Hello, name'
    end
  end
end

def pack_standard
  {padx: 50, pady: 30}
end

HelloName.begin pack_standard
Tk.mainloop
