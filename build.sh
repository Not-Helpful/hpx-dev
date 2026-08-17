VERSION=built-with-pacman-clang22
rm -rf build/$VERSION
mkdir -p build
mkdir -p build/$VERSION

CXX=clang++ cmake  -B build/$VERSION \
    -DCMAKE_INSTALL_PREFIX=$INSTALLS/hpx/$VERSION \
    -DHPX_WITH_FETCH_ASIO=ON \
    -DHPX_WITH_MALLOC="system" \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    -DHPX_WITH_CXX_STANDARD=23 .


mkdir -p $INSTALLS/hpx
rm -rf $INSTALLS/hpx/$VERSION
mkdir -p $INSTALLS/hpx/$VERSION

cd build/$VERSION
cmake --build . --target install
cd ..
