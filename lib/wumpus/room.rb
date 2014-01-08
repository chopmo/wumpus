module Wumpus
  class Room
    def initialize(number)
      @number = number
      @hazards = []
      @neighbors = []
    end

    attr_reader :number, :neighbors, :hazards

    def add(thing)
      hazards << thing
    end

    def remove(thing)
      hazards.delete(thing)
    end

    def has?(thing)
      hazards.include?(thing)
    end

    def empty?
      hazards.empty?
    end

    def safe?
      empty? && neighbors.all?(&:empty?)
    end

    def connect(other_room)
      neighbors << other_room
      other_room.neighbors << self
    end

    def exits
      neighbors.map(&:number)
    end

    def neighbor(number)
      neighbors.select { |n| n.number == number }.first
    end

    def random_neighbor
      neighbors.sample
    end
  end
end
