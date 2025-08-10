EPOCHVER = 1:
RELVER = 3.4.0
DEBVER = 6+asl
PKGNAME = dahdi-linux
RELPLAT ?= deb$(shell lsb_release -rs 2> /dev/null)

deb:	debprep
	debchange --distribution stable --package $(PKGNAME) \
        --newversion $(EPOCHVER)$(RELVER)-$(DEBVER).$(RELPLAT) \
		"Autobuild of $(EPOCHVER)$(RELVER)-$(DEBVER) for $(RELPLAT)"
	cd ../dahdi-linux-$(RELVER) && debuild -uc -us
	git checkout debian/changelog

debprep:	debclean
	( cd .. && \
		rm -f $(PKGNAME)_$(RELVER).orig.tar.tgz && \
		rm -rf $(PKGNAME)-$(RELVER) && \
		wget -O $(PKGNAME)_$(RELVER).orig.tar.gz \
			https://github.com/asterisk/dahdi-linux/releases/download/v$(RELVER)/$(PKGNAME)-$(RELVER).tar.gz && \
		tar xvfz dahdi-linux_$(RELVER).orig.tar.gz && \
		echo "$(RELVER)-$(DEBVER)" > dahdi-linux-$(RELVER)/.version && \
		rm dahdi-linux_$(RELVER).orig.tar.gz && \
		tar cvfz dahdi-linux_$(RELVER).orig.tar.gz dahdi-linux-$(RELVER) && \
		cp -r dahdi-linux/debian dahdi-linux-$(RELVER) )
debchange:
	debchange -v $(EPOCHVER)$(RELVER)-$(DEBVER)
	debchange -r

debclean:
	rm -rf ../$(PKGNAME)_$(RELVER)*
	rm -rf ../$(PKGNAME)-$(RELVER)*
	rm -rf ../dahdi-dkms_$(RELVER)* ../dahdi-source_$(RELVER)*
	rm -rf debian/$(PKGNAME)
	rm -f debian/files
	rm -rf debian/.debhelper/
	rm -f debian/debhelper-build-stamp
	rm -f debian/*.substvars
	rm -rf debian/$(PKGNAME)/ debian/.debhelper/
	rm -f debian/debhelper-build-stamp debian/files debian/mfamily-scripts.substvars

