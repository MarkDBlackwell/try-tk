# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb June 25, 2018 - created

See:
Infinite Skills: Ruby Programming 68 - Exercise 1
https://youtu.be/xCeEghc9GQk
=end

require 'tk'

class Converter
  def initialize(pack_standard)
    root = window_set
    top = TkFrame.new root
    prompt_choice top, pack_standard

    entry_fahrenheit top, pack_standard
    entry_celsius    top, pack_standard

    button_convert top, pack_standard
    button_exit    top, pack_standard

    top.pack fill: :both, side: :top
  end

  private

  def button_convert(top, pack_standard)
    proc_convert = proc do
      convert
    end
    TkButton.new top do
      text 'Convert'
      command proc_convert
      pack pack_standard
    end
    nil
  end

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

  def convert
# To Fahrenheit:
    rescale_to_fahrenheit = 9.0 / 5.0
    align_to_fahrenheit = 32.0
    unless @text_celsius.to_s.empty?
      @text_fahrenheit.value = @text_celsius * rescale_to_fahrenheit + align_to_fahrenheit
    end
# To Celsius:
    rescale_to_celsius = 1.0 / rescale_to_fahrenheit
    align_to_celsius = -align_to_fahrenheit
    unless @text_fahrenheit.to_s.empty?
      @text_celsius.value = (@text_fahrenheit + align_to_celsius) * rescale_to_celsius
    end
  end

  def entry_celsius(top, pack_standard)
    @text_celsius = TkVariable.new
    @entry_celsius = TkEntry.new top, textvariable: @text_celsius
    @entry_celsius.pack pack_standard
    nil
  end

  def entry_fahrenheit(top, pack_standard)
    @text_fahrenheit = TkVariable.new
    @entry_fahrenheit = TkEntry.new top, textvariable: @text_fahrenheit
    @entry_fahrenheit.pack pack_standard
    nil
  end

  def prompt_choice(top, pack_standard)
    TkLabel.new top do
      text 'Top: Fahrenheit; bottom: Celsius'
      pack pack_standard
    end
    nil
  end

  def window_set
    TkRoot.new do
      title 'Temperature converter'
    end
  end
end

def pack_standard
  {padx: 10, pady: 10}
end

Converter.new pack_standard
Tk.mainloop
