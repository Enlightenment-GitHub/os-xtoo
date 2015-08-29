# Copyright 2015 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

EGO_SRC=github.com/rackspace/${PN}
EGO_PN=${EGO_SRC}/...

MY_PV=${PV/_/-}
MY_PV=${MY_PV/beta1/beta.1}

if [[ ${PV} = *9999* ]]; then
	inherit golang-vcs
else
	KEYWORDS="~amd64"
	SRC_URI="https://${EGO_SRC}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"
	inherit golang-vcs-snapshot
fi

inherit golang-build

DESCRIPTION="A CLI for Rackspace"
HOMEPAGE="https://${EGO_SRC}"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""
CDEPEND="dev-go/gophercloud"
DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}"

src_install() {
        golang-build_src_install
        dobin bin/*
}

