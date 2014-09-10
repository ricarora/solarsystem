class Planet
  attr_accessor :name, :orbit_size, :radius_in_km, :volume_cubic_km, :mass,
  :atmosphere, :number_of_moons, :distance_from_center, :solar_rotation

  def initialize(hash)
    @name = hash[:name]
    @orbit_size = hash[:orbit_size]
    @radius_in_km = hash[:radius_in_km]
    @volume_cubic_km = hash[:volume_cubic_km]
    @mass = hash[:mass]
    @atmosphere = hash[:atmosphere]
    @number_of_moons = hash[:num_moon]
    @distance_from_center = hash[:dist_from_center]
    @solar_rotation = hash[:solar_rotation]
  end

  def dist_between_planets(other_planet)
    "#{(@distance_from_center - other_planet.distance_from_center).abs} Kms"
  end

  def age_of_planet
    s = SolarSystem.new
    "#{s.formation_date / @solar_rotation} earth years"
  end

end


class SolarSystem
  attr_accessor :planets_arr, :formation_date

  def initialize
    @formation_date = 49e8
    @planets_arr = []
  end

  def add_planet(hash)
    hash.each do |planet|
      @planets_arr.push(Planet.new(planet))
    end
  end

end


planets = [
  {name: "Mercury",
    orbit_size: "57909227",
    radius_in_km: "2439.7",
    volume_cubic_km: "60827208742",
    mass: "330104e18",
    atmosphere: ["Oxygen", "Nitrogen"],
    dist_from_center: 58e6,
    solar_rotation: 58.686/365.242},
    {name: "Venus",
      orbit_size: "108,209,475",
      radius_in_km: "6051.8",
      volume_cubic_km: "928,415,345,893",
      mass: "4,867,32e19",
      atmosphere: ["Carbon dioxide", "Nitrogen"],
      dist_from_center: 108e6,
      solar_rotation: -243.018/365.242},
      {name: "Earth",
        orbit_size: "149,598,262",
        radius_in_km: "6371",
        volume_cubic_km: "1083206916846",
        mass: "597219e19",
        atmosphere: ["Nitrogen", "Oxygen"],
        num_moon: "1",
        dist_from_center: 150e6,
        solar_rotation: 0.997},
        {name: "Mars",
          orbit_size: "227943824",
          radius_in_km: "3389.5",
          volume_cubic_km: "163115609799",
          mass: "641693e18",
          atmosphere: ["Carbon dioxide", "Nitrogen", "Argon"],
          num_moon: ["2"],
          dist_from_center: 228e6,
          solar_rotation: 1.026},
          {name: "Jupiter",
            orbit_size: "778340821",
            radius_in_km: "69911",
            volume_cubic_km: "1431281810739360",
            mass: "189813e22",
            atmosphere: ["Hydrogen", "Helium"],
            num_moon: "50",
            dist_from_center: 778e6,
            solar_rotation: 0.41354},
            {name: "Saturn",
              orbit_size: "1426666422",
              radius_in_km: "58232",
              volume_cubic_km: "827129915150897",
              mass: "568319e21",
              atmosphere: ["Hydrogen", "Helium"],
              num_moon: "53",
              dist_from_center: 1427e6,
              solar_rotation: 0.444},
              {name: "Uranus",
                orbit_size: "2870658186",
                radius_in_km: "25362",
                volume_cubic_km: "68334355695584",
                mass: "868103e20",
                atmosphere: ["Hydrogen", "Helium", "Methane"],
                num_moon: "27",
                dist_from_center: 2871e6,
                solar_rotation: -0.718},
                {name: "Neptune",
                  orbit_size: "4498396441",
                  radius_in_km: "24622",
                  volume_cubic_km: "62525703987421",
                  mass: "10241e22",
                  atmosphere: ["Hydrogen", "Helium", "Methane"],
                  num_moon: "13",
                  dist_from_center: 4497e6,
                  solar_rotation: 0.671}
  ]


# our_ss = SolarSystem.new
# our_ss.add_planet(planets)
# puts our_ss.planets_arr
#
# puts our_ss.planets_arr[0].dist_between_planets(our_ss.planets_arr[3])
# puts our_ss.planets_arr[2].age_of_planet

def print_name_of_planets(hash)
  our_ss = SolarSystem.new
  our_ss.add_planet(hash)
  our_ss.planets_arr.each do |planet|
    print "#{planet.name}, "
  end
end

def our_solarsystem(hash)

  puts "Which planet would you like to know about?"
  print_name_of_planets(hash)
  puts ""
  planet_name = gets.chomp
  puts "What would you like to know about #{planet_name}?"
  puts "Orbit size, Radius, Volume, Mass, Atmosphere, Number of Moons, Distance from the Sun, Solar rotation, Age of planet or Distance from another planet"
  query = gets.chomp
  our_ss = SolarSystem.new
  our_ss.add_planet(hash)
  our_ss.planets_arr.each do |planet|
    if planet.name == planet_name
      case query
      when "Orbit size", "orbit size"
        puts "Orbit size of #{planet.name} is #{planet.orbit_size}"
      when "Radius", "radius"
        puts "Radius of #{planet.name} is #{planet.radius_in_km} Kms"
      when "Volume", "volume"
        puts "Volume of #{planet.name} is #{planet.volume_cubic_km} cubic Km"
      when "Mass", "mass"
        puts "Mass of #{planet.name} is #{planet.mass}"
      when "Atmosphere", "atmosphere"
        puts "Atmosphere of #{planet.name} contains #{planet.atmosphere}"
      when "Number of Moons", "number of moons"
        puts "#{planet.name} has #{planet.number_of_moons} moons"
      when "Distance from the sun", "distance from the sun"
        puts "#{planet.name} is #{planet.distance_from_center} Kms away from Sun"
      when "Solar Rotation", "solar rotation"
        puts "#{planet.name} rotates around Sun at the rate of #{planet.solar_rotation} per earth year"
      when "Age of Planet", "age of planet"
        puts "Age of #{planet.name} is #{planet.age_of_planet}"
      when "Distance from another planet", "distance from another planet"
        puts "What is the name of another planet you would like to know the distance from?"
        print_name_of_planets(hash)
        puts ""
        other_planet_name = gets.chomp
        our_ss.planets_arr.each do |other_planet|
          if other_planet.name == other_planet_name
            puts "The distance between #{planet.name} and #{other_planet.name} is #{planet.dist_between_planets(other_planet)}"
          end
        end

      end
    end
  end


end



our_solarsystem(planets)
