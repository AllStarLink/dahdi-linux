## Important Note
This is a Debian quilt-compatible build for the dahdi-linux
package from https://github.com/asterisk/dahdi-linux. Do not
file issues/bugs with that project from these packages.

## Building the .deb

1. Download the latest release from https://github.com/asterisk/dahdi-linux

2. Rename the file to something like `dahdi-linux_3.3.0.orig.tar.gz`. Note
the underscore and the .orig notation.

3. Uncompress the file using `tar xvfz`

4. Copy the `debian/` directory from this project to the `dahdi-linux-3.3.0`
folder.

5. Run `dpkg-buildpackage`
