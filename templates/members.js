(function(){var a=Handlebars.template,b=Handlebars.templates=Handlebars.templates||{};b.members=a(function(a,b,c,d,e){function l(a,b){return"active"}function m(a,b){return"active"}function n(a,b){return"active"}function o(a,b){return"active"}c=c||a.helpers;var f="",g,h,i,j,k=this;f+='<div class="subnav">\r\n	<ul class="nav nav-pills">\r\n		<li class="',i=c.filter,g=i||b.filter,g=g===null||g===undefined||g===!1?g:g.all,h=c["if"],j=k.program(1,l,e),j.hash={},j.fn=j,j.inverse=k.noop,g=h.call(b,g,j);if(g||g===0)f+=g;f+='">\r\n			<a href="#members">All</a>\r\n		</li>\r\n		<li class="',i=c.filter,g=i||b.filter,g=g===null||g===undefined||g===!1?g:g.patient,h=c["if"],j=k.program(3,m,e),j.hash={},j.fn=j,j.inverse=k.noop,g=h.call(b,g,j);if(g||g===0)f+=g;f+='">\r\n			<a href="#members?filter=patients">Patients</a>\r\n		</li>\r\n		<li class="',i=c.filter,g=i||b.filter,g=g===null||g===undefined||g===!1?g:g.nurse,h=c["if"],j=k.program(5,n,e),j.hash={},j.fn=j,j.inverse=k.noop,g=h.call(b,g,j);if(g||g===0)f+=g;f+='">\r\n			<a href="#members?filter=nurses">Nurses</a>\r\n		</li>\r\n		<li class="',i=c.filter,g=i||b.filter,g=g===null||g===undefined||g===!1?g:g.doctor,h=c["if"],j=k.program(7,o,e),j.hash={},j.fn=j,j.inverse=k.noop,g=h.call(b,g,j);if(g||g===0)f+=g;return f+='">\r\n			<a href="#members?filter=doctors">Doctors</a>\r\n		</li>\r\n	</ul>\r\n</div>\r\n\r\n<table class="table table-bordered table-striped" data-list="members">\r\n	<colgroup>\r\n		<col style="width:26%" />\r\n		<col style="width:22%" />\r\n		<col style="width:20%" />\r\n		<col style="width:22%" />\r\n		<col style="width:10%" />\r\n	</colgroup>\r\n	<thead>\r\n		<tr>\r\n			<th>Name</th>\r\n			<th>Born City</th>\r\n			<th>Born State</th>\r\n			<th>Born Country</th>\r\n			<th>Actions</th>\r\n		</tr>\r\n	</thead>\r\n</table>\r\n',f})})()