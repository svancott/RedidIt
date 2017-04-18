# RedidIt

## A Reddit replica built with Ruby on Rails.

Welcome to **_RedidIt_**!

![Reddit logo](https://img.clipartfest.com/436e053b7393439efe1feeef7c46b1ce_social-redditsvg-4k-clipart-reddit_512-512.svg)

[Check out the app!](https://redidit.herokuapp.com/)

**_RedidIt_** is an app that I built that's based on the fan fave Reddit, "*the front page of the internet*".

Users can sign up and sign in to get access to all the topics. Then, they can post on the the topic of their choosing, and just like at Reddit, the posts get up-votes and down-votes, with the highest voted posts displaying first.

Another ability users have is to comment on posts. Users can choose to *favorite* posts, and be notified by email when there are any new comments on those posts.

**_RedidIt_** uses a ranking algorithm that's similar to Reddit's, making sure that the best and most popular posts display first, but decrease slowly in rank over time.

To keep the most popular **current** posts at the top, I made the ranking method as follows:

|class Post|
|---|
|has_many :votes|

```def points
  votes.sum(:value)
end
```
```
def update_rank
  age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
  new_rank = points + age_in_days
  update_attribute(:rank, new_rank)
end
```

This way you don't have high rated posts from 10 years ago still showing up at the top.

I hope you've enjoyed **_RedidIt_**! Make sure to [Check out the app!](https://redidit.herokuapp.com/)


# About me

I'm a developer who's passionate about writing good code and loves the satisfaction of solving problems.

I've developed several apps using JavaScript, AngularJS, jQuery, and Ruby on Rails, using Git/Github as well as Heroku.

I'm also experienced HTML5 and CSS, and have worked with SQL and Firebase.

Currently, I'm looking for a developer role at a company that's as passionate as I am about doing good work.

[Check out more at my site!](http://stevevancott.com)

Feel free to email me at thevanicotti@gmail.com
