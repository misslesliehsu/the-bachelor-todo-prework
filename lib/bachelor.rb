require 'pry'

def get_first_name_of_season_winner(data, season)
  season_winner = ""
  data.each do |season_key, season_data|
    if season_key == season
      season_data.each_with_index do |contestant, index|
        contestant.each do |label, value|
            if value == "Winner"
              season_winner = data[season_key][index]["name"]
            end
        end
      end
    end
  end
season_winner.split(" ")[0]
end

def get_contestant_name(data, occupation)
  answer = ""
  data.each do |season_key, season_data|
    season_data.each_with_index do |contestant, index|
        contestant.each do |key, value|
          if value == occupation
            answer = data[season_key][index]["name"]
          end
        end
    end
  end
  answer
end
#not more efficient to look things up by [keys]
#because end up having to iterate to the bottom level
#anyway, to retrieve the name of the contestant

def count_contestants_by_hometown(data, hometown)
  answer_counter = 0
  data.each do |season_key, season_data|
    season_data.each_with_index do |contestant|
      contestant.each do |key, value|
          if value == hometown
            answer_counter += 1
          end
      end
    end
  end
  answer_counter
end

#can use break, can use check if answer = "", can use detect on higher loops?
def get_occupation(data, hometown)
  answer_occupation = ""
  data.each do |season_key, season_data|
    season_data.each_with_index do |contestant, index|
      contestant.each do |key, value|
        if value == hometown
          if answer_occupation == ""
            answer_occupation = season_data[index]["occupation"]
          end
        end
      end
    end
  end
  answer_occupation
end

def get_average_age_for_season(data, season)
  total_ages = 0
  count = 0
  data.each do |season_key, season_data|
    if season_key == season
      count = season_data.count
      season_data.each_with_index do |contestant, index|
        total_ages += season_data[index]["age"].to_f
      end
    end
  end
  (total_ages/count).round
end
