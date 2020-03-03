$( document ).ready(function() {

  var hash = window.location.hash;
  var service = 'https://cwgl.herokuapp.com';
  var shortener = 'http://cw.gl';
  var $s = $('#s');
  var $p = $('#p');
  var $q = $('#q');
  var $p_plus_q = $('#p_plus_q');
  var $url = $('#url');
  var $button = $('#add');

  // load

  if(hash.length > 0) {
    var slug = hash.replace(/^#/, '');
    $.ajax(service + '/' + slug + '.json', {
        method: 'GET',
        beforeSend: function(xmlHttpRequest) {
            xmlHttpRequest.withCredentials = true;
        }
    })
    .done(function(res) {
      var data = res.data;
      $s.val(data.s);
      $p.val(data.p);
      $q.val(data.q);
      $p_plus_q.val(data.p + data.q);
    });
  }

  // save

  $button.on('click', function() {
    $s.attr('disabled', true);
    $p.attr('disabled', true);
    $q.attr('disabled', true);
    $button.attr('disabled', true);
    var data = {
      url: window.location.origin,
      data: JSON.stringify({
        s: $s.val(),
        p: $p.val() * 1,
        q: $q.val() * 1
      })
    };
    $.ajax(service + '/add', {
        method: 'POST',
        data: data,
        beforeSend: function(xmlHttpRequest) {
            xmlHttpRequest.withCredentials = true;
        }
    })
    .done(function(res) {
      var slug = res.slug;
      $url.val(shortener + '/' + slug);
      $s.removeAttr('disabled');
      $p.removeAttr('disabled');
      $q.removeAttr('disabled');
      $p_plus_q.val(($p.val() * 1) + ($q.val() * 1));
      $p_plus_q.removeAttr('disabled');
      $url.removeAttr('disabled');
      $button.removeAttr('disabled');
      $url.focus().select();
    });
  });

});
