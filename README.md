# Celestial Ephemera

This is an art project that uses Cinder to create a visualization of bluetooth traffic near it.  Please see [docs/Concept.md](docs/Concept.md) for more information

## To Build
1. Download the latest version of Cinder and unzip along side this repository.( I am using cinder 0.8.6 )
2. install ninja and then cmake
2. in the directory where Cinder exists, `ln -s Cinder latest`
3. run `./update.sh` which will generate the ninja files
4. `cd build-ninja`
5. `ninja`
6. Now you can run celestial from the `bin/` directory.
