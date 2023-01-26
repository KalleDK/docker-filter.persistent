VERSION=1.8
REV=1
ARCH=all
NAME=dockerfilter-persistent
BUILD_DIR=build

PACKAGE_NAME=${NAME}_${VERSION}_${REV}_${ARCH}

deb:
	@mkdir -p ${BUILD_DIR}/${PACKAGE_NAME}
	
	@mkdir -p ${BUILD_DIR}/${PACKAGE_NAME}/usr/share/netfilter-persistent/plugins.d
	@cp plugins/* ${BUILD_DIR}/${PACKAGE_NAME}/usr/share/netfilter-persistent/plugins.d/
	@chmod +x ${BUILD_DIR}/${PACKAGE_NAME}/usr/share/netfilter-persistent/plugins.d/*

	@mkdir -p ${BUILD_DIR}/${PACKAGE_NAME}/lib/systemd/system
	@cp service/* ${BUILD_DIR}/${PACKAGE_NAME}/lib/systemd/system/

	@mkdir -p ${BUILD_DIR}/${PACKAGE_NAME}/DEBIAN
	@cp DEBIAN/* ${BUILD_DIR}/${PACKAGE_NAME}/DEBIAN
	@sed -i "s/Version:.*/Version: ${VERSION}/" ${BUILD_DIR}/${PACKAGE_NAME}/DEBIAN/control

	@dpkg-deb --build --root-owner-group ${BUILD_DIR}/${PACKAGE_NAME}

clean:
	rm -rf ${BUILD_DIR}



