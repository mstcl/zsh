VIRTUAL_ENV = ${ANSIBLE_VENV}

install:
	ansible-playbook --diff main.yml --ask-become-pass

update:
	ansible-playbook --diff main.yml --tags=plugins

push:
	git push origin master prod
