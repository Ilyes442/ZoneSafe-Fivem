window.addEventListener('message', function(event) {
    var ed = event.data

    switch(ed.action) {
        case 'show':
        $('.safezone').show(100)
        break;

        case 'hide':
        $('.safezone').hide(1000)
    }
})
