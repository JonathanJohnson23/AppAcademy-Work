json.partial! "api/guests/guest", guest: @guest

json.gifts do
  json.title @guest.gifts
  json.description @guest.gifts
end

