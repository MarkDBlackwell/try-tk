# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb June 25, 2018 - created

See:
Infinite Skills: Ruby Programming 68 - Exercise 1
https://youtu.be/xCeEghc9GQk
=end

require 'tk'

module ::Converter
  extend self

  def main
    root = window_set
    top = TkFrame.new root
    prompt_choice top, pack_standard

    @text_celsius    = TkVariable.new
    @text_fahrenheit = TkVariable.new

    [@text_fahrenheit, @text_celsius].each do |e|
      entry_temperature_scale top, pack_standard, e
    end

    button_convert top, pack_standard
    button_exit    top, pack_standard

    top.pack fill: :both, side: :top
    Tk.mainloop
    nil
  end

  private

  def align_to_celsius
    -align_to_fahrenheit
  end

  def align_to_fahrenheit
    32.0
  end

  def button_convert(top, pack_standard)
    proc_convert = proc do
      calculate_celsius
      calculate_fahrenheit
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
        proc ::Kernel.exit
      end
      pack pack_standard
    end
    nil
  end

  def calculate_celsius
    unless @text_fahrenheit.to_s.empty?
      @text_celsius.value = (@text_fahrenheit + align_to_celsius) * rescale_to_celsius
    end
    nil
  end

  def calculate_fahrenheit
    unless @text_celsius.to_s.empty?
      @text_fahrenheit.value = @text_celsius * rescale_to_fahrenheit + align_to_fahrenheit
    end
    nil
  end

  def entry_temperature_scale(top, pack_standard, text)
    TkEntry.new top, textvariable: text do
      pack pack_standard
    end
    nil
  end

  def pack_standard
    {padx: 10, pady: 10}
  end

  def prompt_choice(top, pack_standard)
    TkLabel.new top do
      text 'Top: Fahrenheit; bottom: Celsius'
      pack pack_standard
    end
    nil
  end

  def rescale_to_celsius
    1.0 / rescale_to_fahrenheit
  end

  def rescale_to_fahrenheit
    9.0 / 5.0
  end

  def window_set
    TkRoot.new do
      title 'Temperature converter'
    end
  end
end

::Converter.main
