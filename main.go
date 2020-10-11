package main

import (
	"github.com/open-policy-agent/opa/rego"
    "fmt"
    "io/ioutil"
)

func check(e error) {
    if e != nil {
        panic(e)
    }
}

func main() {

    module := readFile("module")
    query := "x = data.example.authz.allow"

    err := queryGen(query, module)
    check(err)
    
}

func readFile(filename string)  string {
    dat, err := ioutil.ReadFile(filename)
    check(err)
    return string(dat)
}

func queryGen(query string, module string) error{
    query, err := rego.New(
        rego.Query(query),
        rego.Module("test.rego".module),
    ).PrepareForEval(ctx)

    if err!= nil {
        return err
    }

    return nil
}