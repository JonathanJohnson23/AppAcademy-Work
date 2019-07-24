# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do

    Artwork.delete_all
    ArtworkShare.delete_all
    User.delete_all
    user = User.create!([
            { username: 'piccas-omg'},
            { username: 'leo'},
            { username: 'vermeercat'},
            { username: 'bballguy94'},
            { username: 'skiermandude94'}
        ])
    
    artwork = Artwork.create!([
        { title: 'Guernica', image_url: 'url1', artist_id: user[0].id },
        { title: 'Mona Lisa', image_url: 'shorturl.at/quK58', artist_id: user[1].id  },
        { title: 'Girl with the Pearl Earring', image_url: 'jkbuguy', artist_id: user[2].id }
    ])


    ArtworkShare.create!([
        {viewer_id: user[3].id, artwork_id: artwork[2].id}
    ])



end