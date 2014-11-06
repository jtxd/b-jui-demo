/*!
 * B-JUI v1.0 (http://b-jui.com)
 * Git@OSC (http://git.oschina.net/xknaan/B-JUI)
 * Copyright 2014 K'naan (xknaan@163.com).
 * Licensed under Apache (http://www.apache.org/licenses/LICENSE-2.0)
 */

/* ========================================================================
 * B-JUI: bjui-initui.js v1.0
 * @author K'naan (xknaan@163.com)
 * http://git.oschina.net/xknaan/B-JUI/blob/master/BJUI/js/bjui-initui.js
 * ========================================================================
 * Copyright 2014 K'naan.
 * Licensed under Apache (http://www.apache.org/licenses/LICENSE-2.0)
 * ======================================================================== */

+function ($) {
    'use strict';
    
    // INITUI CLASS DEFINITION
    // ======================
    var Initui = function(element, options) {
        var $this     = this
        this.$element = $(element)
        this.options  = options
    }
    
    Initui.DEFAULTS = {}
    
    Initui.prototype.init = function() {
        this.$element.trigger(BJUI.eventType.beforeInitUI)
        this.$element.trigger(BJUI.eventType.initUI)
        this.$element.trigger(BJUI.eventType.afterInitUI)
    }
    
    // INITUI PLUGIN DEFINITION
    // =======================
    
    function Plugin(option) {
        var args = arguments
        return this.each(function () {
            var $this   = $(this)
            var options = $.extend({}, Initui.DEFAULTS, $this.data(), typeof option == 'object' && option)
            var data    = $this.data('bjui.initui')
            if (!data) $this.data('bjui.initui', (data = new Initui(this, options)))
            var property = option
            if (typeof property == 'string' && $.isFunction(data[property])) {
                [].shift.apply(args)
                if (!args) data[property]()
                else data[property].apply(data, args)
            } else {
                data.init()
            }
        })
    }

    var old = $.fn.initui

    $.fn.initui             = Plugin
    $.fn.initui.Constructor = Initui
    
    // INITUI NO CONFLICT
    // =================
    
    $.fn.initui.noConflict = function () {
        $.fn.initui = old
        return this
    }
    
    // INITUI DATA-API
    // ==============

    $(document).on('click.bjui.initui.data-api', '[data-toggle="initui"]', function(e) {
        Plugin.call($this, $this.data())
        
        e.preventDefault()
    })
    
    /* beforeInitUI */
    $(document).on(BJUI.eventType.beforeInitUI, function(e) {
        var $box    = $(e.target)
        var noinits = []
        var $noinit = $box.find('[data-noinit]')
        
        // Hide not need to initialize the UI DOM
        $noinit.each(function(i) {
            var $this   = $(this)
            var pos     = {}
                        
            pos.$target = $this
            pos.$next   = $this.next()
            pos.$prev   = $this.prev()
            pos.$parent = $this.parent()
            
            noinits.push(pos)
            $this.remove()
        })
        
        $box.data('bjui.noinit', noinits)
    })
    
    /* afterInitUI */
    $(document).on(BJUI.eventType.afterInitUI, function(e) {
        var $box    = $(e.target)
        var noinits = $box.data('bjui.noinit')
        
        // Recovery not need to initialize the UI DOM
        if (noinits) {
            $.each(noinits, function(i, n) {
                //if (!n.$target.data('noinit')) return
                if (n.$next.length) n.$next.before(n.$target)
                else if (n.$prev.length) n.$prev.after(n.$target)
                else if (n.$parent.length) n.$parent.append(n.$target)
                
                n.$target.show()
                $box.removeData('bjui.noinit')
            })
        }
        
        $box.find('.bjui-pageHeader, .bjui-headBar, .bjui-footBar').attr('data-layout-fixed', true)
        $box.find('[data-layout-h]').layoutH($box.data('bjui.layoutBox') || $box)
    })
    
    /* ajaxStatus */
    $(document).on(BJUI.eventType.ajaxStatus, function(e) {
        var $this    = $(e.target)
        var $offset  = $this
        var position = $this.css('position')
        
        if (position == 'static') $offset  = $this.offsetParent()
        
        var zIndex   = parseInt($offset.css('zIndex')) || 0
        var $ajaxBackground = $(FRAG.maskBackground)
        var $ajaxProgress   = $(FRAG.maskProgress.replace('#msg#', BJUI.regional.progressmsg))
        
        $this.append($ajaxBackground).append($ajaxProgress)
        
        var bgZindex = parseInt($ajaxBackground.css('zIndex')) || 0
        var prZindex = parseInt($ajaxProgress.css('zIndex')) || 0
        
        if (zIndex > bgZindex) {
            $ajaxBackground.css('zIndex', zIndex + 1)
            $ajaxProgress.css('zIndex', zIndex + 2)
        }
        
        $this.one('ajaxStart', function() {
            $ajaxBackground.fadeIn()
            $ajaxProgress.fadeIn()
        }).one('ajaxStop', function() {
            $ajaxBackground.fadeOut()
            $ajaxProgress.fadeOut()
        })
    })
    
    /* Clean plugins generated 'Dom elements' in the body */
    var bodyClear = function($target) {
        $target.find('select[data-toggle="selectpicker"]').selectpicker('destroyMenu')
        $target.find('[data-toggle="selectztree"]').trigger('destory.bjui.selectztree')
        //$box.find('.j-selectzTree').trigger
        //
        //var destorySelectzTree = $.Event(DWZ.eventType.destorySelectzTree);
        //if (destorySelectzTree && destorySelectzTree.type) {
        //    $box.find('.j-selectzTree').trigger(DWZ.eventType.destorySelectzTree); 
       // }
    }
    
    $(document).on(BJUI.eventType.beforeLoadDialog, function(e) {
        //console.log(111)
    }).on(BJUI.eventType.beforeAjaxLoad, function(e) {
        bodyClear($(e.target))
    }).on(BJUI.eventType.beforeCloseNavtab, function(e) {
        bodyClear($(e.target))
    }).on(BJUI.eventType.beforeCloseDialog, function(e) {
        bodyClear($(e.target))
    })
    
    /* tooltip */
    /*$(document).on(BJUI.eventType.initUI, function(e) {
        var $this = $(e.target).find('[data-toggle="tooltip"]')
        
        $this.tooltip()
    })
    */
    
}(jQuery);