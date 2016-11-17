# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

HOMEPAGE="https://github.com/neo-technologies/${PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${HOMEPAGE}.git"
else
	SRC_URI="${HOMEPAGE}/archive/${PN}-master.tar.gz -> ${P}.tar.gz"
fi

inherit ${ECLASS} toolchain-funcs

DESCRIPTION="Tools for unpacking and repacking boot.img"

LICENSE="Apache-2.0 BSD all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-libs/openssl:0"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -i -e 's/LDFLAGS ?=/LDFLAGS = ${USER_LDFLAGS} /' Makefile || die
}
src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" USER_LDFLAGS="${LDFLAGS}"
}
src_install() {
	# File collision with vanilla Android tools
	# Preffix with rk to match other rk tools
	newbin mkbootimg rkmkbootimg
	newbin afptool rkafptool
	newbin unmkbootimg rkunmkbootimg
	newbin mkrootfs rkmkrootfs
	newbin mkcpiogz rkmkcpiogz
	newbin unmkcpiogz rkunmkcpiogz
	newbin img_maker rkimg_maker
}
pkg_postinst() {
	elog "Renamed mkbootimg rkmkbootimg"
	elog "Renamed afptool rkafptool"
	elog "Renamed unmkbootimg rkunmkbootimg"
	elog "Renamed mkrootfs rkmkrootfs"
	elog "Renamed mkcpiogz rkmkcpiogz"
	elog "Renamed unmkcpiogz rkunmkcpiogz"
	elog "Renamed img_maker rkimg_maker"
}
