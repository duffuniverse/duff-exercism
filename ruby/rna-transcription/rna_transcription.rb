module BookKeeping
  VERSION = 4
end

module Complement
  DNA_TO_RNA = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }.freeze

  def self.of_dna(strand)
    return '' unless strand.chars.all? { |nucleotide| DNA_TO_RNA.has_key?(nucleotide) }
    strand.chars.map { |nucleotide| DNA_TO_RNA.fetch(nucleotide) }.join
  end
end
