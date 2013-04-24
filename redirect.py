# This will listen on port 80 and redirect any HTTP requests to KA Lite.
# Run this in the background using:
# sudo python redirect.py &

import BaseHTTPServer

DESTINATION_URL = "http://1.1.1.1:8008/"

class RedirectHandler(BaseHTTPServer.BaseHTTPRequestHandler):

    def do_HEAD(s):
        s.send_response(302)
        s.send_header("Location", DESTINATION_URL)
        s.end_headers()

    def do_GET(s):
        s.do_HEAD()

if __name__ == '__main__':
    httpd = BaseHTTPServer.HTTPServer(("", 80), RedirectHandler)
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        pass
    httpd.server_close()
