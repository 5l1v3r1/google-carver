#grep -Po   '(?<="unescapedUrl": ")[^"]*'

 export GetToken=$(curl -s --compressed "https://cse.google.com/cse.js?cx=partner-pub-2698861478625135:3033704849" -L -D -)             
 
❯ echo $GetToken                                                                                                                                                                               ─╯
HTTP/2 200 
content-type: text/javascript; charset=ISO-8859-1
p3p: CP="This is not a P3P policy! See g.co/p3phelp for more info."
content-disposition: attachment; filename="f.txt"
content-encoding: gzip
date: Fri, 10 Jul 2020 17:21:39 GMT
server: gws
cache-control: private
content-length: 3135
x-xss-protection: 0
x-frame-options: SAMEORIGIN
expires: Fri, 10 Jul 2020 17:21:39 GMT
set-cookie: 1P_JAR=2020-07-10-17; expires=Sun, 09-Aug-2020 17:21:39 GMT; path=/; domain=.google.com; Secure
set-cookie: NID=204=NZhZA4z6NqdCxJQCnl3zQ33ZuWkIgmMW-85H06mfj8xQ39QahlDeVHiFa7C7dAM6diGSGH1uO7EvhwXF-F9k7fehfFaWGXayWD3va0JedFKIxjJ0LNXC46SAZvNyhtEZ8oGXwk7AakmNhtKHppL19XdegqlkuejdfL5TTrxyfIY; expires=Sat, 09-Jan-2021 17:21:39 GMT; path=/; domain=.google.com; HttpOnly
alt-svc: h3-29=":443"; ma=2592000,h3-27=":443"; ma=2592000,h3-25=":443"; ma=2592000,h3-T050=":443"; ma=2592000,h3-Q050=":443"; ma=2592000,h3-Q046=":443"; ma=2592000,h3-Q043=":443"; ma=2592000,quic=":443"; ma=2592000; v="46,43"

