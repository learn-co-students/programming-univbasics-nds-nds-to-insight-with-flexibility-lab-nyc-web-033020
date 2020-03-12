# Provided, don't edit
require 'directors_database'
require 'pry'
# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  {
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  #binding.pry
  movies_collection.map { |movie| movie_with_director_name(name, movie)  }
end


def gross_per_studio(collection)
  hash = { }
   count = 0
   while count < collection.size do
     stu_name = collection[count][:studio]
      #  binding.pry
      if hash[stu_name]
        hash[stu_name] += collection[count][:worldwide_gross]
      else
        hash[stu_name] = collection[count][:worldwide_gross]
      end
       count += 1
    end
  return hash
end

def movies_with_directors_set(collection)
  array = [ ]
    count = 0
    while count < collection.size do
      dir_name = collection[count][:name]
      dir_movie = collection[count][:movies]
      array << movies_with_director_key(dir_name, dir_movie)
   count += 1
 end

  return array

end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
