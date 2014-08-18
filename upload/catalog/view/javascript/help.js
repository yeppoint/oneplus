function reflushValidCode() {
  $('#codeImg') .attr('src', ajaxUrl.getValidCode + '?time=' + (new Date) .getTime())
}
function surrportNav() {
  function a(a) {
    $('#fixedNav li') .removeClass('cur'),
    $('#fixedNav li') .eq(a) .addClass('cur')
  }
  function b(a) {
    $(window) .scrollTop(a)
  }
  var c = $('#fixedNav') .position() .top,
  d = $('.introduce') .position() .top,
  e = $('.download-app-box') .position() .top,
  f = $('.use-introduce-box') .position() .top,
  g = $('.brand-share') .position() .top;
  $(window) .on('scroll resize', function () {
    var b = $(document) .scrollTop();
    b >= c && ($('#fixedNav') .css({
      position: 'fixed',
      top: '30px',
      zIndex: '3'
    }), $('#footer') .offset() .top - b < $('#fixedNav') .outerHeight(!0) && $('#fixedNav') .removeAttr('style')),
    c > b && $('#fixedNav') .removeAttr('style'),
    d >= b && (a(0), $('.goto-top') .hide()),
    b >= e && (a(1), $('.goto-top') .show()),
    b >= f && a(2),
    b >= g && a(3),
    $('.goto-top') .offset() .top >= $('#footer') .offset() .top - 50 && ($('.container') .css({
      position: 'relative'
    }), $('.goto-top') .css({
      position: 'absolute'
    })),
    b + $(window) .height() <= $('#footer') .offset() .top && ($('.container') .css({
      position: 'statics'
    }), $('.goto-top') .css({
      position: 'fixed'
    }))
  }),
  $('#fixedNav li') .on('click', function () {
    var a = $(this) .index();
    switch (a) {
    case 0:
      b(0);
      break;
    case 1:
      b(e);
      break;
    case 2:
      b(f);
      break;
    case 3:
      b(g)
    }
  })
}
function initMenu(a) {
  var b = a.split('/');
  $('#helpNav li[data-page="' + b[0] + '"]') .find('.arrow') .addClass('arrow-up') .end() .find('ul') .show() .end() .find('li[data-pageid="' + b[1] + '"]') .addClass('cur')
}
function backTop(a) {
  $(a) .on('click', function () {
    $(window) .scrollTop(0)
  })
}
$(function () {
  function a() {
    var a = $('.round-cur'),
    b = $('.round-img'),
    c = b.index(a);
    a.hide() .removeClass('round-cur'),
    c < b.length - 1 ? b.eq(c + 1) .addClass('round-cur') .show()  : b.eq(0) .addClass('round-cur') .show()
  }
  window.poplogin = window.poplogin || {
  },
  $('.isLogin') .on('click', function (a) {
    return '' === op.cookie.get('opnickname') ? (a.preventDefault(), window.messenger.targets.login.send(encodeURIComponent(window.location.href)), window.poplogin.show(), !1)  : void 0
  }),
  $('.guide-hd li') .on('click', function () {
    DD_belatedPNG.fix('.contact-card i.icon-service');
    var a = $(this) .index();
    $('.guide-hd li') .removeClass('current'),
    $(this) .addClass('current'),
    $('.guide-bd') .hide(),
    $('.guide-bd') .eq(a) .show()
  });
  var b = function () {
    var a = window.location.href.split('?');
    a.shift();
    for (var b = {
    }, c = 0; c < a.length; c++) {
      var d = a[c].split('=');
      b[d[0]] = d[1]
    }
    var e = b.target;
    e && $($('.guide-hd li') [e]) .trigger('click')
  };
  b(),
  $('.download-app-hd a') .click(function () {
    var a = $(this) .index();
    $('.download-app-hd a') .removeClass('current'),
    $(this) .addClass('current'),
    $('.phone-type-box') .hide(),
    $('.phone-type-box') .eq(a) .show()
  }),
  $('#helpNav .nav-category h4') .on('click', function () {
    var a = $(this) .parent('li') .find('ul');
    return a.is(':visible') ? (a.hide(), $(this) .find('.arrow') .removeClass('arrow-up'), !1)  : ($('#helpNav .nav-category .arrow') .removeClass('arrow-up') .addClass('arrow-down'), $(this) .find('.arrow') .addClass('arrow-up'), $('#helpNav .nav-category') .find('ul:visible') .slideUp(), void a.show())
  }),
  $('.sub-content-bd .title-bar') .on('click', function () {
    var a = $(this),
    b = a.next('.text-box'),
    c = $(this) .parent() .parent();
    b.is(':hidden') ? (c.find('.text-box') .hide(), c.find('.arrow') .removeClass('arrow-minus'), c.find('.arrow') .addClass('arrow-plus'), b.show(), a.find('.arrow') .removeClass('arrow-plus'), a.find('.arrow') .addClass('arrow-minus'))  : (c.find('.text-box') .hide(), c.find('.arrow') .removeClass('arrow-minus'), c.find('.arrow') .addClass('arrow-plus'))
  }),
  $('.stext') .focus(function () {
    $(this) .attr('placeholder', ''),
    $('#searchForm') .addClass('focus')
  }),
  $('.stext') .blur(function () {
    $('#searchForm') .removeClass('focus'),
    $(this) .attr('placeholder', '请输入您要查询的关键字')
  }),
  $('.sub-radio .no') .on('click', function () {
    var a = $(this);
    a.prop('checked') && a.parent() .parent() .find('.bad-answer-reason') .show()
  }),
  $('.sub-radio .yes') .on('click', function () {
    var a = $(this);
    a.prop('checked') && a.parent() .parent() .find('.bad-answer-reason') .hide()
  }),
  $('.tel-contact') .on('click', function () {
    op.help.telBox(),
    $('.dialogMask') .css('height', document.documentElement.clientHeight || document.body.clientHeight)
  }),
  $('.weixin-contact') .on('click', function () {
    op.help.weixinBox(),
    $('.dialogMask') .css('height', document.documentElement.clientHeight || document.body.clientHeight)
  }),
  $('#checkRealBtn') .on('click', function () {
    op.help.checkRealBox(),
    $('.dialogMask') .css('height', document.documentElement.clientHeight || document.body.clientHeight)
  });
  var c = setInterval(a, 5000);
  $('.arrow-left') .hide(),
  $('.arrow-right') .hide(),
  $('.intro-image') .on('mouseenter', function () {
    clearInterval(c),
    $('.arrow-left') .show(),
    $('.arrow-right') .show()
  }),
  $('.intro-image') .on('mouseleave', function () {
    $('.arrow-left') .hide(),
    $('.arrow-right') .hide(),
    c = setInterval(a, 5000)
  }),
  $('.arrow-left') .on('click', function (a) {
    a.preventDefault();
    var b = $('.round-cur'),
    c = $('.round-img'),
    d = c.index(b);
    b.hide() .removeClass('round-cur'),
    d > 0 ? c.eq(d - 1) .addClass('round-cur') .show()  : c.eq(c.length - 1) .addClass('round-cur') .show()
  }),
  $('.arrow-right') .on('click', function (a) {
    a.preventDefault();
    var b = $('.round-cur'),
    c = $('.round-img'),
    d = c.index(b);
    b.hide() .removeClass('round-cur'),
    d < c.length - 1 ? c.eq(d + 1) .addClass('round-cur') .show()  : c.eq(0) .addClass('round-cur') .show()
  }),
  $('#fixedNav') .length && surrportNav(),
  $('#gotoTopBtn') .length && backTop('#gotoTopBtn'),
  $('.feedback') .on('click', function (a) {
    if ('' === op.cookie.get('opnickname')) return a.preventDefault(),
    window.messenger.targets.login.send(encodeURIComponent(window.location.href)),
    window.poplogin.show(),
    !1;
    var b = !1;
    return obj = $(this) .closest('form'),
    $.ajax({
      dataType: 'json',
      url: feedbackAjaxUrl,
      data: $(obj) .serialize(),
      async: !1,
      success: function (a) {
        1 == a.ret ? (window.pop.alert('评论成功!'), b = !0)  : window.pop.alert('评论失败!' + a.data.msg)
      }
    }),
    b && $(obj) .hide(),
    !1
  })
}),
op.help = op.help || {
},
op.help = {
  dialog: function (a) {
    var b = {
      title: '提示',
      content: '',
      addContent: '',
      moduleId: ''
    },
    c = this,
    d = $.extend(b, a),
    e = '<div class="dialogMask"></div><div class="help-dialog-content" id="' + d.moduleId + '"><div class="help-dialog-hd"><a href="javascript:;" class="hd-close-btn"></a></div><div class="help-dialog-bd">' + d.content + '</div>' + d.addContent + '</div>';
    $('.help-container') .append(e),
    $('.help-dialog-content') .css({
      top: '50%',
      marginTop: $(window) .scrollTop() - $('.help-dialog-content') .outerHeight(!0) / 2 + 'px',
      left: '50%',
      marginLeft: '-' + $('.help-dialog-content') .outerWidth(!0) / 2 + 'px'
    }),
    $('.hd-close-btn') .on('click', function () {
      c.close()
    })
  },
  close: function () {
    $('.dialogMask') .remove(),
    $('.help-dialog-content') .remove()
  }
},
op.help.telBox = function () {
  var a = '<div class="hd-tel-box"><i class="icon-help-tel"></i><h4>电话客服</h4><strong>400-888-1111</strong><p>拨打费用：仅收市话费</p><p>服务时间：7*24小时</p><p class="tel-more"><a href="' + ajaxUrl.accountRead + '" target="_blank">了解更多&gt;&gt;</a></p></div>';
  op.help.dialog({
    title: '电话客服',
    content: a,
    moduleId: 'telBox'
  })
},
op.help.weixinBox = function () {
  var a = '<div class="hd-weixin-box"><h4>一加手机微信二维码</h4><i class="icon-help-weixin"></i><p>关注一加手机，获取最新技术资讯，独一无二技术支持， 极致客户服务，带给您与您的手机最周到呵护！</p></div>';
  op.help.dialog({
    title: '一加手机 微信二维码',
    content: a,
    moduleId: 'weixinBox'
  })
},
op.help.checkRealBox = function () {
  var a = '<div class="hd-check-box"><form class="hd-check-form" id="checkRealForm"><h4>使用IMEI码查询</h4><div class="check-form-block"><label>IMEI码：</label><input type="text" placeholder="输入您的IMEI码" id="imeiCode" maxlength="15" value="" /><span class="error-tip" id="imeiTip"></span></div><div class="check-form-block"><label>S/N 码：</label><input type="text" placeholder="输入您的S/N码" id="snCode" maxlength="15" value="" /><span class="error-tip" id="snTip"></span></div><div class="check-form-block"><label>验证码：</label><input type="text" placeholder="输入验证码" id="validCode" maxlength="4" /><img src="' + ajaxUrl.getValidCode + '" id="codeImg" /><a href="javascript:;" id="getCode">换一换</a><span class="error-tip" id="codeTip"></span></div><div class="check-form-block check-form-btn"><button type="submit">立即查询</button><span class="error-tip" id="validTip"></span></div></form><div class="get-imeicode"><h6>如何获取IMEI码</h6><p><span>①</span> 可在包装盒背面或电池仓找到编号贴；<img src="' + staticUrls.imeiCode + '" width="149" height="77" /><span>②</span> 在拨号界面输“<span class="imei-num">*#06#</span>” 查询IMEI码。</p><p class="note">如手机包装上的IMEI码与在拨号界面查询的IMEI码不同,您的手机可能不是正品。</p></div></div>';
  op.help.dialog({
    title: '使用IMEI码查询',
    content: a,
    moduleId: 'checkRealBox'
  }),
  $('#getCode') .on('click', function (a) {
    a.preventDefault(),
    reflushValidCode()
  }),
  $('#checkRealForm') .on('submit', function () {
    var a = $('#imeiCode'),
    b = $('#snCode'),
    c = $('#validCode');
    return '' === a.val() || null === a.val() ? ($('#imeiTip') .text('请输入IMEI码'), !1)  : 15 !== a.val() .length ? ($('#imeiTip') .text('您输入的IMEI码位数应为15位'), !1)  : ($('#imeiTip') .text(''), '' === b.val() || null === b.val() ? ($('#snTip') .text('请输入S/N码'), !1)  : b.val() .length < 15 ? ($('#snTip') .text('您输入的S/N码应为15位'), !1)  : ($('#snTip') .text(''), '' === c.val() || null === c.val() ? ($('#codeTip') .text('验证码不能为空'), !1)  : 4 !== c.val() .length ? ($('#codeTip') .text('验证码应为4位'), !1)  : ($.ajax({
      url: ajaxUrl.validCode,
      data: {
        data: c.val()
      },
      type: 'GET',
      async: !0,
      dataType: 'json',
      success: function (c) {
        return 1 != c.ret ? ($('#codeTip') .text('验证码不对，请重试'), !1)  : ($('#codeTip') .text(''), void $.ajax({
          url: ajaxUrl.checkReal,
          type: 'post',
          dataType: 'json',
          data: {
            imeiCode: a.val(),
            snCode: b.val()
          }
        }) .done(function (a) {
          if (1 == a.ret) {
            op.help.close();
            var b = '<div class="hd-imei-result clearfix"><div class="imei-result-box fl"><h4>查询结果</h4><h6>这是一台正品一加手机</h6><p>每个IMEI、S/N号组合唯一对应一台一加手机，<br>且仅为您拥有，感谢您购买一加手机，<br>我们将竭诚为您服务。</p></div><div class="imei-result-img fr"><img src="' + staticUrls.vphone + '"></div></div>';
            op.help.dialog({
              title: '查询结果',
              content: b,
              moduleId: 'imeiResult'
            })
          } else $('#validCode') .val(''),
          reflushValidCode(),
          $('#validTip') .text('您所输入的IMEI码和S/N号不在一加手机数据库中，请核实后查询。')
        }) .fail(function () {
          window.pop.alert('连接服务器出错')
        }))
      }
    }), !1)))
  })
},
op.help.phoneTypePageNav = function (a) {
  var b = $.extend(!0, this.defaults, a),
  c = 0,
  d = function (a) {
    $(b.button) .find('li') .removeClass('current'),
    $(b.button) .find('li') .eq(a + 1) .addClass('current');
    var c = 10 * a + 10;
    b.data.length < c ? (c = b.data.length, $(b.button) .find('.nextPage') .addClass('disabled'), $(b.button) .find('.prevPage') .removeClass('disabled'))  : 0 >= c - 10 && ($(b.button) .find('.prevPage') .addClass('disabled'), $(b.button) .find('.nextPage') .removeClass('disabled'));
    for (var d = '', e = 10 * a; c > e; e++) d += '<ul><li><img src="' + b.data[e].img + '" height="201" width="106" alt="' + b.data[e].type + '"></li><li><strong>' + b.data[e].type + '</strong></li><li><a href="' + b.data[e].url + '">下载</a></li></ul>';
    $(b.content) .html(d)
  };
  $(b.button) .find('li') .on('click', function () {
    return $(this) .hasClass('disabled') ? !1 : ($(this) .hasClass('nextPage') && (c += 1, d(c)), $(this) .hasClass('prevPage') && (c -= 1, d(c)), void ($(this) .attr('data-page') && (c = parseInt($(this) .attr('data-page')), d(c), $(b.button) .find('li') .removeClass('current'), $(this) .addClass('current'))))
  })
},
op.help.ServicePot = function () {
  var a = [
  ];
  this.showBaiduMap = function (b, c, d) {
    for (var e = $('.detail-addr'), f = e.length, g = 0; f > g; g++) {
      var h = e.eq(g) .text(),
      i = e.eq(g) .parent() .parent() .parent() .parent(),
      j = i.find('dt') .text(),
      k = i.find('li') .eq(0) .text(),
      l = i.find('li') .eq(2) .text();
      this.loadOnMap(b, c, f, j, k, h, l, d, this.formContent, this.addMarker),
      a = [
      ]
    }
  },
  this.loadOnMap = function (b, c, d, e, f, g, h, i, j, k) {
    c.getPoint(g, function (c) {
      if (c) {
        a.push(c);
        var i = j(e, f, g, h);
        k(b, c, i, g),
        d == a.length && (b.setViewport(a), $('.BMap_Marker') .click(function () {
          setTimeout(function () {
            $('.transit') .on('click', function () {
              var a = $.trim($(this) .parent() .find('.map-startPoint') .val());
              if ('' === a) return window.pop.alert('您输入的起点为空，百度地图不知道该干嘛哦'),
              !1;
              var b = $.trim($('#t-city') .text()),
              c = $.trim($(this) .parent() .parent() .find('.map-addr') .text()),
              d = 'http://api.map.baidu.com/direction?origin=name:' + a + '&destination=' + c + '&mode=transit&region=' + b + '&output=html&src=oneplus|shop';
              $(this) .attr('href', d)
            }),
            $('.driving') .on('click', function () {
              var a = $(this) .parent() .find('.map-startPoint') .val();
              if ('' === a) return window.pop.alert('您输入的起点为空，百度地图不知道该干嘛哦'),
              !1;
              var b = $('#t-city') .text(),
              c = $(this) .parent() .parent() .find('.map-addr') .text(),
              d = 'http://api.map.baidu.com/direction?origin=name:' + a + '&destination=' + c + '&mode=driving&region=' + b + '&output=html&src=oneplus|shop';
              $(this) .attr('href', d)
            })
          }, 0)
        }))
      }
    }, i)
  },
  this.addMarker = function (a, b, c, d) {
    var e = new BMap.Marker(b);
    a.addOverlay(e);
    var f = new BMap.InfoWindow(c, {
      width: 445,
      height: 175,
      enableMessage: !1
    });
    e.setTitle(d),
    e.addEventListener('click', function () {
      this.openInfoWindow(f)
    })
  },
  this.formContent = function (a, b, c, d) {
    var e = e || [];
    return e.push('<div class="map-potContainer"><h4>' + a + '</h4>'),
    e.push('<p>' + b + '</p>'),
    e.push('<p style="overflow:hidden;white-space: nowrap;text-overflow:ellipsis;">地址：<span class="map-addr">' + c + '</span></p>'),
    e.push('<p>' + d + '</p>'),
    e.push('<div class="map-lineSearch"><input class="map-startPoint" type="text" placeholder="请输入起点"><a href="javascript:;" target="_blank" class="map-traffic transit">乘车</a><a href="javascript:;" target="_blank" class="map-traffic driving">驾车</a></div></div></div>'),
    e.join('')
  },
  this.initialize = function (a) {
    var b = new BMap.Map('baiduMap'),
    c = new BMap.Point(114.041842, 22.610585);
    b.centerAndZoom(c, 16),
    b.addControl(new BMap.NavigationControl);
    var d = new BMap.Geocoder;
    this.showBaiduMap(b, d, a || '深圳市')
  };
  var b = this;
  $('#close-switch') .on('click', function () {
    $('#cityPanel') .hide(),
    $('.shop-spot-list') .css('overflow', 'auto')
  }),
  $('#citySelector') .on('click', function () {
    $('.shop-spot-list') .css('overflow', 'hidden'),
    $('#cityPanel') .show()
  }),
  $('.chooseMe') .on('click', function () {
    $('.shop-spot-list') .css('overflow', 'auto');
    var a = $(this) .parent() .parent() .parent() .find('strong') .text(),
    c = $(this) .text(),
    d = $(this) .attr('flag');
    $.ajax({
      url: potAjaxUrl,
      data: {
        addrCity: d
      },
      type: 'GET',
      async: !0,
      dataType: 'json',
      success: function (d) {
        if (1 != d.ret) return window.pop.alert(d.errMsg),
        !1;
        for (var e = d.data.nodeList, f = e.length, g = g || [], h = 0; f > h; h++) {
          var i = [
          ];
          i.push('<dl><dt>' + e[h].title + '</dt>'),
          i.push('<dd><ul><li>电话：' + e[h].tel + '</li>'),
          i.push('<li>地址：<span class="detail-addr">' + e[h].addr + '</span></li>'),
          i.push('<li>工作日：' + e[h].workingDays + '</li>'),
          i.push('<li>营业时间：' + e[h].openTime + '</li></ul></dd></dl>'),
          g.push(i.join(''))
        }
        $('#listContainer') .html(g.join('')),
        b.initialize(c),
        $('#t-province') .text(a),
        $('#t-city') .text(c),
        $('#t-total') .text('(' + d.data.count + '个)'),
        $('#cityPanel') .hide()
      }
    })
  }),
  $('.shop-spot-list') .delegate('dl', 'click', function () {
    var a = ($('.shop-spot-list dl') .index($(this)), $(this) .find('.detail-addr') .html());
    $('.BMap_Marker.BMap_noprint[title=\'' + a + '\']') .trigger('click')
  })
};

