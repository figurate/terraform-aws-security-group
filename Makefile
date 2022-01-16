SHELL:=/bin/bash
include .env

.PHONY: all clean validate test docs format

all: validate test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init && $(TERRAFORM) validate && \
		$(TERRAFORM) -chdir=modules/https-443-tcp init && $(TERRAFORM) -chdir=modules/https-443-tcp validate && \
		$(TERRAFORM) -chdir=modules/ssh-22-tcp init && $(TERRAFORM) -chdir=modules/ssh-22-tcp validate

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
