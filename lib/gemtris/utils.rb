# frozen_string_literal: false

require 'psych'

# Comand-Line Utilities
module CLI
  DEFAULT_PROMPT = 'Please enter text:'.freeze
  DEFAULT_ERROR = 'Unknown error!'.freeze
  SCREEN_DIVIDER = "\n------------------------\n\n".freeze

  def self.divide_screen
    print SCREEN_DIVIDER
  end

  def self.clear_screen
    system('clear') || system('cls') || divide_screen
  end

  def self.user_input
    print '> '
    gets.chomp.strip.downcase
  end

  def self.prompt(message = DEFAULT_PROMPT)
    puts message
    divide_screen
    user_input
  end

  def self.error(message = DEFAULT_ERROR)
    divide_screen
    puts "[ERROR]: #{message}"
    divide_screen
  end
end

# Provides an interface for developers to access the related YAML texts.
module GemtrisText
  # assuming yml/gemtris and we're in lib/gemtris/
  TEXTS = Psych.load_file("#{__dir__}/../../yml/gemtris.yml") # Psych.load(IO.read("#{__dir__}/../../yml/gemtris.yml"))

  def self.[](key)
    TEXTS[key.to_s]
  end
end
