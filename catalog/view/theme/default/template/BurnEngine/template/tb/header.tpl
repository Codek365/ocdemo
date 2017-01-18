<?php $tbData->slotFilter('common/header.scripts.filter', $scripts); ?>
<?php $tbData->slotFilter('common/header.styles.filter', $styles); ?>
<?php if (null === $tbData->is_touch): ?>
<script type="text/javascript" data-capture="0">
;window.Modernizr=function(a,b,c){function v(a){i.cssText=a}function w(a,b){return v(l.join(a+";")+(b||""))}function x(a,b){return typeof a===b}function y(a,b){return!!~(""+a).indexOf(b)}function z(a,b,d){for(var e in a){var f=b[a[e]];if(f!==c)return d===!1?a[e]:x(f,"function")?f.bind(d||b):f}return!1}var d="2.7.1",e={},f=b.documentElement,g="modernizr",h=b.createElement(g),i=h.style,j,k={}.toString,l=" -webkit- -moz- -o- -ms- ".split(" "),m={},n={},o={},p=[],q=p.slice,r,s=function(a,c,d,e){var h,i,j,k,l=b.createElement("div"),m=b.body,n=m||b.createElement("body");if(parseInt(d,10))while(d--)j=b.createElement("div"),j.id=e?e[d]:g+(d+1),l.appendChild(j);return h=["&#173;",'<style id="s',g,'">',a,"</style>"].join(""),l.id=g,(m?l:n).innerHTML+=h,n.appendChild(l),m||(n.style.background="",n.style.overflow="hidden",k=f.style.overflow,f.style.overflow="hidden",f.appendChild(n)),i=c(l,a),m?l.parentNode.removeChild(l):(n.parentNode.removeChild(n),f.style.overflow=k),!!i},t={}.hasOwnProperty,u;!x(t,"undefined")&&!x(t.call,"undefined")?u=function(a,b){return t.call(a,b)}:u=function(a,b){return b in a&&x(a.constructor.prototype[b],"undefined")},Function.prototype.bind||(Function.prototype.bind=function(b){var c=this;if(typeof c!="function")throw new TypeError;var d=q.call(arguments,1),e=function(){if(this instanceof e){var a=function(){};a.prototype=c.prototype;var f=new a,g=c.apply(f,d.concat(q.call(arguments)));return Object(g)===g?g:f}return c.apply(b,d.concat(q.call(arguments)))};return e}),m.touch=function(){var c;return"ontouchstart"in a||a.DocumentTouch&&b instanceof DocumentTouch?c=!0:s(["@media (",l.join("touch-enabled),("),g,")","{#modernizr{top:9px;position:absolute}}"].join(""),function(a){c=a.offsetTop===9}),c};for(var A in m)u(m,A)&&(r=A.toLowerCase(),e[r]=m[A](),p.push((e[r]?"":"no-")+r));return e.addTest=function(a,b){if(typeof a=="object")for(var d in a)u(a,d)&&e.addTest(d,a[d]);else{a=a.toLowerCase();if(e[a]!==c)return e;b=typeof b=="function"?b():b,typeof enableClasses!="undefined"&&enableClasses&&(f.className+=" "+(b?"":"no-")+a),e[a]=b}return e},v(""),h=j=null,e._version=d,e._prefixes=l,e.testStyles=s,e}(this,this.document);
function createCookie(b,c,d){var a=new Date();a.setTime(a.getTime()+(d*24*60*60*1000));document.cookie=b+"="+c+"; expires="+a.toGMTString()+"; path=/";} if (Modernizr.touch) { createCookie("is_touch", "1", 7); window.location.reload(); } else { createCookie("is_touch", "0", 7); }
</script>
<?php endif; ?>
<?php $tbData->slotFlag('catalog.template.header'); ?>
<?php if (!isset($tbData['seo_settings']['facebook_opengraph']) || !empty($tbData['seo_settings']['facebook_opengraph'])): ?>
<?php echo $tbData->fbMeta; ?>
<?php endif; ?>
<?php if (!isset($tbData['seo_settings']['twitter_card']) || !empty($tbData['seo_settings']['twitter_card'])): ?>
<?php echo $tbData->twitterMeta; ?>
<?php endif; ?>
<?php // CRITICAL CSS ////////////////////////////// ?>
<?php if (!empty($tbData->system['critical_css'])): ?>
<style><?php echo $tbData->system['critical_css']; ?></style>
<?php endif; ?>
<?php // CUSTOM FONTS ////////////////////////////// ?>
<?php if ($tbData->engine_config['catalog_google_fonts']): ?>
<?php if ($tbData->engine_config['catalog_google_fonts_js']): ?>
<script data-capture="0">
function includeFontResource(e){"use strict";function t(e,t,c){e.addEventListener?e.addEventListener(t,c,!1):e.attachEvent&&e.attachEvent("on"+t,c)}function c(e){return window.localStorage&&localStorage.font_css_cache&&localStorage.font_css_cache_file===e}function n(){if(window.localStorage&&window.XMLHttpRequest)if(c(a))o(localStorage.font_css_cache);else{var e=new XMLHttpRequest;e.open("GET",a,!0),e.onreadystatechange=function(){4===e.readyState&&200===e.status&&(o(e.responseText),localStorage.font_css_cache=e.responseText,localStorage.font_css_cache_file=a)},e.send()}else{var t=document.createElement("link");t.href=a,t.rel="stylesheet",t.type="text/css",document.getElementsByTagName("head")[0].appendChild(t),document.cookie="font_css_cache"}}function o(e){var t=document.createElement("style");t.setAttribute("type","text/css"),document.getElementsByTagName("head")[0].appendChild(t),t.styleSheet?t.styleSheet.cssText=e:t.innerHTML=e}var a=e;window.localStorage&&localStorage.font_css_cache||document.cookie.indexOf("font_css_cache")>-1?n():t(window,"load",n)}
<!--{{google_fonts_link}}-->
</script>
<?php else: ?>
<!--{{google_fonts_link}}-->
<?php endif; ?>
<?php endif; ?>
<?php // THEME STYLES ////////////////////////////// ?>
<!--{{style_resources_placeholder}}-->
<!--[if lt IE 10]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/BurnEngine/stylesheet/ie.css" media="screen" />
<![endif]-->
<?php // THEME SCRIPTS ////////////////////////// ?>
<!--{{javascript_resources_placeholder_header}}-->