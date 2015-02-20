  <script>
    var pre = document.getElementsByTagName('pre');
    var pl = pre.length;
    for (var i = 0; i < pl; i++) {
      var code = pre[i].innerHTML;
      var code_lines = code.split('\n');
      var m = code_lines[0].match(/\s*-- Line (\d+):$/);
      var first_line_num = 1;
 
      // Don't add line numbers unless they're requested.
      if (!m) continue;
 
      first_line_num = parseInt(m[1]);
      code_lines.shift();  // Drop the first (line-number-requesting) line.
      code_lines.pop();    // Drop the last (empty) line.
 
      var num = code_lines.length;
      pre[i].innerHTML = code_lines.join('\n');
  
      pre[i].innerHTML = '<span class="line-number"></span>' + pre[i].innerHTML + '<span class="cl"></span>';
      var num = pre[i].innerHTML.split(/\n/).length;
      for (var j = 0; j < num; j++) {
        var line_num = pre[i].getElementsByTagName('span')[0];
        line_num.innerHTML += '<span>' + (first_line_num + j) + '</span>';
      }
    }
  </script>
