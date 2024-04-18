SCRIPT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

# run in the bash shell
SHELL := /bin/bash

.PHONY: help
.DEFAULT_GOAL=help
help:  ## help for this Makefile
	@grep -E '^[a-zA-Z0-9_\-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: clean
clean:  ## removes temporary files
	rm -f .aider.chat.history.md
	rm -f .aider.input.history
	rm -rf .aider.tags.cache.v3/
	rm -rf quickstart/__pycache__/
	rm -rf .ruff_cache/
	rm -rf .mypy_cache/

.PHONY: check
check:  ## run code checks
	mypy --ignore-missing-imports .
	ruff check
	black -l 79 --check .

.PHONY: aider
aider:  ## run aider to modify code using AI
	aider -4 --no-auto-commits --no-dirty-commits

.PHONY: poetry-create
poetry-create:  ## RUN FIRST. Setup the Python poetry environment
	poetry install

.PHONY: poetry-delete
poetry-delete:  ## Deletes the Python poetry environment
	poetry env remove $$(poetry env list | cut -d ' ' -f 1)

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

.PHONY: component-attributes
component-attributes:  ## set attributes of components
	poetry run python interface/$@.py

.PHONY: multiple-input-output
multiple-input-output:  ## multiple inputs and outputs
	poetry run python interface/$@.py

.PHONY: image-example
image-example:  ## image modification example
	poetry run python interface/$@.py

.PHONY: example-calculator
example-calculator:  ## multiple inputs for a calculator
	poetry run python interface/$@.py

.PHONY: accordion-inputs
accordion-inputs:  ## additional inputs in an accordion
	poetry run python interface/$@.py

.PHONY: output-only-demo
output-only-demo:  ## output only components
	poetry run python interface/$@.py

.PHONY: input-only-demo
input-only-demo:  ## input only components
	poetry run python interface/$@.py

.PHONY: unified-input-output
unified-input-output:  ## unified input and output
	poetry run python interface/$@.py

.PHONY: global-state
global-state:  ## global state for top 3 scores
	poetry run python interface/$@.py

.PHONY: session-state
session-state:  ## session state for text in reverse order
	poetry run python interface/$@.py

.PHONY: live-interfaces
live-interfaces:  ## live interfaces, no clicking submit
	poetry run python interface/$@.py

.PHONY: streaming-components
streaming-components:  ## streaming components
	poetry run python interface/$@.py

.PHONY: blocks-structure
blocks-structure:  ## blocks structure
	poetry run python blocks/$@.py

.PHONY: change-event
change-event:  ## listen to change event
	poetry run python blocks/$@.py

.PHONY: multiple-data-flows
multiple-data-flows:  ## multiple data flows
	poetry run python blocks/$@.py

.PHONY: input-list-and-dict
input-list-and-dict:  ## input as a list and dict
	poetry run python blocks/$@.py

.PHONY: return-list-and-dict
return-list-and-dict:  ## return as a list and dict
	poetry run python blocks/$@.py

.PHONY: update-component
update-component:  ## change component
	poetry run python blocks/$@.py

.PHONY: blocks-calculator
blocks-calculator:  ## calculator in multiple blocks
	poetry run python blocks/$@.py

.PHONY: consecutive-events
consecutive-events:  ## consecutive events: event listener then method
	poetry run python blocks/$@.py

.PHONY: continuous-events
continuous-events:  ## continuous events: every parameter for change method
	poetry run python blocks/$@.py

.PHONY: gather-events
gather-events:  ## gather events data
	poetry run python blocks/$@.py

.PHONY: multiple-triggers
multiple-triggers:  ## multiple triggers, one function
	poetry run python blocks/$@.py

.PHONY: multiple-change-events
multiple-change-events:  ## change events are the default
	poetry run python blocks/$@.py

# TODO: add examples for layout in blocks
# https://www.gradio.app/guides/controlling-layout

# TODO: add examples for state in blocks
# https://www.gradio.app/guides/state-in-blocks
