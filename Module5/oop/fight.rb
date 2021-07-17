#Dir["./*.rb"].each {|file| require file }
require_relative "jiujiteiro"
require_relative "boxer"
require_relative "kickboxer"

silva = Jiujiteiro.new("Anderson")
silva.championStatus

ali = Boxer.new("Mohammad")
p ali.attacks
