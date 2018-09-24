require 'pry'
class Gym
  attr_accessor :name
  attr_reader :lifter
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select do |membership|
      membership.gym == self
    end
  end

  def lifters

    memberships.map do |membership|
      membership.name
    end
  end

  def lifter_names
    lifters.map do |lifter|

      lifter.name
    end
  end
  #   - Get the combined lift_total of every lifter who has a membership to that gym
  #         Gym#lift_total

  def lift_total_for_gym
    total = 0
    lifters.each do |lifter|
      total += lifter.lift_total
    end
    total
  end
end











# class Gym
#  ALL = []
#
#   attr_reader :name
#
#   def initialize(name)
#     @name = name
#     ALL << self
#
#   end
#
#   def self.all
#     ALL
#   end
#
#   def memberships
#     #Access all memberships => [Memberships]
#     #determine wheter or not the membership belongs to this gym (self)
#     Membership.all.select do |m|
#       m.gym == self
#     end
#   end
#
#   def lifters
#     #Access all memberships
#     #our gym?
#     #make array of lifters from said memberships
#     self.memberships.map do |m|
#       m.lifter
#     end
#   end
#
#   def lifter_names
#     #get lifters
#     #get names
#     self.lifters.map do |l|
#       l.name
#     end
#   end
#
#   def total_lifter_liftable_weight
#     lifter_liftable_weight = 0
#     #get lifters
#     self.lifters.each do |l|
#       #add all of their weight
#       lifter_liftable_weight += l.lift_total
#     end
#     lifter_liftable_weight
#   end
#
# end
