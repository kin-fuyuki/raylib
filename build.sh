export ANDROID_NDK=~/Android/Sdk/ndk/29.0.13846066/

rm include -rf
mkdir include
cp src/raylib.h include/
cp src/raymath.h include/
cp src/rlgl.h include/
cp src/rcamera.h include/

cd linux-64
cmake -DPLATFORM=Desktop ..
cd raylib
make RAYLIB_LIBTYPE=STATIC -j16 CFLAGS="-O3"
cd ../..
: <<'COMMENT'
cd wxp
cmake -DPLATFORM=Desktop \
      -DGRAPHICS=GRAPHICS_API_OPENGL_21 \
      -DCMAKE_C_FLAGS="-m32" \
      -DCMAKE_EXE_LINKER_FLAGS="-static -m32" \
      -DCMAKE_SYSTEM_NAME=Windows ..
cd raylib
make RAYLIB_LIBTYPE=STATIC -j16 CFLAGS="-O3"
cd ../..
cd w7-32
cmake -DPLATFORM=Desktop \
      -DGRAPHICS=GRAPHICS_API_OPENGL_21 \
      -DCMAKE_C_FLAGS="-m32" \
      -DCMAKE_SYSTEM_NAME=Windows ..
cd raylib
make RAYLIB_LIBTYPE=STATIC -j16 CFLAGS="-O3"
cd ../..
cd w7-64
cmake -DPLATFORM=Desktop \
      -DGRAPHICS=GRAPHICS_API_OPENGL_31 \
      -DCMAKE_SYSTEM_NAME=Windows ..
cd raylib
make RAYLIB_LIBTYPE=STATIC -j16 CFLAGS="-O3"
cd ../..
cd w1x-64
cmake -DPLATFORM=Desktop -DCMAKE_SYSTEM_NAME=Windows ..
cd raylib
make RAYLIB_LIBTYPE=STATIC -j16 CFLAGS="-O3"
cd ../..
cd android
cmake -DPLATFORM=Android \
      -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
      -DANDROID_ABI="arm64-v8a" \
      -DANDROID_PLATFORM=android-21 ..
cd raylib
make RAYLIB_LIBTYPE=STATIC -j16 CFLAGS="-O3"
cd ../..
COMMENT