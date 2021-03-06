require 'despamilator/filter'

module DespamilatorFilter

  class LongWords < Despamilator::Filter

    def name
      'Long Words'
    end

    def description
      'Detects long and unbroken strings'
    end

    def parse subject
      subject.text.without_uris.words.each do |word|
        subject.register_match!({
          :score => 0.1, :filter => self
        }) if word.length > 20
      end
    end

  end

end
