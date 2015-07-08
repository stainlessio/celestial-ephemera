if [ ! -x build-Ninja ]; then
  ./update.sh
fi

cd build-Ninja && ninja && ./bin/celestial.app/Contents/MacOS/celestial
