library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "e4c9d8d1e2f42facac72",
                   secret = "ebd2babc6967036c70bb33f8f342ca647b753e62")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp, cache=F )

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

output <- content(req)
list(output[[4]]$name, output[[4]]$created_at)

# OR:
#req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
#stop_for_status(req)
#content(req)