diff --git a/Makefile b/Makefile
index 50874ff..edcaecd 100644
--- a/Makefile
+++ b/Makefile
@@ -1,3 +1,5 @@
+PREFIX=/usr/local
+
 .PHONY: fmt clean
 
 _bin/vpn-ca: vpn-ca/main.go
@@ -8,3 +10,6 @@ fmt:
 
 clean:
 	rm -f _bin/*
+
+install: _bin/vpn-ca
+	install -D _bin/vpn-ca $(DESTDIR)$(PREFIX)/bin/vpn-ca
