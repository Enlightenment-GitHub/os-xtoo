# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

EGO_SRC=github.com/rackspace/${PN}
EGO_PN=${EGO_SRC}/...

MY_PV=${PV/_/-}
MY_PV=${MY_PV/beta1/beta.1}

if [[ ${PV} = *9999* ]]; then
	ECLASS="golang-vcs"
else
	KEYWORDS="~amd64"
	SRC_URI="https://${EGO_SRC}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"
	ECLASS="golang-vcs-snapshot"
fi

inherit golang-build ${ECLASS}

DESCRIPTION="A CLI for Rackspace"
HOMEPAGE="https://${EGO_SRC}"
LICENSE="Apache-2.0"
SLOT="0"

CDEPEND="
	dev-go/go-ini
	dev-go/gophercloud
"
DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}"

src_prepare() {
	default
	sed -i -e "s|gopkg.in/ini.v1|go-ini/ini|" \
		src/${EGO_SRC}/util/util.go || die "Error fixing ini name"
}

src_install() {
	golang-build_src_install
	dobin bin/*
}
