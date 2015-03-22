/*
 * Lazy Load - jQuery plugin for lazy loading images
 *
 * Copyright (c) 2007-2012 Mika Tuupola
 *
 * Licensed under the MIT license:
 *   http://www.opensource.org/licenses/mit-license.php
 *
 * Project home:
 *   http://www.appelsiini.net/projects/lazyload
 *
 * Version:  1.7.2
 *
 */
(function ($, window) {

    $window = $(window);

    $.fn.lazyload = function(options) {
        var elements = this;
        var settings = {
            threshold: 0,
            failure_limit: 0,
            event: "scroll",
            effect: "show",
            container: window,
            data_attribute: "original",
            skip_invisible: true,
            appear: null,
            load: null
        };

        function update() {
            var counter = 0;

            elements.each(function() {
                var $this = $(this);
                if (settings.skip_invisible && !$this.is(":visible")) {
                    return;
                }
                if ($.abovethetop(this, settings) ||
                    $.leftofbegin(this, settings)) {
                    /* Nothing. */
                } else if (!$.belowthefold(this, settings) &&
                    !$.rightoffold(this, settings)) {
                    $this.trigger("appear");
                } else {
                    if (++counter > settings.failure_limit) {
                        return false;
                    }
                }
            });

        }

        if (options) {
            /* Maintain BC for a couple of versions. */
            if (undefined !== options.failurelimit) {
                options.failure_limit = options.failurelimit;
                delete options.failurelimit;
            }
            if (undefined !== options.effectspeed) {
                options.effect_speed = options.effectspeed;
                delete options.effectspeed;
            }

            $.extend(settings, options);
        }

        /* Cache container as jQuery as object. */
        $container = (settings.container === undefined ||
            settings.container === window) ? $window : $(settings.container);

        /* Fire one scroll event per scroll. Not one scroll event per image. */
        if (0 === settings.event.indexOf("scroll")) {
            $container.bind(settings.event, function(event) {
                return update();
            });
        }

        this.each(function() {
            var self = this;
            var $self = $(self);

            self.loaded = false;

            /* When appear is triggered load original image. */
            $self.one("appear", function() {
                if (!this.loaded) {
                    if (settings.appear) {
                        var elements_left = elements.length;
                        settings.appear.call(self, elements_left, settings);
                    }
                    $("<img />")
                        .bind("load", function() {
                            $self
                                .hide()
                                .attr("src", $self.data(settings.data_attribute))[settings.effect](settings.effect_speed);
                            self.loaded = true;

                            /* Remove image from array so it is not looped next time. */
                            var temp = $.grep(elements, function(element) {
                                return !element.loaded;
                            });
                            elements = $(temp);

                            if (settings.load) {
                                var elements_left = elements.length;
                                settings.load.call(self, elements_left, settings);
                            }
                        })
                        .attr("src", $self.data(settings.data_attribute));
                }
            });

            /* When wanted event is triggered load original image */
            /* by triggering appear.                              */
            if (0 !== settings.event.indexOf("scroll")) {
                $self.bind(settings.event, function(event) {
                    if (!self.loaded) {
                        $self.trigger("appear");
                    }
                });
            }
        });

        /* Check if something appears when window is resized. */
        $window.bind("resize", function(event) {
            update();
        });

        /* Force initial check if images should appear. */
        update();

        return this;
    };
    /*图片浮动*/
    $.fn.float = function (settings) {
    if (typeof settings == "object") {
    settings = jQuery.extend({
    //延迟
    delay: 1000,
    //位置偏移
    offset: {
    left: 0,
    right: 0,
    top: 0,
    bottom: 0
    },
    style: null, //样式
    width: 100,  //宽度
    height: 200, //高度
    position: "rm" //位置
    }, settings || {});
    var winW = $window.width();
    var winH = $window.height();

    //根据参数获取位置数值

    function getPosition($applyTo, position) {
    var _pos = null;
    switch (position) {
    case "rm":
    $applyTo.data("offset", "right");
    $applyTo.data("offsetPostion", settings.offset.right);
    _pos = { right: settings.offset.right, top: winH / 2 - $applyTo.innerHeight() / 2 };
    break;
    case "lm":
    $applyTo.data("offset", "left");
    $applyTo.data("offsetPostion", settings.offset.left);
    _pos = { left: settings.offset.left, top: winH / 2 - $applyTo.innerHeight() / 2 };
    break;
    case "rb":
    _pos = { right: settings.offset.right, top: winH - $applyTo.innerHeight() };
    break;
    case "lb":
    _pos = { left: settings.offset.left, top: winH - $applyTo.innerHeight() };
    break;
    case "l":
    _pos = { left: settings.offset.left, top: settings.offset.top };
    break;
    case "r":
    _pos = { right: settings.offset.right, top: settings.offset.top };
    break;
    case "t":
    $applyTo.data("offset", "top");
    $applyTo.data("offsetPostion", settings.offset.top);
    _pos = { left: settings.offset.left, top: settings.offset.top };
    break;
    case "b":
    $applyTo.data("offset", "bottom");
    $applyTo.data("offsetPostion", settings.offset.bottom);
    _pos = { left: settings.offset.left, top: winH - $applyTo.innerHeight() };
    break;
    }
    return _pos;
    }

    //设置容器位置

    function setPosition($applyTo, position, isUseAnimate) {
    var scrollTop = $window.scrollTop();
    var scrollLeft = $window.scrollLeft();
    var _pos = getPosition($applyTo, position);
    _pos.top += scrollTop;
    isUseAnimate && $applyTo.stop().animate(_pos, settings.delay) || $applyTo.css(_pos);
    }

    return this.each(function () {
    var $this = $(this);
    $this.css("position", "absolute");
    settings.style && $this.css(settings.style);
    setPosition($this, settings.position);
    $(this).data("isAllowScroll", true);
    $(window).scroll(function () {
    $this.data("isAllowScroll") && setPosition($this, settings.position, true);
    });
    });
    } else {
    var speed = arguments.length > 1 && arguments[1] || "fast";
    this.each(function () {
    if (settings == "clearOffset") {
    var _c = {};
    if ($(this).data("offset")) {
    _c[$(this).data("offset")] = 0;
    $(this).data("isAllowScroll", false);
    $(this).stop().animate(_c, speed);
    }
    } else if (settings == "addOffset") {
    var _c = {};
    if ($(this).data("offset") && $(this).data("offsetPostion")) {
    _c[$(this).data("offset")] = $(this).data("offsetPostion");
    $(this).stop().animate(_c, speed);
    $(this).data("isAllowScroll", true);
    }

    } else if (settings == "setScrollDisable") {
    $(this).data("isAllowScroll", false);
    } else if (settings == "setScrollUsable") {
    $(this).data("isAllowScroll", true);
    }
    });
    }
    return this.each(function () {
    var $this = $(this);
    $this.css("position", "absolute");
    settings.style && $this.css(settings.style);
    setPosition($this, settings.position);
    $(this).data("isAllowScroll", true);
    $(window).scroll(function () {
    $this.data("isAllowScroll") && setPosition($this, settings.position, true);
    });
    });
    };

    /* Convenience methods in jQuery namespace.           */
    /* Use as  $.belowthefold(element, {threshold : 100, container : window}) */

    $.belowthefold = function (element, settings) {
        var fold;

        if (settings.container === undefined || settings.container === window) {
            fold = $window.height() + $window.scrollTop();
        } else {
            fold = $container.offset().top + $container.height();
        }

        return fold <= $(element).offset().top - settings.threshold;
    };

    $.rightoffold = function (element, settings) {
        var fold;

        if (settings.container === undefined || settings.container === window) {
            fold = $window.width() + $window.scrollLeft();
        } else {
            fold = $container.offset().left + $container.width();
        }

        return fold <= $(element).offset().left - settings.threshold;
    };

    $.abovethetop = function (element, settings) {
        var fold;

        if (settings.container === undefined || settings.container === window) {
            fold = $window.scrollTop();
        } else {
            fold = $container.offset().top;
        }

        return fold >= $(element).offset().top + settings.threshold + $(element).height();
    };

    $.leftofbegin = function (element, settings) {
        var fold;

        if (settings.container === undefined || settings.container === window) {
            fold = $window.scrollLeft();
        } else {
            fold = $container.offset().left;
        }

        return fold >= $(element).offset().left + settings.threshold + $(element).width();
    };

    $.inviewport = function (element, settings) {
        return !$.rightofscreen(element, settings) && !$.leftofscreen(element, settings) &&
                !$.belowthefold(element, settings) && !$.abovethetop(element, settings);
    };

    /* Custom selectors for your convenience.   */
    /* Use as $("img:below-the-fold").something() */

    $.extend($.expr[':'], {
        "below-the-fold": function (a) { return $.belowthefold(a, { threshold: 0, container: window }); },
        "above-the-top": function (a) { return !$.belowthefold(a, { threshold: 0, container: window }); },
        "right-of-screen": function (a) { return $.rightoffold(a, { threshold: 0, container: window }); },
        "left-of-screen": function (a) { return !$.rightoffold(a, { threshold: 0, container: window }); },
        "in-viewport": function (a) { return !$.inviewport(a, { threshold: 0, container: window }); },
        /* Maintain BC for couple of versions. */
        "above-the-fold": function (a) { return !$.belowthefold(a, { threshold: 0, container: window }); },
        "right-of-fold": function (a) { return $.rightoffold(a, { threshold: 0, container: window }); },
        "left-of-fold": function (a) { return !$.rightoffold(a, { threshold: 0, container: window }); }
    });
})(jQuery, window);
