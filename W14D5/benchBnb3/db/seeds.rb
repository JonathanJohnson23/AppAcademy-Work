# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
x_coordinates = [
    37.745323, 
    37.743128, 
    37.796581, 
    37.795584, 
    37.722575, 
    37.792371, 
    37.769986, 
    37.798647, 
    37.715245, 
    37.778551, 
    37.759939, 
    37.720284, 
    37.751609, 
    37.780316, 
    37.746717, 
    37.728909, 
    37.703877, 
    37.719672, 
    37.753725, 
    37.776395, 
    37.784265, 
    37.793260, 
    37.733735, 
    37.776615, 
    37.769232, 
    37.738938, 
    37.718759, 
    37.746910, 
    37.752693, 
    37.728695, 
    37.731610, 
    37.786093, 
    37.710197, 
    37.764384, 
    37.767338, 
    37.730372, 
    37.789651, 
    37.763900, 
    37.709923, 
    37.768899, 
    37.717447, 
    37.725491, 
    37.777919, 
    37.778732, 
    37.771513, 
    37.784516, 
    37.768201, 
    37.724531, 
    37.725795, 
    37.720229, 
    37.742504, 
    37.711158, 
    37.724241, 
    37.742637, 
    37.718297, 
    37.704621, 
    37.786833, 
    37.725299, 
    37.722179, 
    37.745398, 
    37.730960, 
    37.735064, 
    37.786447, 
    37.783160, 
    37.749163, 
    37.738825, 
    37.728734, 
    37.709490, 
    37.757092, 
    37.728821, 
    37.740976, 
    37.758836, 
    37.757437, 
    37.797823, 
    37.797662, 
    37.747091, 
    37.738389, 
    37.786277, 
    37.732483, 
    37.741804, 
    37.724510, 
    37.740234, 
    37.702865, 
    37.781385, 
    37.752070, 
    37.792835, 
    37.770131, 
    37.713406, 
    37.744377, 
    37.772588, 
    37.730862, 
    37.753743, 
    37.719763, 
    37.739205, 
    37.722665, 
    37.733991, 
    37.702930, 
    37.740591, 
    37.732970, 
    37.746429]

    y_coordinates = [
      -122.447411,
      -122.467241,
      -122.438819,
      -122.413558,
      -122.425284,
      -122.430968,
      -122.484584,
      -122.402500,
      -122.414411,
      -122.464702,
      -122.401698,
      -122.420248,
      -122.452687,
      -122.465776,
      -122.421118,
      -122.487918,
      -122.447455,
      -122.462716,
      -122.442325,
      -122.424617,
      -122.457751,
      -122.445450,
      -122.481420,
      -122.427901,
      -122.459632,
      -122.422492,
      -122.452300,
      -122.493315,
      -122.461063,
      -122.427025,
      -122.480009,
      -122.447099,
      -122.420041,
      -122.449754,
      -122.420923,
      -122.489575,
      -122.454449,
      -122.468221,
      -122.470094,
      -122.455104,
      -122.408230,
      -122.444194,
      -122.463151,
      -122.404676,
      -122.453891,
      -122.474375,
      -122.484641,
      -122.406292,
      -122.492001,
      -122.462565,
      -122.462640,
      -122.435130,
      -122.470985,
      -122.454983,
      -122.425714,
      -122.494864,
      -122.449405,
      -122.485581,
      -122.465255,
      -122.477587,
      -122.436563,
      -122.498496,
      -122.458060,
      -122.477665,
      -122.469334,
      -122.498132,
      -122.463061,
      -122.420856,
      -122.460560,
      -122.414190,
      -122.456496,
      -122.499189,
      -122.482375,
      -122.497660,
      -122.474918,
      -122.432387,
      -122.422972,
      -122.458441,
      -122.438686,
      -122.492741,
      -122.423349,
      -122.441710,
      -122.405247,
      -122.493712,
      -122.444372,
      -122.406424,
      -122.448805,
      -122.469218,
      -122.470995,
      -122.409925,
      -122.475378,
      -122.417411,
      -122.418877,
      -122.435613,
      -122.490273,
      -122.431414,
      -122.417475,
      -122.411586,
      -122.428940,
      -122.478331
    ]
    


10.times do 
    Bench.create!(description: Faker::Games::Zelda.location, lat: x_coordinates.sample, lng: y_coordinates.sample)
end
