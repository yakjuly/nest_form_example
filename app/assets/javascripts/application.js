// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$.extend({
	'dialog': {
		'open': function (opts) {
			/**
			 * 前端JS直接绘制一个对话框,加载特定URL的iframe
			 * openDialog(opts)
			 */		    
			if (typeof(opts) != 'object') { alert('请传入参数'); return false; }
			opts.iframeUrl && !opts.url && (opts.url = opts.iframeUrl);
			opts.url.match("http:") || (opts.url = opts.url);
			
			var len = $.dialog.list.length;
			
		    //当前对话框
		    var $dlg = top.$('<div><iframe frameborder="0" width="100%" height="100%" src="' + opts.url + '"></iframe></div>');
		    var option = {
		        title   : opts.title || '标题',
		        height  : opts.height || $(top).height() * 0.95,
		        width   : opts.width || '95%',
		        zIndex  : 99999,
		        modal   : opts.modal || true,
		        bgiframe: true,
		        close: function() {
		            //判断是否是登录页面
		            if (/passport\.oa\.com\/modules\/passport\/signin\.ashx/.test(opts.url)) {
		                top.removeQueryString && top.removeQueryString('isLogining');
		            }
		            
		            (typeof(opts.close) == 'function') && opts.close();
		            $.dialog.list[len] = null;
		            var ll = $.dialog.list.length;
		            while(ll--) {
		            	if ($.dialog.list[ll] != null) {
		            		$.dialog.curr = $.dialog.list[ll];
		            		break;
		            	}
		            }
		            
		            $dlg.find('iframe').remove();
		            $dlg.remove();
		            $dlg.dialog('destroy');
		            
		        },
		        focus: function (ev, data) {
		        	$.dialog.curr = $dlg;
		        },
		    	buttons: opts.buttons || null
		    };
		    
		    //设置iframe的参数
		    $dlg.dialog(option);
		    $dlg.dialog('open');
		    $.dialog.list.push($dlg);
		    //$dlg.find('iframe')[0].contentWindow.__parent = $dlg;
		},
		'list': [], /** 当前打开的对话框列表 */
		'curr': null, /** 当前激活的对话框 */
		'self': null /** 父框架当前激活的对话框，即本身 */
	}
});
$.openDialog = $.dialog.open;