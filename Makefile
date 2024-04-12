SCRIPT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

# run in the bash shell
SHELL := /bin/bash

.PHONY: help
.DEFAULT_GOAL=help
help:  ## help for this Makefile
	@grep -E '^[a-zA-Z0-9_\-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: aider
aider:  ## run aider to modify code using AI
	aider -4 --no-auto-commits --no-dirty-commits

.PHONY: quickstart
quickstart:  ## quickstart gradio example
	@echo open browser to http://127.0.0.1:7860
	poetry run python quickstart/app.py

.PHONY: streaming-output
streaming-output:  ## example with a streaming output
	poetry run python quickstart/streaming_output.py

.PHONY: alert-modal
alert-modal:  ## modal messages
	poetry run python quickstart/alert_modal.py

.PHONY: progress-bars
progress-bars:  ## progress bars
	poetry run python quickstart/progress_bars.py

.PHONY: batch-functions
batch-functions:  ## batch functions
	poetry run python quickstart/batch_functions.py

.PHONY: access-network-object
access-network-object:  ## access the network object
	poetry run python quickstart/access_network_object.py

.PHONY: mount-within-fastapi
mount-within-fastapi:  ## mount within a FastAPI app
	echo visit http://127.0.0.1:8000/, urls / and /gradio
	pushd quickstart && poetry run uvicorn mount_within_fastapi:app && popd

.PHONY: fixed-password
fixed-password:  ## password protect app with a fixed password
	poetry run python quickstart/fixed_password.py