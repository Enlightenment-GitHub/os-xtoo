# Copyright 2015 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

EGO_SRC=github.com/rackspace/${PN}
EGO_PN=${EGO_SRC}/...

if [[ ${PV} = *9999* ]]; then
	inherit golang-vcs
else
	KEYWORDS="~amd64"
	SRC_URI="https://${EGO_SRC}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	inherit golang-vcs-snapshot
fi

inherit golang-build

DESCRIPTION="The Go SDK for Openstack"
HOMEPAGE="https://${EGO_SRC}"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""
CDEPEND="dev-go/mapstructure
	=dev-go/perigee-9999"
DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}"
