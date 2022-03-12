#!/usr/bin/env bash
# Start the supervisor daemon
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf

# Starting app...
exec "$@"