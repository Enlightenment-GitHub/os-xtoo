# Copyright 2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

# Based on ebuild from enlightenment-live overlay
# Copyright 1999-2016 Gentoo Foundation

EAPI="6"

BASE_URI="enlightenment.org"

if [[ ${PV} == 9999 ]]; then
	ECLASS="autotools git-r3"
	EGIT_REPO_URI="https://git.${BASE_URI}/apps/${PN}.git"
else
	SRC_URI="https://download.${BASE_URI}/rel/apps/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

inherit eutils ${ECLASS}

DESCRIPTION="This is a Video + Audio player mplayer style, based on EFL"
HOMEPAGE="https://www.enlightenment.org/about-rage"
LICENSE="BSD-2"
SLOT="0"

# TODO vlc USE flag is disabled for the moment, should be re-enabled once EFL has the same USE flag
# TODO Must fix IUSE, RDEPEND for the vlc USE flag on efl and for the flag itself
IUSE="gstreamer xine"

RDEPEND="
	|| ( >=dev-libs/efl-1.18.0 ( <dev-libs/efl-1.18.0 >=media-libs/elementary-1.15.1 ) )
	|| ( dev-libs/efl[gstreamer] dev-libs/efl[xine] )
	gstreamer? ( dev-libs/efl[gstreamer] )
	xine? ( dev-libs/efl[xine] )
"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S="${WORKDIR}/${P}"

src_prepare() {
	default
	[[ ${PV} = 9999 ]] && eautoreconf
}

src_install() {
	default
	prune_libtool_files
}