(function(opts_){var f=this||self,h=/^[\w+/_-]+[=]{0,2}$/,k=null,l=function(a){var b=typeof a;if("object"==b)if(a){if(a instanceof Array)return"array";if(a instanceof Object)return b;var c=Object.prototype.toString.call(a);if("[object Window]"==c)return"object";if("[object Array]"==c||"number"==typeof a.length&&"undefined"!=typeof a.splice&&"undefined"!=typeof a.propertyIsEnumerable&&!a.propertyIsEnumerable("splice"))return"array";if("[object Function]"==c||"undefined"!=typeof a.call&&"undefined"!=typeof a.propertyIsEnumerable&&
!a.propertyIsEnumerable("call"))return"function"}else return"null";else if("function"==b&&"undefined"==typeof a.call)return"object";return b},m=function(a,b){function c(){}c.prototype=b.prototype;a.prototype=new c;a.prototype.constructor=a};var n=function(a){if(Error.captureStackTrace)Error.captureStackTrace(this,n);else{var b=Error().stack;b&&(this.stack=b)}a&&(this.message=String(a))};m(n,Error);n.prototype.name="CustomError";var p=function(a,b){a=a.split("%s");for(var c="",e=a.length-1,d=0;d<e;d++)c+=a[d]+(d<b.length?b[d]:"%s");n.call(this,c+a[e])};m(p,n);p.prototype.name="AssertionError";var q=function(a,b,c){if(!a){var e="Assertion failed";if(b){e+=": "+b;var d=Array.prototype.slice.call(arguments,2)}throw new p(""+e,d||[]);}},t=function(a,b){throw new p("Failure"+(a?": "+a:""),Array.prototype.slice.call(arguments,1));};var u=function(a,b){a:{try{var c=a&&a.ownerDocument,e=c&&(c.defaultView||c.parentWindow);e=e||f;if(e.Element&&e.Location){var d=e;break a}}catch(r){}d=null}if(d&&"undefined"!=typeof d[b]&&(!a||!(a instanceof d[b])&&(a instanceof d.Location||a instanceof d.Element))){d=typeof a;if("object"==d&&null!=a||"function"==d)try{var g=a.constructor.displayName||a.constructor.name||Object.prototype.toString.call(a)}catch(r){g="<object could not be stringified>"}else g=void 0===a?"undefined":null===a?"null":
typeof a;t("Argument is not a %s (or a non-Element, non-Location mock); got: %s",b,g)}};var x=function(a,b){this.i=a===v&&b||"";this.l=w};x.prototype.toString=function(){return"Const{"+this.i+"}"};var y=function(a){if(a instanceof x&&a.constructor===x&&a.l===w)return a.i;t("expected object of type Const, got '"+a+"'");return"type_error:Const"},w={},v={};var z=function(){this.f=""};z.prototype.toString=function(){return"SafeScript{"+this.f+"}"};z.prototype.a=function(a){this.f=a};(new z).a("");var B=function(){this.b="";this.j=null;this.m=A};B.prototype.toString=function(){return"TrustedResourceUrl{"+this.b+"}"};
var C=function(a){if(a instanceof B&&a.constructor===B&&a.m===A)return a.b;t("expected object of type TrustedResourceUrl, got '"+a+"' of type "+l(a));return"type_error:TrustedResourceUrl"},E=function(a,b){var c=y(a);if(!aa.test(c))throw Error("Invalid TrustedResourceUrl format: "+c);a=c.replace(ba,function(e,d){if(!Object.prototype.hasOwnProperty.call(b,d))throw Error('Found marker, "'+d+'", in format string, "'+c+'", but no valid label mapping found in args: '+JSON.stringify(b));e=b[d];return e instanceof
x?y(e):encodeURIComponent(String(e))});return D(a)},ba=/%{(\w+)}/g,aa=/^((https:)?\/\/[0-9a-z.:[\]-]+\/|\/[^/\]|[^:/\%]+\/|[^:/\%]*[?#]|about:blank#)/i,ca=/^([^?#]*)(\?[^#]*)?(#[\s\S]*)?/,G=function(a){var b=da;a=E(ea,a);a=C(a).toString();a=ca.exec(a);var c=a[3]||"";return D(a[1]+F("?",a[2]||"",b)+F("#",c,void 0))},A={},D=function(a){var b=new B;b.b=a;return b},F=function(a,b,c){if(null==c)return b;if("string"==typeof c)return c?a+encodeURIComponent(c):"";for(var e in c){var d=c[e];d="array"==
l(d)?d:[d];for(var g=0;g<d.length;g++){var r=d[g];null!=r&&(b||(b=a),b+=(b.length>a.length?"&":"")+encodeURIComponent(e)+"="+encodeURIComponent(String(r)))}}return b};var H=function(){this.h=""};H.prototype.toString=function(){return"SafeStyle{"+this.h+"}"};H.prototype.a=function(a){this.h=a};(new H).a("");var I=function(){this.g=""};I.prototype.toString=function(){return"SafeStyleSheet{"+this.g+"}"};I.prototype.a=function(a){this.g=a};(new I).a("");var J=function(){this.c=""};J.prototype.toString=function(){return"SafeHtml{"+this.c+"}"};J.prototype.a=function(a){this.c=a};(new J).a("<!DOCTYPE html>");(new J).a("");(new J).a("<br>");var fa=new x(v,"https://www.google.com/cse/static/style/look/%{versionDir}%{versionSlash}%{theme}.css"),K=new x(v,"https://www.google.com/cse/static/element/%{versionDir}%{versionSlash}default%{experiment}+%{lang}.css"),ea=new x(v,"https://www.google.com/cse/static/element/%{versionDir}%{versionSlash}cse_element__%{lang}.js"),L=new x(v,"/");window.__gcse=window.__gcse||{};window.__gcse.ct=(new Date).getTime();
window.__gcse.scb=function(){var a=window.__gcse;M()||delete opts_.rawCss;var b=ha(a.initializationCallback||a.callback);google.search.cse.element.init(opts_)&&("explicit"!==a.parsetags?"complete"===document.readyState||"interactive"===document.readyState?(google.search.cse.element.go(),b&&b()):google.setOnLoadCallback(function(){google.search.cse.element.go();b&&b()},!0):b&&b())};function ha(a){return"function"===typeof a?a:"string"===typeof a&&"function"===typeof window[a]?window[a]:null}
function M(){return!(window.__gcse&&window.__gcse.plainStyle)}function N(a){var b=document.createElement("link");b.type="text/css";u(b,"HTMLLinkElement");b.rel="stylesheet";q(a instanceof B,'URL must be TrustedResourceUrl because "rel" contains "stylesheet"');b.href=a.j?a.j:C(a).toString();return b};var O,da=opts_.usqp?{usqp:opts_.usqp}:{},P=opts_.language.toLowerCase();O=opts_.cselibVersion?G({versionDir:opts_.cselibVersion,versionSlash:L,lang:P}):G({versionDir:"",versionSlash:"",lang:P});var Q=window.__gcse.scb,R=document.createElement("script");u(R,"HTMLScriptElement");R.src=C(O);var S;if(null===k)a:{var T=f.document,U=T.querySelector&&T.querySelector("script[nonce]");if(U){var V=U.nonce||U.getAttribute("nonce");if(V&&h.test(V)){k=V;break a}}k=""}(S=k)&&R.setAttribute("nonce",S);R.type="text/javascript";
Q&&(R.onload=Q);document.getElementsByTagName("head")[0].appendChild(R);
if(M()){document.getElementsByTagName("head")[0].appendChild(N(opts_.cselibVersion?E(K,{versionDir:opts_.cselibVersion,versionSlash:L,experiment:opts_.uiOptions.imageLayoutRedesign?"_v2":"",lang:opts_.language}):E(K,{versionDir:"",versionSlash:"",experiment:opts_.uiOptions.imageLayoutRedesign?"_v2":"",lang:opts_.language})));var W,X=opts_.uiOptions.cssThemeVersion||2,Y=opts_.theme.toLowerCase(),Z=X?"v"+X:Y.match(/v2_/g)?"v2":"",ia=Y.replace("v2_","");W=E(fa,{versionDir:Z,versionSlash:Z?L:"",theme:ia});
document.getElementsByTagName("head")[0].appendChild(N(W))};
})({
  "cx": "partner-pub-2698861478625135:3033704849",
  "language": "en",
  "theme": "V2_DEFAULT",
  "uiOptions": {
    "resultsUrl": "https://cse.google.com/cse?cx=partner-pub-2698861478625135:3033704849",
    "enableAutoComplete": false,
    "autoCompleteMatchType": "prefix",
    "enableImageSearch": false,
    "imageSearchLayout": "popup",
    "resultSetSize": "filtered_cse",
    "newWindow": false,
    "enableOrderBy": false,
    "orderByOptions": [],
    "overlayResults": false,
    "numTopRefinements": -1,
    "hideElementBranding": false,
    "cssThemeVersion": 4,
    "mobileLayout": "enabled",
    "isSafeSearchActive": true,
    "imageLayoutRedesign": true
  },
  "protocol": "https",


  http https://cse.google.com/cse/element/v1\?num\=10\&hl\=en\&cx\=a\&safe\=off\&cse_tok\=AJvRUv0GHBhLg-NkQwsb5Y9kn-rk:1594401699493\&start\=\&q\=1\&callback\=x                        
  /home/tux/.local/lib/python3.8/site-packages/requests/__init__.py:89: RequestsDependencyWarning: urllib3 (1.25.1) or chardet (3.0.4) doesn't match a supported version!
  warnings.warn("urllib3 ({}) or chardet ({}) doesn't match a supported "
HTTP/1.1 200 OK
Alt-Svc: h3-29=":443"; ma=2592000,h3-27=":443"; ma=2592000,h3-25=":443"; ma=2592000,h3-T050=":443"; ma=2592000,h3-Q050=":443"; ma=2592000,h3-Q046=":443"; ma=2592000,h3-Q043=":443"; ma=2592000,quic=":443"; ma=2592000; v="46,43"
Cache-Control: no-cache, no-store, max-age=0, must-revalidate
Content-Disposition: attachment; filename="json.txt"; filename*=UTF-8''json.txt
Content-Encoding: gzip
Content-Security-Policy: script-src 'report-sample' 'nonce-8r0Cv0lUkteQsQxSLok6xw' 'unsafe-inline';object-src 'none';base-uri 'self';report-uri /_/QualityProseCsqrElementHttp/cspreport;worker-src 'self'
Content-Type: application/javascript; charset=utf-8
Date: Fri, 10 Jul 2020 17:25:58 GMT
Expires: Mon, 01 Jan 1990 00:00:00 GMT
P3P: CP="This is not a P3P policy! See g.co/p3phelp for more info."
Pragma: no-cache
Server: ESF
Set-Cookie: NID=204=h07Dx_MyRj9TMyOOWJ7Ty9SFLVVoksUSnRlyAHlCRY-m_0rhs5Gs2-cuk5at_09AyQMcsAko8I63tHdlApOyw2bmUXorRyaKoEIEroIow5apUTJrkrLpCdx-l5mGECof3_b3ctJRjZTwJmjSY4MNdpFnZVZsHb9QNGcLrXWye4w; expires=Sat, 09-Jan-2021 17:25:58 GMT; path=/; domain=.google.com; HttpOnly
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 0

/*O_o*/
x({"error":{"errors":[{"domain":"global","reason":"forbidden","message":"Unauthorized access to internal API. Please refer to https://support.google.com/customsearch/answer/4542055"}],"code":403,"message":"Unauthorized access to internal API. Please refer to https://support.google.com/customsearch/answer/4542055"}});
