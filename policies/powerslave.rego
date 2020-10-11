package policies

import input
import data.powerslave.acl

greeting = msg {
    info := opa.runtime()
    hostname := info.env["HOSTNAME"] # Docker sets the HOSTNAME environment variable.
    msg := sprintf("hello from container %q!", [hostname])
}

default allow = false

allow {
	band
        msg := sprintf("Policy %+v succesfully executed", band)
}

band = true {
    data.powerslave.acl.users[_] == input.user
    data.powerslave.acl.method[_] == input.method
    data.powerslave.acl.path == input.path 
}