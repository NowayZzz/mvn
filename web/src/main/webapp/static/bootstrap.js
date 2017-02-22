/*
 * This file is part of Ext JS 4.2
 * 
 * Copyright (c) 2011-2013 Sencha Inc
 * 
 * Contact: http://www.sencha.com/contact
 * 
 * GNU General Public License Usage This file may be used under the terms of the
 * GNU General Public License version 3.0 as published by the Free Software
 * Foundation and appearing in the file LICENSE included in the packaging of
 * this file.
 * 
 * Please review the following information to ensure the GNU General Public
 * License version 3.0 requirements will be met:
 * http://www.gnu.org/copyleft/gpl.html.
 * 
 * If you are unsure which license is appropriate for your use, please contact
 * the sales department at http://www.sencha.com/contact.
 * 
 * Build date: 2013-05-16 14:36:50 (f9be68accb407158ba2b1be2c226a6ce1f649314)
 */
/**
 * Load the library located at the same path with this file
 * 
 * Will automatically load ext-all-dev.js if any of these conditions is true: -
 * Current hostname is localhost - Current hostname is an IP v4 address -
 * Current protocol is "file:"
 * 
 * Will load ext-all.js (minified) otherwise
 */
var ctx = "", ext_theme="";

jQuery.cookie = function (key, value, options) {
    if (arguments.length > 1 && (value === null || typeof value !== "object")) {
        options = jQuery.extend({}, options);
 
        if (value === null) {
            options.expires = -1;
        }
 
        if (typeof options.expires === 'number') {
            var days = options.expires, t = options.expires = new Date();
            t.setDate(t.getDate() + days);
        }
        //console.log('option======='+options.raw+"-----"+options.expires+"--------"+options.path+"--------"+options.domain+"--------"+options.secure);
        return (document.cookie = [
            encodeURIComponent(key), '=',
            options.raw ? String(value) : encodeURIComponent(String(value)),
            options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
            options.path ? '; path=' + options.path : '',
            options.domain ? '; domain=' + options.domain : '',
            options.secure ? '; secure' : ''
        ].join(''));
    }
 
    // key and possibly options given, get cookie...
    options = value || {};
    var result, decode = options.raw ? function (s) { return s; } : decodeURIComponent;
    return (result = new RegExp('(?:^|; )' + encodeURIComponent(key) + '=([^;]*)').exec(document.cookie)) ? decode(result[1]) : null;
};

(function() {
	var scripts = document.getElementsByTagName('script'), localhostTests = [
			/^localhost$/,
			/\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(:\d{1,5})?\b/ // IP
																																															// v4
	], host = window.location.hostname, isDevelopment = null, queryString = window.location.search, test, path, i, ln, scriptSrc, match;

	for (i = 0, ln = scripts.length; i < ln; i++) {
		scriptSrc = scripts[i].src;

		match = scriptSrc.match(/bootstrap\.js$/);

		if (match) {
			path = scriptSrc.substring(0, scriptSrc.length - match[0].length);
			break;
		}
	}

	if (queryString.match('(\\?|&)debug') !== null) {
		isDevelopment = true;
	} else if (queryString.match('(\\?|&)nodebug') !== null) {
		isDevelopment = false;
	}

	if (isDevelopment === null) {
		for (i = 0, ln = localhostTests.length; i < ln; i++) {
			test = localhostTests[i];

			if (host.search(test) !== -1) {
				isDevelopment = true;
				break;
			}
		}
	}

	if (isDevelopment === null && window.location.protocol === 'file:') {
		isDevelopment = true;
	}
	 
	function getContextPath(){
		var pathName = document.location.pathname;
		var index = pathName.substr(1).indexOf("/");
		var result = pathName.substr(0, index + 1);
		return result;
	}
	ctx = getContextPath();
	//ext_theme = $.cookie('ext_theme')?$.cookie('ext_theme'):'ext-all'; // 读取 cookie
	//var extPath = path+'ext4.2.1/';
	var easyuiPath = path + 'easyui_1.5.1/'
	
	document.write('<meta http-equiv="pragma" content="no-cache"/>');
	document.write('<meta http-equiv="cache-control" content="no-cache"/>');
	document.write('<meta http-equiv="expires" content="0"/>');

	document.write('<link id="theme" rel="stylesheet" type="text/css" href="' + easyuiPath + 'themes/gray/easyui.css"></link>');
	document.write('<link rel="stylesheet" type="text/css" href="' + easyuiPath + 'themes/icon.css"></link>');
	//document.write('<script type="text/javascript" src="'+ctx+'/static/css/common.css"></script>');
	document.write('<script type="text/javascript" charset="UTF-8" src="' + easyuiPath + 'jquery.easyui.min.js"></script>');
	document.write('<script type="text/javascript" charset="UTF-8" src="' + easyuiPath + 'locale//easyui-lang-zh_CN.js"></script>');
		
})();
