# Copyright (C) 2015, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

APP = hyperion
VERSION = 0.3.0

SHELL := /bin/bash

VAGRANT = vagrant

DOCKER = docker
DOCKER_MACHINE = docker-machine
MACHINE_NAME = hyperion-rancher

RANCHER_URI = https://github.com/rancher/os/releases/download
RANCHER_VERSION = 0.4.2-rc1

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m

OUTPUT=bin

all: help

help:
	@echo -e "$(OK_COLOR) ==== [$(APP)] [$(VERSION)]====$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- machine$(NO_COLOR)   : Initialize machine$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- configure$(NO_COLOR) : Setup configuration$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- rancher$(NO_COLOR)   : Install Rancher$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- info$(NO_COLOR)      : Display informations$(NO_COLOR)"

.PHONY: machine
machine:
	@echo -e "$(OK_COLOR)[$(APP)] Create machine$(NO_COLOR)"
	$(DOCKER_MACHINE) create -d virtualbox \
		--virtualbox-boot2docker-url $(RANCHER_URI)/v$(RANCHER_VERSION)/rancheros.iso $(MACHINE_NAME)

.PHONY: conf
configure:
	@echo -e "$(OK_COLOR)[$(APP)] Configure$(NO_COLOR)"
	eval "$(DOCKER_MACHINE) env $(MACHINE_NAME)"

.PHONE: rancher
rancher:
	@echo -e "$(OK_COLOR)[$(APP)] Install Rancher$(NO_COLOR)"
	$(DOCKER) run -d --restart=always -p 8080:8080 rancher/server
	$(DOCKER_MACHINE) ip $(MACHINE_NAME)

.PHONE: info
info:
	@echo -e "$(OK_COLOR)[$(APP)] Informations$(NO_COLOR)"
	@$(DOCKER_MACHINE) ip $(MACHINE_NAME)
	@$(DOCKER) ps

