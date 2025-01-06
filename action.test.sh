#!/bin/sh

set -ue

main() {
	e="github-actions[bot]"

	a=$(git config get user.name)
	if [ "$a" != "$e" ]; then
		echo "Expected user.name to be '$e', but got '$a'."
		return 1
	fi

	e="41898282+$e@users.noreply.github.com"

	a=$(git config get user.email)
	if [ "$a" != "$e" ]; then
		echo "Expected user.email to be '$e', but got '$a'."
		return 1
	fi

	return 0
}

main "$@"
