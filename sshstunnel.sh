#!/bin/bash
echo 'starting.........'
apt-get install dropbear stunnel4 -y
echo '# disabled because OpenSSH is installed
# change to NO_START=0 to enable Dropbear
NO_START=0

# the TCP port that Dropbear listens on
DROPBEAR_PORT=4443

# any additional arguments for Dropbear
DROPBEAR_EXTRA_ARGS=

# specify an optional banner file containing a message to be
# sent to clients before they connect, such as "/etc/issue.net"
DROPBEAR_BANNER=""

# RSA hostkey file (default: /etc/dropbear/dropbear_rsa_host_key)
#DROPBEAR_RSAKEY="/etc/dropbear/dropbear_rsa_host_key"

# DSS hostkey file (default: /etc/dropbear/dropbear_dss_host_key)
#DROPBEAR_DSSKEY="/etc/dropbear/dropbear_dss_host_key"

# Receive window size - this is a tradeoff between memory and
# network performance
DROPBEAR_RECEIVE_WINDOW=65536' > /etc/default/dropbear
echo '# /etc/default/stunnel
# Julien LEMOINE <speedblue@debian.org>
# September 2003

# Change to one to enable stunnel automatic startup
ENABLED=1
FILES="/etc/stunnel/*.conf"
OPTIONS=""

# Change to one to enable ppp restart scripts
PPP_RESTART=0' > /etc/default/stunnel4
echo 'cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

/etc/init.d/stunnel4 start

[dropbear]
connect = 127.0.0.1:4443
accept = 0.0.0.0:443

