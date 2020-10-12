# Heroku

## Environment & Installation

From <https://devcenter.heroku.com/articles/getting-started-with-ruby#introduction>:

1. Create a Heroku account on the website
2. Install the Heroku Toolbelt
3. `heroku login` = Login
4. `heroku create` = Prepare local repo and Heroku for transfer (create blank app on Heroku website)
5. `git push heroku master` = Push local repo onto Heroku remote
6. `heroku run rake db:migrate` = DB Structure
7. `heroku run rake db:seed` = DB Seed
8. `heroku open` = Open the freshly uploaded app
9. `heroku logs --tail` = Visit the live-updated remote logs (Ctrl+C to quit)
