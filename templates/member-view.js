(function(){var a=Handlebars.template,b=Handlebars.templates=Handlebars.templates||{};b["member-view"]=a(function(a,b,c,d,e){c=c||a.helpers;var f="",g,h,i=this,j="function",k=c.helperMissing,l=void 0,m=this.escapeExpression;return f+='<!-- READ VIEW -->\r\n<p class="avatar">\r\n	<img src="img/members/',h=c.member,g=h||b.member,g=g===null||g===undefined||g===!1?g:g.username,typeof g===j?g=g.call(b,{hash:{}}):g===l&&(g=k.call(b,"member.username",{hash:{}})),f+=m(g)+'.jpg" />\r\n</p>\r\n<dl class="dl-horizontal">\r\n	<dt>Name:</dt>\r\n	<dd>',h=c.member,g=h||b.member,g=g===null||g===undefined||g===!1?g:g.name,typeof g===j?g=g.call(b,{hash:{}}):g===l&&(g=k.call(b,"member.name",{hash:{}})),f+=m(g)+"</dd>\r\n	<dt>Username:</dt>\r\n	<dd>",h=c.member,g=h||b.member,g=g===null||g===undefined||g===!1?g:g.username,typeof g===j?g=g.call(b,{hash:{}}):g===l&&(g=k.call(b,"member.username",{hash:{}})),f+=m(g)+"</dd>\r\n	<dt>Id:</dt>\r\n	<dd>",h=c.member,g=h||b.member,g=g===null||g===undefined||g===!1?g:g.id,typeof g===j?g=g.call(b,{hash:{}}):g===l&&(g=k.call(b,"member.id",{hash:{}})),f+=m(g)+"</dd>\r\n	<dt>Type:</dt>\r\n	<dd>",h=c.member,g=h||b.member,g=g===null||g===undefined||g===!1?g:g.type,typeof g===j?g=g.call(b,{hash:{}}):g===l&&(g=k.call(b,"member.type",{hash:{}})),f+=m(g)+"</dd>\r\n	<dt>City:</dt>\r\n	<dd>",h=c.member,g=h||b.member,g=g===null||g===undefined||g===!1?g:g.city,typeof g===j?g=g.call(b,{hash:{}}):g===l&&(g=k.call(b,"member.city",{hash:{}})),f+=m(g)+"</dd>\r\n	<dt>State:</dt>\r\n	<dd>",h=c.member,g=h||b.member,g=g===null||g===undefined||g===!1?g:g.state,typeof g===j?g=g.call(b,{hash:{}}):g===l&&(g=k.call(b,"member.state",{hash:{}})),f+=m(g)+"</dd>\r\n	<dt>Country:</dt>\r\n	<dd>",h=c.member,g=h||b.member,g=g===null||g===undefined||g===!1?g:g.country,typeof g===j?g=g.call(b,{hash:{}}):g===l&&(g=k.call(b,"member.country",{hash:{}})),f+=m(g)+"</dd>\r\n</dl>",f})})()