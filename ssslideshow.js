$(document).ready(function() {

    function updateSlide(url,title) {
        $('#title').fadeOut();
        $('title').text("");
        $('#slide iframe').load(function() {
            if (title !== null && title !== "") {
                $('#title').text(title).fadeIn();
                $('title').text(title);
            }
        }).attr('src',url);
    }

    var streamUrl = $('body').attr('data-stream');
    
    if (!streamUrl) {
        updateSlide("about:blank","missing data-stream attribute at body tag!");
    } else {
        // TODO: check valid URL
        updateSlide("about:blank","loading "+streamUrl);

        var stream = new EventSource(streamUrl);
        // TODO: on error
        stream.onmessage = function (e) {
            var msg = JSON.parse(e.data);
            updateSlide(msg.url, msg.title);
        };
    }
});
