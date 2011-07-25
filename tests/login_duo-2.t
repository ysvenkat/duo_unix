mockduo with self-signed cert

  $ cd ${TESTDIR}
  $ python mockduo.py certs/selfsigned.pem >/dev/null 2>&1 &
  $ MOCKPID=$!
  $ trap 'exec kill $MOCKPID >/dev/null 2>&1' EXIT
  $ sleep 0.5

Invalid cert
  $ ${BUILDDIR}/login_duo/login_duo -d -c confs/mockduo.conf -f whatever true 2>&1 | head -n 1
  [4] Failsafe Duo login for 'whatever': * certificate * (glob)

With noverify
  $ ${BUILDDIR}/login_duo/login_duo -d -c confs/mockduo_noverify.conf -f preauth-allow true
  [4] Skipped Duo login for 'preauth-allow': you rock