#!/bin/sh

set -ue

main() {
	status=0

	log "[info] Fetching GitHub Actions bot's profile."

	res=$(fetch) || status=$?
	if [ $status -ne 0 ]; then
		log "[error] Failed to fetch GitHub Actions bot's profile with status '$status'."
		return $status
	fi

	log "[info] Successfully fetched GitHub Actions bot's profile."

	log "[info] Configuring Git with GitHub Actions bot's profile."

	configure "$res" || status=$?
	if [ $status -ne 0 ]; then
		log "[error] Failed to configure Git with GitHub Actions bot's profile with status '$status'."
		return $status
	fi

	log "[info] Successfully configured Git with GitHub Actions bot's profile."

	return $status
}

fetch() {
	curl --show-error --silent \
		--header "Accept: application/json" \
		"https://api.github.com/users/github-actions%5Bbot%5D"
}

configure() {
	lo=$(echo "$1" | jq --raw-output ".login")
	id=$(echo "$1" | jq --raw-output ".id")
	git config user.name "$lo"
	git config user.email "$id+$lo@users.noreply.github.com"
}

log() {
	m="$1"

	case "$m" in
	"[info]"*)
		p=$(echo "$m" | cut -d" " -f1)
		r=$(echo "$m" | cut -d" " -f2-)
		m="$p  $r"
		;;
	esac

	printf "%b" "$m\n"
}

main "$@"
