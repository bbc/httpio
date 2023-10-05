# Pin Python version below 3.12.0. aiohttp is built from source for Python 3.12 and that failed.
# Regular review of issue scheduled in https://www.pivotaltracker.com/n/projects/2147543#
CLOUDFIT_BASE_NAME:=python
CLOUDFIT_BASE_LABEL:=3.11

# Disable type checking in this repo, since there are no type annotations
MS_DOCKER_MYPY:=FALSE

include static-commontooling/make/lib_static_commontooling.mk

# This repo pushes wheels to our internal Artifactory server, so we need to include the full commontooling defaults if
# they're available to pick up the relevant URL, but not enable internal build mode.
ifneq (,$(filter upload-wheel upload-wheels,$(MAKECMDGOALS)))
-include commontooling/make/include/defaults.mk
COMMONTOOLING_BUILD_ENV=os
endif

include static-commontooling/make/standalone.mk
include static-commontooling/make/pythonic.mk
include static-commontooling/make/docker.mk

