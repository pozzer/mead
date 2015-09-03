function  startBubbles(){
  ! function(t, i) {

      i["true"] = t, ! function(t) {
          "use strict";
          var i = function(i, o) {
              this.options = o, this.$yay = t(i), this.$content = this.$yay.find("~ .content-wrap"), this.$nano = this.$yay.find(".nano"), this.$html = t("html"), this.$body = t("body"), this.$window = t(window), this.changed = !1, this.init()
          };
          i.DEFAULTS = {
              duration: 300,
              resizeWnd: 1e3
          }, i.prototype.init = function() {
              var i = this;
              i.$body.addClass("yay-notransition"), i.$nano.nanoScroller({
                  preventPageScrolling: !0
              }), t(".yay-toggle").on("click", function(t) {
                  t.preventDefault(), i.toggleYay()
              }), i.$content.on("click", function() {
                  i.isHideOnContentClick() && i.hideYay()
              }), i.$yay.on("click", "li a.yay-sub-toggle", function(o) {
                  o.preventDefault(), i.toggleSub(t(this))
              }), "push" == i.showType() && i.isShow() && i.$body.css("overflow", "hidden"), i.$yay.hasClass("yay-gestures") && i.useGestures(), i.$window.on("resize", function() {
                  i.windowResize()
              }), i.windowResize(), setTimeout(function() {
                  i.$body.removeClass("yay-notransition")
              }, 1)
          }
          var o;
          i.prototype.windowResize = function() {
              var t = this;
              t.options.changed || (clearTimeout(o), o = setTimeout(function() {
                  t.$window.width() < t.options.resizeWnd && t.toggleYay("hide")
              }, 50))
          }, t(".yaybar").each(function() {
              {
                  var o = t.extend({}, i.DEFAULTS, t(this).data(), "object" == typeof option && option);
                  new i(this, o)
              }
          })
      }(jQuery), ! function(t) {
          "use strict";
          var i, o, n, e = function(i) {
                  i && (this.bubbles = [], this.$element = t(i), n = i.getContext("2d"), this.init())
              },
              s = function() {
                  function t(t) {
                      e.pos.y = t ? o + Math.random() * o * .2 : o + 20, e.pos.x = Math.random() * i, e.scale = .1 + .7 * Math.random(), e.velocity = .5* Math.random(), e.alpha = .1 + .2 * Math.random()
                  }
                  var e = this;
                  e.pos = {}, this.draw = function() {
                      e.alpha <= 0 && t(), e.pos.y -= e.velocity, e.alpha -= 4e-4, n.beginPath(), n.arc(e.pos.x, e.pos.y, 10 * e.scale, 0, 2 * Math.PI, !1), n.fillStyle = "rgba(255, 255, 255," + e.alpha + ")", n.fill()
                  }, t(!0)
              };
          e.prototype.init = function() {
              var o = this;
              o.updateSizes(), t(window).on("resize", function() {
                  o.updateSizes()
              }), o.$element.css({
                  position: "fixed",
                  top: 0,
                  "z-index": -5,
                  left: 0
              });
              for (var n = 0;.5 * i > n; n++) {
                  var e = new s;
                  o.bubbles.push(e)
              }
              o.animate()
          }, e.prototype.updateSizes = function() {
              i = window.innerWidth, o = window.innerHeight, this.$element.attr({
                  width: i,
                  height: o
              })
          }, e.prototype.animate = function() {
              var t = this;
              n.clearRect(0, 0, i, o);
              for (var e in t.bubbles) t.bubbles[e].draw();
              requestAnimationFrame(function() {
                  t.animate()
              })
          }, new e(t("#bubble-canvas")[0])
      }(jQuery)
  }({}, function() {
      return this
  }());
}
