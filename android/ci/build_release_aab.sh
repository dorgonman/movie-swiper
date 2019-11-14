#!/bin/sh
set -e

pushd ..

    pushd ..
        cmd="react-native bundle --platform android --dev false  \
        --entry-file index.js \
        --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res \
        "
        echo $cmd
        eval $cmd
    popd

    rm -rf ./app/src/main/res/drawable-*
    rm -rf ./app/src/main/res/raw


    ./gradlew bundleRelease
popd
