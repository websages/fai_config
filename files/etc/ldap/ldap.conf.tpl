uri  ldaps://freyr.websages.com
base dc=websages,dc=com
ldap_version 3
scope sub
TLS_CACERT /etc/ldap/ssl/domain_trustchain.pem
# sudo-ldap uses this one but not the one above... ugh
TLS_CACERTFILE /etc/ldap/ssl/domain_trustchain.pem
TLS_REQCERT allow
binddn cn=LDAP Anonymous,ou=Special,dc=websages,dc=com
bindpw ~ANON_SECRET~
pam_filter objectclass=posixAccount
pam_login_attribute uid
pam_crypt local
pam_password md5
sudoers_base ou=sudoers,dc=websages,dc=com
#sudoers_debug 5
ssl yes