[ssh]
connect = 127.0.0.1:22
accept = 0.0.0.0:80' > /etc/stunnel/stunnel.conf
echo '-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEAx8FIKw34m/w2G5aKte8XHbYSNe+LtDbr+bg5CbmvIKXC6dD8
xL8if0JNNU4Sb9W2zMRmjKwGDbMbGhvitOPheuZESjxSRmKq/7xectRuTCuvEt5P
3Gjo3SgTvu1X3fpsJaIR5UL/5uECQ8GNUEakr3Ien9WAZsBUJm5gR8lb4OoWY/Bs
ZX8iCywRVdW7vzj46LeNrrQS10bKqiXF9muxxXUvb3a+KlvUdGk/QsIKBK/n4Ovj
0Z2G3ntHTQSvl8t3fo+KvYV2etrLEISev/zvBd/HZnmC+CwKDZVThfB1UJyVHRGm
CxQf7vnMp+/vsQGMV83E2sTX5H1nGuyJlfVw5wIDAQABAoIBAC0fSAIRwdraeg55
TxQR0hLwEeUFG3W2AlACgT/lJd4mE4Vlo/N9iXldrLshy6Bfkk9m/hNAuI1XrAOV
0PwzjbeJVFvAjIVBvIbQMjWWLuQd6gpFFZ0gRZnPd8ZlLrgB3XQSzCARpmSs5yoP
CrDbhE/tY2WPgNW1FE0qGa2dmpePYxm9mmISlLfgOBfXTC1l3ESw5wnjXRiVBclW
oS5y26J0JOXRgd8B5nP+s/RALwhDKdkecHFsUwBgoc2XSGZ6HcKyhBgs9MFSPBSi
egGpKHBn4++y5YnstUeVJI+EULtq+yz0XmbXqTeCpLvK0uz4T4LgsEehNg3xEwET
uR0jGwECgYEA5fW8nwEEWbk+dcEaPbzpDv/HevyvNdqqcVjArwo4X8MeJMNF7ZVR
NKhC/VTf1t13NdGO3Bgnt1hTOuHuL0Pf6+WtdQfOAvh7bpUpduuh+dsAh959Q0NK
41RqXakOTTiVFD4uyK3kqWIXFf9rWb3yQSaF90VTCq9KTwAiZB3JPIcCgYEA3l/w
6YztfPNs0BSR66HabvMnnyHlM2GzjJoERsUeU16vur8rxUxqm4uX59Fzvzc7JjFA
gUJnjd5+Veh5qEcmMqE/fGGoApVpb5er+GBNOcHvSjDIEqmQ26sVlZDrSGauXfDP
KYjL20bjMYg5Et/7XUKR1H7MzQPTsRKUkg1eoKECgYEA42Jon4Ue6yVr6H4H15JL
lWQ/uJHRIlxU+v06khp2AeLqlIluRO3HvVy/2MWrDEgyz0mmjGVqKDYzHl826Q+h
hB24tacBAxj23DKsLIX0xR3TWYYbsH4Ct+TJxFEc7iiL6NdP5WllWEPA9iR43uUe
fWN9RjMLWN5ZiOJmHz8AtFMCgYEAqIQMDPC/B/FwhD8SVX5SCcI6RF1rU4S2i9Yr
Z3X5hTQ790jn4pwGLdmbRBF1pXI1YLvyJgIsd1YkZvXFO8CvMa8AbUGUEGEphWdq
6s4Pt7U/oPlWpM3a+JytvqoTosotWQMj+lWwJnuRr/eLSMJzuji4Sk/M45AC3C04
aXW4QAECgYEAyTOD6qA9yLmbzo+w2CozHRnAemB6c25pf7elQFplepJVmOwoGrQn
jNy677Y9ypulz8a7G71pSGWlHV+gfT7pG0nxYY0Vo5atf2pZdAwuL4BzJZ8N3NTY
pHoUHF5yqASJiRFTyXgFtpsPRzLGmeoc9hHlHXcRNLEt7esABytT2QE=
-----END RSA PRIVATE KEY-----
-----BEGIN CERTIFICATE-----
MIIEFTCCAv2gAwIBAgIJAILKvoPPe1aCMA0GCSqGSIb3DQEBCwUAMIGgMQswCQYD
VQQGEwJJRDELMAkGA1UECAwCSlQxEzARBgNVBAcMClB1cndva2VydG8xIDAeBgNV
BAoMFzxoMT5OZ2lzaW5nLGNvLGx0ZDwvaDE+MSswKQYDVQQLDCI8L2gxCAg+PGgx
Pm5naXNpbmctbmdvcGV0Lmx0ZDwvaDE+MSAwHgYJKoZIhvcNAQkBFhFwcm9fYXJt
eUBsaXZlLmNvbTAeFw0xODAxMTAxODEyNTZaFw0yMTAxMDkxODEyNTZaMIGgMQsw
CQYDVQQGEwJJRDELMAkGA1UECAwCSlQxEzARBgNVBAcMClB1cndva2VydG8xIDAe
BgNVBAoMFzxoMT5OZ2lzaW5nLGNvLGx0ZDwvaDE+MSswKQYDVQQLDCI8L2gxCAg+
PGgxPm5naXNpbmctbmdvcGV0Lmx0ZDwvaDE+MSAwHgYJKoZIhvcNAQkBFhFwcm9f
YXJteUBsaXZlLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMfB
SCsN+Jv8NhuWirXvFx22EjXvi7Q26/m4OQm5ryClwunQ/MS/In9CTTVOEm/VtszE
ZoysBg2zGxob4rTj4XrmREo8UkZiqv+8XnLUbkwrrxLeT9xo6N0oE77tV936bCWi
EeVC/+bhAkPBjVBGpK9yHp/VgGbAVCZuYEfJW+DqFmPwbGV/IgssEVXVu784+Oi3
ja60EtdGyqolxfZrscV1L292vipb1HRpP0LCCgSv5+Dr49Gdht57R00Er5fLd36P
ir2FdnrayxCEnr/87wXfx2Z5gvgsCg2VU4XwdVCclR0RpgsUH+75zKfv77EBjFfN
xNrE1+R9ZxrsiZX1cOcCAwEAAaNQME4wHQYDVR0OBBYEFLRgf3UEournZo1xa7xF
T6OOxIilMB8GA1UdIwQYMBaAFLRgf3UEournZo1xa7xFT6OOxIilMAwGA1UdEwQF
MAMBAf8wDQYJKoZIhvcNAQELBQADggEBAFZyX6Hbvf7QH5AzSNEmClSqtg3YjIs+
u4dSdfU2oHXuHAClEnR6+N8X5CoyAs2Do8Dydap7zb2DlQgGMPZT7s4zz9FuqPbH
0OCwTNIsEfYVXIxIsYBaIqAQQdD8lcCgHsXQovKUezoFeBwLuGAM/pPFRPwQxbX/
8ql41LREJ4dM6wgl4KLHBsJFHB/c2UJdmXQz/F34mFTch+TLREsi6IkN8X9bNfe+
jrEWHr4bc4EOVdx9HwaoHErubSv+6a7sv92lGk4vS67RBNnfp0AtXydW71PLEK+S
KNF3bPY45eQw09bsz7OY0E77Dn9HiPmfRmgN2SrOt/qhbutKIzt12dE=
-----END CERTIFICATE-----' > /etc/stunnel/stunnel.pem
/etc/init.d/dropbear start
/etc/init.d/stunnel start
echo -e '#!/bin/bash
Login=$1
Pass=$2
masaaktif=$3

IP=`curl -s checkip.dyndns.org | sed -e "s/.*Current IP Address: //' -e 's/<.*$//"`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /sbin/nologin -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Informasi SSH"
echo -e "=========-account-=========="
echo -e "Host: $IP"
echo -e "Port: 443, dropbear(SSL)"
echo -e "port: 22, openssh"
echo -e "Username: $Login "
echo -e "Password: $Pass"
echo -e "-----------------------------"
echo -e "Aktif Sampai: $exp"
echo -e "==========================="' > /usr/bin/create-user
chmod +x /usr/bin/create-user
echo 'auto script OK untuk create gunakan command create-user $username $pass $masa aktif'
rm -f *.sh
