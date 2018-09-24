












class Membership

    attr_reader :gym
    attr_accessor :name, :cost

    @@all = []

    def initialize (name, gym,cost)
      @name = name
      @gym = gym
      @cost = cost
      @@all << self
    end

    #   - Get a list of all memberships
    def self.all
      @@all
    end





end# class Membership
#   ALL = []
#
#   attr_reader :cost, :lifter, :gym
#
#   def initialize(cost, lifter, gym)
#     @cost = cost
#     @lifter = lifter
#     @gym = gym
#     ALL << self
#   end
#
#   def self.all
#     ALL
#   end
#
#
# end
