# here twitter can be whatever you want - its just your internal name for this object
myapp = oauth_app("twitter", key = "EERcCJd3ZUkWkE0HoE8b0r2YM", secret="UCyr8mpUzH0EoAzw2V00t7EI8npwizBEovqWO6i6qa3XxE6l21")

sig = sign_oauth1.0(myapp, token="165160255-OvyExMHz47dDzMNilqAYoylGD00XtylBi1nu931N", token_secret="UnzBXZ9zJRA5DdoQ5eE3r6LX5ofqtStbi6zqa0P4TE2PW")

homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig, count=5)

library(jsonlite)

json1 = content (homeTL)

json2 = jsonlite::fromJSON(toJSON(json1))

#display first record, first 4 column
print(json2[1:10,1:4])

