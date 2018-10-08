class FavoriteFood
    include ActiveModel::Serialization
    attr_reader :timesEaten,
                :foods
              
  def initialize(timesEaten, foods)
    @timesEaten = timesEaten
    @foods = foods
  end
end