-HotelOffers project parsed from Expedia API. By: MOhammad Makahleh

-Clone the project files throw git : git clone https://github.com/makahleh/expedia.git

-My app URL :https://makahleh94.herokuapp.com/

-Technologiees i used : java, bootstrap, json , HTML ,css.

-No ajax requests implemented.

-Search filter doens't work on my site because they already doesn''t work when i did a direct 
call to the API throw the browser!! the call almost return with the same results.

Repo:
	1) launch: Main.java : define the path to the controller

	2) views: src->main->webapp: index.jsp : welcoming page/ Hotels.jp :shows All deals /showHotelDetails.jsp

	3) models: src\main\java\servlet-> hotelInfo.java: contains hotel attribute.	
					   Hotel.java has instance of hotelInfo.
					   Offers: has the function that do a live call to the API. 
	4) controller: HotelController.java -->dispatch requests and fill the data from the models.


Setting the application:

	1)Download Heroku and Git.

	2) Follow heroku instructions to create app.

	3) defining dependencies:tomcat and JSON-simple1.1.1 in pom.xml.

	4) define Procfile and a maven plugins in pom.xml.

	5) making a live call to the API then parse the results and view them.

	6) initializing Git repository then committ changes.

	7) push the project into Heroku's cloud.

more:https://devcenter.heroku.com/articles/getting-started-with-java#introduction.