#!/bin/sh
set -eu

install() {
    echo "Installing dependencies..."
    bundle install
    echo "Dependencies installed."
}

# Function to build the package
build() {
    echo "Building the package..."
    gem build PCP-server-Ruby-SDK.gemspec
    echo "Build complete."
}

lint() {
    echo "Formatting the code..."
    bundle exec rake -- rubocop
    echo "Format complete."
}

# Function to run tests
test() {
    echo "Running tests..."
    bundle exec rake spec
    echo "Tests complete."
}

version() {
    # example: ./scripts.sh version 1.0.0
    if [ -z "$2" ]; then
        echo "Please provide the version."
        exit 1
    fi
    echo "Running version..."
    NEW_VERSION=$2

    VERSION_FILE_PATH="./lib/PCP-server-Ruby-SDK/version.rb"
    PACKAGE_JSON_PATH="./package.json"
    PACKAGE_LOCK_JSON_PATH="./package-lock.json"

    sed -i '' "s/VERSION = '.*'/VERSION = '$NEW_VERSION'/" "$VERSION_FILE_PATH"
    jq --arg v "$NEW_VERSION" '.version = $v' ${PACKAGE_JSON_PATH} > ${PACKAGE_JSON_PATH}.tmp && mv ${PACKAGE_JSON_PATH}.tmp ${PACKAGE_JSON_PATH}
    jq --arg v "$NEW_VERSION" '.version = $v | .packages[""].version = $v' ${PACKAGE_LOCK_JSON_PATH} > ${PACKAGE_LOCK_JSON_PATH}.tmp && mv ${PACKAGE_LOCK_JSON_PATH}.tmp ${PACKAGE_LOCK_JSON_PATH}

    # Commit and tag the changes
    git add $PACKAGE_JSON_PATH
    git add $VERSION_FILE_PATH
    npm install
    git add $PACKAGE_LOCK_JSON_PATH
    npm run changelog
    git add CHANGELOG.md
    git tag -a v$NEW_VERSION -m "Version $NEW_VERSION"
    git commit -m "chore: update version to $NEW_VERSION"
    git push origin tag v$NEW_VERSION
    git push -u origin HEAD

    echo "Version complete."
}

clear() {
    echo "Removing temp directories..."
    rm -f PCP-server-Ruby-SDK-*.gem
    rm -f Gemfile.lock
    rm -rf node_modules/
    echo "All temp directories have been removed."
}

publish() {
    # example: ./scripts.sh publish <RubyGems token>
    # check if the RubyGems token is passed
    if [ -z "$2" ]; then
        echo "Please provide the RubyGems token."
        exit 1
    fi
    echo "Uploading the package..."
    # Set the environment variable for RubyGems
    export GEM_HOST_API_KEY=$2
    VERSION=$(git describe --tags --abbrev=0 | sed 's/^v//')
    GEM_NAME=pcp-server-ruby-sdk-$VERSION.gem
    # Push the gem to RubyGems
    gem push $GEM_NAME
    echo "Upload complete."
}

run() {
    echo "Running the package..."
    ruby example-app/example.rb
}

# Check the first argument passed to the script
case "$1" in
install)
    install
    ;;
build)
    build
    ;;
test)
    test
    ;;
lint)
    lint
    ;;
clear)
    clear
    ;;
version)
    version $@
    ;;
publish)
    publish $@
    ;;
run)
    run
    ;;
*)
    echo "Usage: $0 {install|build|test|lint|clear|version|publish|run}"
    exit 1
    ;;
esac
