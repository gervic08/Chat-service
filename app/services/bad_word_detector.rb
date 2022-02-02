# frozen_string_literal: true

class BadWordDetector
  def detector(string)
    @bad_words = [/fuck/i, /shit/i, /stupid/i, /dumb/i]
    @bad_words.map do |bad_word|
      string.gsub!(bad_word, '****')
    end
  end
end
