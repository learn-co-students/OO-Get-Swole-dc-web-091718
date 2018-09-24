class Lifter

    @@all = []
    attr_reader :membership
    attr_accessor :name, :lift_total
    def initialize(name, lift_total)
      @name = name
      @lift_total = lift_total
      @@all << self
    end

    # - Get a list of all lifters
    def self.all
      @@all
    end

    # - Get a list of all the memberships that a specific lifter has
      def memberships
        # 1. get list of all memberships.

        # 2. select the ones that matches with current instancse of lifter.
        Membership.all.select do |member_object|
          if member_object.name == self
            member_object.name
          end
        end
      end



    # - Get a list of all the gyms that a specific lifter has memberships to
    def gyms

        memberships.collect do |member_object|
        member_object.gym
      end
    end
    #
    # - Get the average lift total of all lifters

    def self.average_lift
      # get the sum of lift_totals of all the lifter instances
      # get the count of all the lifters.
      # divide sum by count. return average.

      all_lifts = []
      count = 0
      self.all.each do |lifter_object|

        all_lifts << lifter_object.lift_total
        count +=1
      end
        sum = all_lifts.inject(:+)
        average_lift = sum/count
    end
    #
    # - Get the total cost of a specific lifter's gym memberships
    #
    def total_cost
      total_cost = []
      memberships.select do |member_object|
        if member_object.name == self
        total_cost << member_object.cost
        end
      end
      total_cost.inject(:+)
    end

    # - Given a gym and a membership cost, sign a specific lifter up for a new gym
    def sign_up(cost,gym)
      Membership.new(self,gym,cost)
    end



end


















#
# class Lifter
#   @@all = []
#
#
#   attr_reader :name, :lift_total
#
#   def initialize(name, lift_total)
#     @name = name
#     @lift_total = lift_total
#     @@all << self
#   end
#   def sign_up(cost, gym)
#     #Create membership
#     Membership.new(cost, self, gym)
#   end
#   def memberships
#     #Access membership => [memberships]
#     #Select all memberships for specific member
#     Membership.all.select do |m|
#       #compare whether or not lifter property == this lifter
#       m.lifter == self
#     end
#
#   end
#
#   def gyms
#     #Access the Memberships.all array
#     #Determine whether or not the memberships are mine/lifters
#     my_memberships = self.memberships
#     #create array of gyms from the memberships array
#     my_memberships.map do |m|
#       m.gym
#     end
#   end
#
#   def self.all
#     @@all
#   end
#
# end
