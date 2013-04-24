# This will listen on port 80 and redirect any HTTP requests to KA Lite.
# Run this in the background using:
# sudo python redirect.py &

import BaseHTTPServer

class RedirectHandler(BaseHTTPServer.BaseHTTPRequestHandler):

    def do_HEAD(self):
        host = self.headers.get("host", "1.1.1.1").split(":")[0]
        self.send_response(302)
        self.send_header("Location", "http://%s:8008/" % host)
        self.end_headers()

    def do_GET(self):
        self.do_HEAD()

if __name__ == '__main__':
    httpd = BaseHTTPServer.HTTPServer(("", 80), RedirectHandler)
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        pass
    httpd.server_close()
