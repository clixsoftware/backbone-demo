(function(){var a=Handlebars.template,b=Handlebars.templates=Handlebars.templates||{};b.home=a(function(a,b,c,d,e){c=c||a.helpers;var f,g=this;return'<div class="row">\r\n	<div class="span8">\r\n		<h2>Features this Backbone demo application supports</h2>\r\n		<ul>\r\n			<li>Single Page Application, the browser never does a page turn.</li>\r\n			<li>Ability to load different pages/areas.\r\n				<ul>\r\n					<li>Example: from the main navbar click Home and Members</li>\r\n				</ul>\r\n			</li>\r\n			<li>Routing that supports deep linking and the browser\'s back and forward buttons</li>\r\n			<li>Calls an external API for data: http://localhost:3000/members</li>\r\n			<li>Client Side MVC structure</li>\r\n			<li>Dynamic updating of information.\r\n				<ul>\r\n					<li>Example: when updating a member, that member\'s info is updated in the list of members</li>\r\n				</ul>\r\n			</li>\r\n			<li>CRUD operations on the members</li>\r\n			<li>Restful URLs</li>\r\n			<li>Forms use HTTP Verbs: Get, Create, Post and Put</li>\r\n			<li>Ablility to filter a list via a get parameter.</li>\r\n			<li>Form Validation</li>\r\n			<li>Success confirmations</li>\r\n			<li>Uses handlebars for the html templates.</li>\r\n			<li>http://localhost:3000/ is the api server that uses express.js</li>\r\n		</ul>\r\n		<h2>Main Technologies Used</h2>\r\n		<ul>\r\n			<li><a href="http://backbonejs.org/" target="_blank">Backbone.js</a></li>\r\n			<li><a href="http://underscorejs.org/" target="_blank">Underscore.js</a></li>\r\n			<li><a href="http://handlebarsjs.com/" target="_blank">Handlebars</a></li>\r\n			<li><a href="http://jquery.com/" target="_blank">jQuery</a></li>\r\n		</ul>\r\n		<h2>Secondary Technologies Used</h2>\r\n		<ul>\r\n			<li><a href="http://coffeescript.org/" target="_blank">CoffeeScript</a> <small>- for this app most of the JavaScript is written in CoffeeScript</small></li>\r\n			<li><a href="http://expressjs.com/" target="_blank">express.js</a></li>\r\n			<li><a href="http://lesscss.org/" target="_blank">{less}</a></li>\r\n			<li><a href="http://twitter.github.com/bootstrap/" target="_blank">Bootstrap, from Twitter</a></li>\r\n		</ul>\r\n	</div>\r\n	<div class="span4">\r\n		<iframe style="width:300px; height:250px;" src="http://www.youtube.com/embed/OlwRNCnsbUg" frameborder="0" allowfullscreen></iframe>\r\n	</div>\r\n</div>'})})()