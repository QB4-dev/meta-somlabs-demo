#!/bin/sh
cat << EOF
Content-Type: text/html; charset=UTF-8

EOF

cat << EOF
<pre>
EOF
tail -n 50 /var/log/messages
cat << EOF
</pre>
EOF
