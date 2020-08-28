docker_repository := jetrails/magento-alpine
all_tags = $(shell ls src)

ifeq (build,$(firstword $(MAKECMDGOALS)))
passed_tag := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(passed_tag):;@:)
endif
ifeq (publish,$(firstword $(MAKECMDGOALS)))
passed_tag := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(passed_tag):;@:)
endif

build_all:
	@for tag in $(all_tags); do \
		$(MAKE) build $$tag; \
	done

publish_all:
	@for tag in $(all_tags); do \
		$(MAKE) publish $$tag; \
	done

build: src/$(passed_tag)/**/*
	@if [ -z $(passed_tag) ]; then \
		echo "error: tag argument missing, expecting 'make build [tag]'"; \
		exit 1; \
	elif [ ! -f src/$(passed_tag)/Dockerfile ]; then \
		echo "error: 'src/$(passed_tag)/Dockerfile' does not exist"; \
		exit 1; \
	else \
		echo "Building $(docker_repository):$(passed_tag) ..."; \
		docker build --squash "src/$(passed_tag)" -t "$(docker_repository):$(passed_tag)"; \
	fi

publish:
	@if [ -z $(passed_tag) ]; then \
		echo "error: tag argument missing, expecting 'make publish [tag]'"; \
		exit 1; \
	elif [ ! -f src/$(passed_tag)/Dockerfile ]; then \
		echo "error: seems to be an invalid tag"; \
		exit 1; \
	else \
		echo "Publishing $(docker_repository):$(passed_tag) ..."; \
		docker push "$(docker_repository):$(passed_tag)"; \
	fi
