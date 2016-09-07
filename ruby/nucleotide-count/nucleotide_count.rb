module Nucleotide
  def self.from_dna(string)
    Statistics.new(string)
  end

  class Statistics 
    NUCLEOTIDES = ['A', 'C', 'G', 'T'].freeze

    attr_reader :histogram

    def initialize(dna_string)
      raise ArgumentError unless dna_string.chars.all? { |c| NUCLEOTIDES.include?(c) }
      @histogram = NUCLEOTIDES.reduce({}) do |hash, nucleotide| 
        hash.merge(nucleotide => dna_string.count(nucleotide)) 
      end
    end

    def count(nucleotide)
      histogram[nucleotide]
    end
  end
end
