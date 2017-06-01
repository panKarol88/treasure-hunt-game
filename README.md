# README

Usage:
1.)
The treasure is created by default on Cracov Main Market (50.0618971 N, 19.936756 E)

2.)
Ask for token:
POST https://awesome-treasure-hunt-game.herokuapp.com/authenticate
and place in headers:
email:test@test.pl
password:test123

3.)
Save the token. It will allow you to authorize in every API call.

4.)
Example API calls:
POST https://awesome-treasure-hunt-game.herokuapp.com/treasure_hunt.json?current_location[]=50.26189&current_location[]=19.8367&email=test@test.com
GET https://awesome-treasure-hunt-game.herokuapp.com/analytics.json?start_time=20170601074102&end_time=20170601144102&radius=1000

Always by passing in headers:
Authorization:TOKEN
