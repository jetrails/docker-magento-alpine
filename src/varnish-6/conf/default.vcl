vcl 4.0;

backend default {
	.host = "nginx.docker.internal";
	.port = "8080";
}
