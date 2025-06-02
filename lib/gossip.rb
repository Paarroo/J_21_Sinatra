require 'csv'

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []

    CSV.read("./db/gossip.csv").each do |ligne_csv|
      gossip_read = Gossip.new(ligne_csv[0], ligne_csv[1])
      all_gossips << gossip_read
    end
    all_gossips
  end

  def self.find(id) # Tell the Gossip class to look for gossip n°X in the CSV
    all_gossips = self.all
    index = id.to_i - 1

    if index >= 0 && index < all_gossips.length
      return all_gossips[index]
    else
      puts "There is nothing to see here .."
    end
  end
end
