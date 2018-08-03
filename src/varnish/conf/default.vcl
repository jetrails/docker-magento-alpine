vcl 4.0;

import std;

backend default {
	.host = "nginx.docker.internal";
	.port = "8080";
}
