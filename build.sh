export ANDROID_NDK= insert ndk here
cd linux-64
cmake -DPLATFORM=Desktop ..
cd ..
cd wxp
cmake -DPLATFORM=Desktop \
      -DGRAPHICS=GRAPHICS_API_OPENGL_21 \
      -DCMAKE_C_FLAGS="-m32" \
      -DCMAKE_EXE_LINKER_FLAGS="-static -m32" \
      -DCMAKE_SYSTEM_NAME=Windows ..
cd ..
cd w7-32
cmake -DPLATFORM=Desktop \
      -DGRAPHICS=GRAPHICS_API_OPENGL_21 \
      -DCMAKE_C_FLAGS="-m32" \
      -DCMAKE_SYSTEM_NAME=Windows ..
cd ..
cd w7-64
cmake -DPLATFORM=Desktop \
      -DGRAPHICS=GRAPHICS_API_OPENGL_21 \
      -DCMAKE_SYSTEM_NAME=Windows ..
cd ..
cd w1x-64
cmake -DPLATFORM=Desktop -DCMAKE_SYSTEM_NAME=Windows ..
cd ..
cd android
cmake -DPLATFORM=Android \
      -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
      -DANDROID_ABI="arm64-v8a" \
      -DANDROID_PLATFORM=android-21 ..
cd ..
