function set_pov (clazz) {
    var els = document.getElementsByClassName("feature_block");

    for (var i = 0; i < els.length; ++i) {
        var str = els[i].getAttribute('data-access');
        if(els[i].hasAttribute('data-access')){
            if(clazz == null || str.indexOf(clazz + ",") >= 0)
                els[i].style.display = 'block';
            else
                els[i].style.display = 'none';
        }
    }
}

var cls_hidden = 'expand_block_hidden';

function alter_display_by_id (id, value) {
    var el = document.getElementById (id + '_expanded');
    var show = true;
    var cls_hidden = 'expand_block_hidden';
    if (el) {
        if (value == 'none') {
            show = false;
        } else if (value == 'block') {
            show = true;
        } else {
            show = el.classList.contains (cls_hidden);
        }

        el.classList[show ? 'remove' : 'add'] (cls_hidden);

        var el_exp = document.getElementById (id + '_hl');
        if (el_exp) {
            el_exp.innerHTML = show ? '-' : '+';
        }
    }
    return true;
}

var href_clicked = false;

function href_class_link (el) {
	href_clicked = true;
	window.location.replace (el.href);	/* Add this to prevent browser whims ! */
	return true;
}

function href_feature_link (el) {
	href_clicked = true;
	alter_display_by_id ('id.' + el.href.substring (el.href.lastIndexOf ('#') + 1) + '.', true);
	return true;
}

function href_nav_link (el) {
	href_clicked = true;
	return true;
}

function click_by_id (id) {
	if (href_clicked == false) {
		alter_display_by_id (id, 'toggle');
	} else {
		href_clicked = false;
	}
	return true;
}

function end_with (s, pattern) {
	var i = s.lastIndexOf (pattern);
	return (i >= 0 && i == s.length - pattern.length);
}

function set_class_name (el, value) {
	el.className = value;
	return true;
}

function set_hl_class_by_id (id, flag) {
    var el = document.getElementById (id + '_hl');
    if(el){
	if (flag) {
	    if (!end_with (el.className, '_hover')) {
		el.className = el.className + '_hover';
	    }
	} else {
	    if (end_with (el.className, '_hover')) {
		el.className = el.className.substring (0, el.className.lastIndexOf ('_hover'));
	    }
	}
    }
    return true;
}

function init () {
	var els = document.getElementsByTagName ('div');
	for (var i = 0; i < els.length; ++i) {
		var el = els [i];
		if (end_with (el.className, '_title')) {
			el.onmouseover = function () { return set_hl_class_by_id (this.id, true); };
			el.onmouseout = function () { return set_hl_class_by_id (this.id, false); };
			el.onclick = function () { return click_by_id (this.id); };
			el.ondblclick = function () { return true; };

			/* Set the '+' or '-' mark if the corresponding expandable block is expanded or not. */
			var e_exp = document.getElementById (el.id + '_expanded');
			if (e_exp) {
				var e_hl = document.getElementById (el.id + '_hl');
				if (e_hl) {
					if (e_exp.classList.contains (cls_hidden))
						e_hl.innerHTML = '+';
					else
						e_hl.innerHTML = '-';
				}
			}
		} else if (end_with (el.className, '_expand_mark')) {
			el.onmouseover = new Function ("return set_class_name (this, '" + el.className + "_hover');");
			el.onmouseout = new Function ("return set_class_name (this, '" + el.className + "');");
			el.onclick = function () { return click_by_id (this.id.substring (0, this.id.lastIndexOf ('_hl'))); };
			el.ondblclick = function () { return true; };
		}
	}
	els = document.getElementsByTagName ('a');
	for(var i = 0; i < els.length; ++i) {
		var el = els [i];
		if (el.className == 'class_link') {
			el.onclick = function () { return href_class_link (this); };
		} else if (el.className == 'feature_link') {
			el.onclick = function () { return href_feature_link (this); };
		} else if (el.className == 'nav_link') {
			el.onclick = function () { return href_nav_link (this); };
		}
	}
}

