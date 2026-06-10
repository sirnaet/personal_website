.PHONY: build deploy build-flutter build-react

build-flutter:
	flutter build web

build-react:
	cd react-portfolio && npm run build

build: build-flutter build-react

deploy: build
	firebase deploy --only hosting

.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make build-flutter  - Build Flutter web version"
	@echo "  make build-react    - Build React portfolio"
	@echo "  make build          - Build both Flutter and React"
	@echo "  make deploy         - Build both and deploy to Firebase"
