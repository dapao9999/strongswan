#!/bin/bash

# The MIT License (MIT)
#
# Copyright (c) 2016 Mengdi Gao
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# https://wiki.strongswan.org/projects/strongswan/wiki/ForwardingAndSplitTunneling
# Continue reading: https://wiki.strongswan.org/projects/strongswan/wiki/VirtualIP
sysctl net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o eth0 -j MASQUERADE

# hotfix for openssl `unable to write 'random state'` stderr

# hotfix for https://github.com/gaomd/docker-ikev2-vpn-server/issues/7
rm -f /var/run/starter.charon.pid
echo ": PSK \"$VPN_PSK\"" >/etc/ipsec.secrets
echo "$VPN_USER : XAUTH \"$VPN_PASS\"" >>/etc/ipsec.secrets
# http://wiki.loopop.net/doku.php?id=server:vpn:strongswanonopenvz
ipsec start --nofork --debug
