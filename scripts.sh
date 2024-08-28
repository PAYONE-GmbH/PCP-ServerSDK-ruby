#!/bin/sh

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

format() {
    echo "Formatting the code..."
    bundle exec rake rubocop
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
    # TODO: Update the version in the ruby files
    # CSPROJ_PATH="./lib/PCPServerSDKDotNet/PCPServerSDKDotNet.csproj"
    # SERVER_META_INFO_PATH='./lib/PCPServerSDKDotNet/Utils/ServerMetaInfo.cs'
    # SERVER_META_INFO_TEST_PATH='./tests/PCPServerSDKDotNetTests/Utils/ServerMetaInfo.cs'
    # sed -i "" "s/<Version>.*<\/Version>/<Version>$NEW_VERSION<\/Version>/" ${CSPROJ_PATH}
    # sed -i "" "s/<AssemblyVersion>.*<\/AssemblyVersion>/<AssemblyVersion>$NEW_VERSION.0<\/AssemblyVersion>/" ${CSPROJ_PATH}
    # sed -i "" "s/<FileVersion>.*<\/FileVersion>/<FileVersion>$NEW_VERSION.0<\/FileVersion>/" ${CSPROJ_PATH}
    # sed -i "" "s/<PackageVersion>.*<\/PackageVersion>/<PackageVersion>$NEW_VERSION<\/PackageVersion>/" ${CSPROJ_PATH}
    # sed -i '' "s|DotNetServerSDK/v[0-9]*\.[0-9]*\.[0-9]*|DotNetServerSDK/v$NEW_VERSION|g" ${SERVER_META_INFO_PATH}
    # sed -i '' "s|DotNetServerSDK/v[0-9]*\.[0-9]*\.[0-9]*|DotNetServerSDK/v$NEW_VERSION|g" ${SERVER_META_INFO_TEST_PATH}

    # git add $CSPROJ_PATH
    # git add $SERVER_META_INFO_PATH
    # git add $SERVER_META_INFO_TEST_PATH
    npm install
    npm run changelog
    git add CHANGELOG.md
    git tag -a v$NEW_VERSION -m "Version $NEW_VERSION"
    git commit -m "Update version to $VERSION"
    git push origin tag v$NEW_VERSION
    git push -u origin HEAD

    echo "Version complete."
}

clear() {
    echo "Removing temp directories..."
    rm -f PCP-server-Ruby-SDK-*.gem
    echo "All temp directories have been removed."
}

publish() {
    # example: ./scripts.sh publish <NuGet token>
    # check if the NuGet token is passed
    if [ -z "$2" ]; then
        echo "Please provide the NuGet token."
        exit 1
    fi
    echo "Uploading the package..."
    TOKEN=$2

    # TODO
    echo "Upload complete."
}

run() {
    echo "Running the package..."
    # TODO
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
format)
    format
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
    echo "Usage: $0 {install|build|test|format|clear|version|publish|run}"
    exit 1
    ;;
esac
