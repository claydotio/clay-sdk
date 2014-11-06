/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	var ui;

	ui = __webpack_require__(1);

	describe('ui', function() {
	  return it('ui() throws if component name not found', function(done) {
	    var e;
	    try {
	      ui('INVALID');
	      return done(new Error('expected error'));
	    } catch (_error) {
	      e = _error;
	      return done();
	    }
	  });
	});


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	var components, ui, _ref,
	  __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

	components = {
	  ad: __webpack_require__(2)
	};

	ui = function(componentName, options) {
	  var Component;
	  if (__indexOf.call(components, componentName) < 0) {
	    throw new Error('Component not found', componentName);
	  }
	  Component = components[componentName];
	  return new Component(options);
	};

	if ((_ref = window.Clay) != null) {
	  _ref.ui = ui;
	}

	module.exports = ui;


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	var Ad;

	module.exports = Ad = (function() {
	  function Ad(_arg) {
	    this.type = _arg.type;
	    null;
	  }

	  Ad.prototype.render = function() {
	    return '<iframe></iframe>';
	  };

	  return Ad;

	})();


/***/ }
/******/ ])