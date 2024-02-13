EPOCHVER = 1:
RELVER = 3.3.0
DEBVER = 3+asl
PKGNAME = dahdi-linux

deb:
	( cd .. && \
		rm -f $(PKGNAME)_$(RELVER).orig.tar.tgz && \
		rm -rf $(PKGNAME)-$(RELVER) && \
		wget -O $(PKGNAME)_$(RELVER).orig.tar.gz \
			https://github.com/asterisk/dahdi-linux/releases/download/v$(RELVER)/$(PKGNAME)-$(RELVER).tar.gz && \
		tar xvfz dahdi-linux_$(RELVER).orig.tar.gz && \
		cp -r dahdi-linux/debian dahdi-linux-$(RELVER) )
	cd ../dahdi-linux-$(RELVER) && debuild -uc -us

debchange:
	debchange -v $(EPOCHVER)$(RELVER)-$(DEBVER)
	debchange -r
