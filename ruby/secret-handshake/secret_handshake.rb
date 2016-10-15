class SecretHandshake
  HANDSHAKE_CODES = {
    /\A[01]*1\z/ => "wink",
    /\A[01]*1[01]\z/ => "double blink",
    /\A[01]*1[01]{2}\z/ => "close your eyes",
    /\A[01]*1[01]{3}\z/ => "jump"
  }.freeze
  REVERSE_COMMANDS_ORDER_PATTERN = /\A[01]*1[01]{4}\z/

  attr_reader :commands

  def initialize(input)
    @base_2_number = input.is_a?(Integer) ? input.to_s(2) : "0" 
    convert_to_sequence_of_events
  end

  private

  def convert_to_sequence_of_events
    @commands = []
    HANDSHAKE_CODES.each_pair { |k, v| @commands << v if @base_2_number.match(k) }
    @commands.reverse! if @base_2_number.match(REVERSE_COMMANDS_ORDER_PATTERN)
  end
end
