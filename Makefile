fix:
	dart fix --apply && dart format .

runner:
	dart run build_runner build

clean:
	flutter clean

ci:
	dart pub get
	dart run build_runner build --delete-conflicting-outputs

apk:
	flutter clean
	dart pub get
	dart run build_runner build --delete-conflicting-outputs
	flutter build apk --obfuscate --split-debug-info="./build"
