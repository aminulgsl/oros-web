$.fn.refreshDropDown = function(data, options) {
    try {
        var ctrlDropDown = this;
        ctrlDropDown.children().remove();
        options = $.extend({
            valueMember : 'id',
            textMember : 'name',
            addAllAttributes : false,
            unselectedValue : '',
            selectHints : '(Please Select one)'
// defaultValue : ''
        }, options);

// if (options.unselectedValue) {
        $($('<option></option>')).val(options.unselectedValue).html(options.selectHints).appendTo(ctrlDropDown);
// }

        $(data).each(function (e) {
            var opt = $($('<option></option>'));
            $.each(this, function(k, v) {
                if (k == options.textMember) opt.html(v);
                else if (k == options.valueMember) opt.val(v);
                else if (options.addAllAttributes) opt.attr(k, v);
            });
            opt.appendTo(ctrlDropDown);
        });
        // initial selection with default
        if (options.defaultValue) {
            ctrlDropDown.attr('value', options.defaultValue);
        }
    } catch (e) {

    }

};

function clearForm(form) {

    // iterate over all of the inputs for the form

    $(':input', form).each(function() {
        var type = this.type;
        var tag = this.tagName.toLowerCase(); // normalize case

        // password inputs, and textareas
        if (type == 'text' || type == 'password' || type == 'hidden' || tag == 'textarea') {
            this.value = "";
        }

        // checkboxes and radios need to have their checked state cleared
        else if (type == 'checkbox' || type == 'radio')
            this.checked = false;

        // select elements need to have their 'selectedIndex' property set to -1
        else if (tag == 'select') {
            this.selectedIndex = -1;
            this.value = '';
        }
    });

}
