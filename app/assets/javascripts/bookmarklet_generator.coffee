window.bookmarkletUrl = ->

  baseScript = """
(function (w) {
  "use strict";
  var baseUrl = "BASEURL",
      loc = w.location,
      enc = w.encodeURIComponent,
      baseAttrs = [["link[title]", w.document.title], ["link[url]", loc.href]],
      map = function(a, fn) {
        var len = a.length, r = [];
        for(var i = 0; i < len; i++) { r[i] = fn(a[i]); }
        return r;
      };
  loc.href = (function(attrs){
    return baseUrl + "?" + map(attrs, function(a) {
      var k = a[0], v = a[1];
      return enc(k) + "=" + enc(v);
    }).join("&");
  })(baseAttrs);
})(this);
"""

  urlFor = (path) ->
    {protocol, host} = window.location
    "#{protocol}//#{host}#{path}"

  bookmarklet = "javascript:" + encodeURIComponent(
    baseScript
      .replace /BASEURL/g, urlFor('/links/new')
      .replace /\bbaseUrl\b/g, 'bu'
      .replace /\bloc\b/g, 'l'
      .replace /\benc\b/g, 'e'
      .replace /\bbaseAttrs\b/g, 'ba'
      .replace /\bmap\b/g, 'm'
      .replace /\burlFor\b/g, 'u'
      .replace /\n/g, ''
      .replace /\s+/g, ' '
    )
