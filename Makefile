# Justfiles are nicer, but Make is everywhere

setup:
	uv venv && uv sync
	@echo "activate: source ./.venv/bin/activate"

up:
	docker compose up -d --wait

clean:
	rm -rf *.egg-info .venv
	find . -type d -name "__pycache__" -prune -exec rm -rf {} \; 2>/dev/null || true

update_copier:
	uv tool run --with jinja2_shell_extension \
		copier@latest update --vcs-ref=HEAD --trust --skip-tasks --skip-answered
