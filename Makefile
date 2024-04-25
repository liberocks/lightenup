fix:
	dart fix --apply && dart format .

runner:
	dart run build_runner build

apk:
	flutter clean
	dart pub get
	dart run build_runner build --delete-conflicting-outputs
	flutter build apk --obfuscate --split-debug-info="./build"
