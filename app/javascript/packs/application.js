// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("popper.js")
require("jquery")
require("bootstrap")
require("bootstrap-switch")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import $ from 'jquery';

$(document).ready(function(){
    $("[type='checkbox']").bootstrapSwitch();
});

$(document).ready(function(){
    var url = document.location.toString();
    console.log(url);
    if (url.match('#')) {
        $('.nav-tabs a[href="#' + url.split('#')[1] + '"]').tab('show');
    }
    // Change hash for page-reload
    $('.nav-tabs a').on('shown.bs.tab', function (e) {
        window.location.hash = e.target.hash;
    })
});

$(document).ready(function(){
    var input_config = $('input#config');
    var input_config_json = $('textarea#config_json');
    var input_line_count = $('input#line_count');
    var input_currency = $('input#currency');
    var input_bet_per_line = $('input#bet_per_line');
    var parsed = "";

    var handleUpdate = function(parsed){
        input_config.val(parsed['name']);
        var max_line_count = Math.max(parsed['settings']['linesteps']['list'])
        input_line_count.val(max_line_count);
        input_line_count.attr('max', max_line_count)
        input_bet_per_line.val(parsed['settings']['betsteps'][input_currency.val()]['default']);
    };

    input_config_json.on('change', function(){
        parsed = JSON.parse($(this).val());
        handleUpdate(parsed);
    });

    input_currency.on('change', function(){
        console.log("Currency has been changed");
        handleUpdate(parsed);
    })
});
