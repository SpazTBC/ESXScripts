$(function() {
    window.addEventListener('message', function(event) {
        if (event.data.action === 'showNotification') {
            toastr.options = {
                closeButton: event.data.config.closeButton,
                debug: false,
                newestOnTop: true,
                progressBar: event.data.config.progress,
                positionClass: `toast-${event.data.config.position}`,
                preventDuplicates: false,
                onclick: null,
                showDuration: "300",
                hideDuration: "1000",
                timeOut: event.data.config.timeout,
                extendedTimeOut: "1000",
                showEasing: "swing",
                hideEasing: "linear",
                showMethod: event.data.config.animation.inAnimation,
                hideMethod: event.data.config.animation.outAnimation
            };

            toastr[event.data.type](event.data.message, event.data.title);
        }
    });
});