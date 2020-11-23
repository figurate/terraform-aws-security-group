SHELL:=/bin/bash
AWS_DEFAULT_REGION?=ap-southeast-2

TERRAFORM_VERSION=0.12.24
TERRAFORM=docker run --rm -v "${PWD}:/work" -e AWS_DEFAULT_REGION=$(AWS_DEFAULT_REGION) -e http_proxy=$(http_proxy) --net=host -w /work hashicorp/terraform:$(TERRAFORM_VERSION)

TERRAFORM_DOCS=docker run --rm -v "${PWD}:/work" tmknom/terraform-docs

CHECKOV=docker run --rm -v "${PWD}:/work" bridgecrew/checkov

DIAGRAMS=docker run --rm -v "${PWD}:/work" figurate/diagrams python

.PHONY: all clean validate test docs format

all: validate test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init && $(TERRAFORM) validate && \
		$(TERRAFORM) init modules/https-443-tcp && $(TERRAFORM) validate modules/https-443-tcp && \
		$(TERRAFORM) init modules/ssh-22-tcp && $(TERRAFORM) validate modules/ssh-22-tcp

test: validate
	$(CHECKOV) -d /work

diagram:
	$(DIAGRAMS) diagram.py

docs: diagram
	$(TERRAFORM_DOCS) markdown ./ >./README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/https-443-tcp >./modules/https-443-tcp/README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/ssh-22-tcp >./modules/ssh-22-tcp/README.md

format:
	$(TERRAFORM) fmt -list=true ./ && \
		$(TERRAFORM) fmt -list=true ./modules/https-443-tcp && \
		$(TERRAFORM) fmt -list=true ./modules/ssh-22-tcp
