document.getElementById('expander-item').click()
list = document.querySelectorAll('a.yt-simple-endpoint.style-scope.ytd-guide-entry-renderer')
urls = Array.from(list).map(link => { return link.getAttribute('href') })
