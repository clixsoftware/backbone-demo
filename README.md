Backbone.js Demo Application
============================

Clone the repo, git clone git@github.com:jyounce/backbone-demo.git


Quick Start
-----------
1. You need to install node.js and express.js
2. cd to the express folder then type node data-server
3. That starts the api express.js server
4. Open up index.html in your browser and enjoy!
* If you want to run your views off a webserver then
1. cd to the express folder then type node view-server
2. Then in your browser, go to: http://localhost:3001/


Features this Backbone demo application supports
------------------------------------------------
* Single Page Application, the browser never does a page turn.
* Ability to load different pages/areas.
    1. Example: from the main navbar click Home and Members
* Routing that supports deep linking and the browser's back and forward buttons
* Calls an external API for data: http://localhost:3000/members
* Client Side MVC structure
* Dynamic updating of information.
    1. Example: when updating a member, that member's info is updated in the list of members
* CRUD operations on the members
* Restful URLs
* Forms use HTTP Verbs: Get, Create, Post and Put
* Ablility to filter a list via a get parameter.
* Form Validation
* Success confirmations
* Uses handlebars for the html templates.
* http://localhost:3000/ is the api server that uses express.js


Main Technologies Used
----------------------
* Backbone.js
* Underscore.js
* Handlebars
* jQuery


Secondary Technologies Used
---------------------------
* CoffeeScript - for this app most of the JavaScript is written in CoffeeScript
* express.js
* {less}
* Bootstrap, from Twitter