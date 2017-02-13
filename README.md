#HotelTonight Test Project
This app supports iPhones and iPads running iOS 10.
Built with Xcode Version 8.2.1 (8C1002). Written in Swift 3 and Objective-C.

This sample project initially displays a list of the most popular New York Times articles from the last 30 days. It enables users to search the New York Times API for articles, view details about each article, share the article, and view the full article in Safari.

One of the main motivation points behind the featured(popular) articles list was that they all contained thumbnail images which made the app look really nice on startup.

I decided I'd write half of the app in Swift. I thought I'd do the networking and model layers in Swift since I heard parsing JSON in Swift is all the rage. However, this brought up some interesting challenges when interfacing with Objective-C. Mainly with error handling, which I never got around to.

Also, after research, design, and writing the code, this project took somewhere between 10 and 12 hours.

I look forward to your feedback!

##3rd Party
[Nick Lockwood's AsyncImageView library] (https://github.com/nicklockwood/AsyncImageView).

##ios-coding-exercise-sbishopwta

Make a simple app that can search the New York Times article search API and return a list of articles for a given search query. The user should also be able to click on one of the returned articles and view the whole article in a web browser.

### API Details:

* Base URL: http://api.nytimes.com/svc/search/v2/articlesearch.json?q=#QUERY&api-key=#APIKEY
* API-KEY:`60aeaeae7fff4477958cfe2a8a6a76f5`
* Example URL: http://api.nytimes.com/svc/search/v2/articlesearch.json?q=presidential+elections&api-key=60aeaeae7fff4477958cfe2a8a6a76f5
* API Documentation: http://developer.nytimes.com/docs/read/article_search_api_v2#h2-requests

### App Details:
* Create a new project in Xcode.
* The app should open to a view controller with a table view embedded in a navigation controller.
* There should be a search bar at the top, where a user can tap into and type a search term.
* As the user types in the search bar it should dynamically populate a tableview.
* For each article returned from the response, the table view cell should have the article headline and a thumbnail image from that article.
* When a user taps on an article, it should push a detail view controller onto the navigation stack and present some details about that article.

### Rules
* Do all work on a feature branch (Do not commit directly to `master`)
* Do not use storyboards or xibs. We don’t use them (Except for launch screen).
* Use Google/Stackoverflow/etc as much as you want (We definitely use them at HT).
* Use any external libraries you like, except for autocompleting New York Times results. We would like you to implement all API calls to New York Times yourself. (For example: Using AFNetworking to build the API wrapper - Good! Some NY Times API CocoaPod that does everything - Bad!)
* You are welcome to include Swift code in your app, but it is not required. (You'll be writing both Objective-C and Swift at HT so if you include Swift, limit it to roughly 50% of the code in your project).
* This exercise should take 3-4 hours.

### When you are finished, open a pull request to merge into `master`.

**Also, please provide answers to the following questions when you open your PR:**

1. You may have noticed that only a few number of articles are returned by the API. Actually, there is a “page” parameter in the API that allows you to specify different pages to return. How would you implement this to display more results for a user’s search?

2. The search API has a limit of 10 requests per second per API key. If you were to distribute this app to the public, what issues may this bring? How would you approach solving those issues?

Let us know if you have any questions, and have fun!
