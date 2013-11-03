
define (require, exports, module) ->
  $ = require 'jquery'
  
  $.notification = (options) ->
    settings = 
      type:'info'
      msg:'info'
      time:3
      fixed:false
    
    settings = $.extend settings, options  
    
    notifications = 'success':'alert-success', 'info':'alert-info', 'warning':'alert-warning', 'error':'alert-danger'
    div = ($ '<DIV/>').css( display:'none', 'z-index':1040).attr('data-type':'notification').addClass 'alert fade in '+notifications[settings.type]
    
    div.attr 'id':new Date().getTime()
    
    div.css position:'fixed', top:'0px', left:'0px', right:'0px' if settings.fixed
    
    div.append ($ '<A/>').addClass('close').attr('data-dismiss':'alert').text '×'
    div.append ($ '<CENTER/>').append ($ '<STRONG/>').text settings.msg
    
    ($ 'BODY DIV[data-type="notification"]').remove() if ($ 'BODY DIV[data-type="notification"]').length
    
    ($ 'BODY').prepend div
    div.slideDown(600)
    setTimeout ->
      div.slideUp ->
        div.remove()
        div = null
    , settings.time*600
  undefined
